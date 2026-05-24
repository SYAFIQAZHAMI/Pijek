<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\DriverProfile;
use App\Models\Order;

class DriverController extends Controller
{
    public function register(Request $request)
    {
        $user = $request->user();
        
        $request->validate([
            'vehicle_type' => 'required|in:motor,mobil',
            'vehicle_plate' => 'required|string',
        ]);

        $profile = DriverProfile::updateOrCreate(
            ['user_id' => $user->id],
            [
                'vehicle_type' => $request->vehicle_type,
                'vehicle_brand' => $request->vehicle_brand,
                'vehicle_plate' => $request->vehicle_plate,
                'status' => 'pending' // pending admin approval
            ]
        );

        $user->update(['role' => 'driver']);

        return response()->json([
            'message' => 'Driver profile created, waiting for approval',
            'profile' => $profile
        ]);
    }

    public function updateStatus(Request $request)
    {
        $request->validate([
            'is_online' => 'required|boolean',
            'location_lat' => 'nullable|numeric',
            'location_lng' => 'nullable|numeric'
        ]);

        $profile = $request->user()->driverProfile;
        
        if ($profile) {
            $profile->update($request->only(['is_online', 'location_lat', 'location_lng']));
            return response()->json(['message' => 'Status updated', 'profile' => $profile]);
        }

        return response()->json(['message' => 'Profile not found'], 404);
    }

    public function pendingOrders(Request $request)
    {
        // Simple radius or generic pending fetch
        $orders = Order::where('status', 'pending')
                       ->whereIn('service_type', ['ride', 'car', 'send'])
                       ->get();
                       
        return response()->json($orders);
    }
}
