<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Order;

class OrderController extends Controller
{
    public function create(Request $request)
    {
        $request->validate([
            'service_type' => 'required|in:ride,car,food,send',
            'pickup_lat' => 'required|numeric',
            'pickup_lng' => 'required|numeric',
            'dropoff_lat' => 'required|numeric',
            'dropoff_lng' => 'required|numeric',
            'price' => 'required|numeric',
        ]);

        $order = Order::create([
            'user_id' => $request->user()->id,
            'service_type' => $request->service_type,
            'pickup_location' => $request->pickup_location,
            'pickup_lat' => $request->pickup_lat,
            'pickup_lng' => $request->pickup_lng,
            'dropoff_location' => $request->dropoff_location,
            'dropoff_lat' => $request->dropoff_lat,
            'dropoff_lng' => $request->dropoff_lng,
            'price' => $request->price,
            'payment_method' => $request->payment_method ?? 'cash',
            'notes' => $request->notes,
            'status' => 'pending'
        ]);

        return response()->json([
            'message' => 'Order created successfully',
            'order' => $order
        ], 201);
    }

    public function show($id)
    {
        $order = Order::with(['driver', 'merchant', 'items'])->findOrFail($id);
        return response()->json($order);
    }

    public function updateStatus(Request $request, $id)
    {
        $order = Order::findOrFail($id);
        
        $request->validate([
            'status' => 'required|in:accepted,picking_up,on_delivery,completed,cancelled'
        ]);

        $order->update(['status' => $request->status]);

        return response()->json([
            'message' => 'Order status updated',
            'order' => $order
        ]);
    }

    public function history(Request $request)
    {
        $orders = Order::where('user_id', $request->user()->id)->latest()->get();
        return response()->json($orders);
    }
}
