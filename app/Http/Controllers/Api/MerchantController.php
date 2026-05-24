<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\MerchantProfile;
use App\Models\MerchantMenu;

class MerchantController extends Controller
{
    public function register(Request $request)
    {
        $user = $request->user();
        
        $request->validate([
            'name' => 'required|string',
            'address' => 'required|string',
        ]);

        $profile = MerchantProfile::updateOrCreate(
            ['user_id' => $user->id],
            [
                'name' => $request->name,
                'address' => $request->address,
                'status' => 'pending'
            ]
        );

        $user->update(['role' => 'merchant']);

        return response()->json([
            'message' => 'Merchant profile created, waiting for approval',
            'profile' => $profile
        ]);
    }

    public function getMenus(Request $request)
    {
        $merchant = $request->user()->merchantProfile;
        if (!$merchant) {
            return response()->json(['message' => 'Merchant not found'], 404);
        }

        return response()->json($merchant->menus);
    }

    public function addMenu(Request $request)
    {
        $merchant = $request->user()->merchantProfile;
        if (!$merchant) {
            return response()->json(['message' => 'Merchant not found'], 404);
        }

        $request->validate([
            'name' => 'required|string',
            'price' => 'required|numeric',
        ]);

        $menu = $merchant->menus()->create($request->all());

        return response()->json([
            'message' => 'Menu added',
            'menu' => $menu
        ]);
    }
}
