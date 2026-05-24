<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\Api\DriverController;
use App\Http\Controllers\Api\MerchantController;
use App\Http\Controllers\Api\OrderController;

Route::get('/', function() {
    return response()->json(['message' => 'Welcome to PIJEK API']);
});

Route::post('/login', [AuthController::class, 'login']);
Route::post('/register', [AuthController::class, 'register']);

Route::middleware('auth:sanctum')->group(function () {
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::get('/profile', [AuthController::class, 'profile']);
    
    // User endpoints
    Route::prefix('user')->group(function () {
        Route::put('/profile', [UserController::class, 'updateProfile']);
        Route::get('/history', [OrderController::class, 'history']);
    });
    
    // Driver endpoints
    Route::prefix('driver')->group(function () {
        Route::post('/register', [DriverController::class, 'register']);
        Route::put('/status', [DriverController::class, 'updateStatus']);
        Route::get('/orders', [DriverController::class, 'pendingOrders']);
    });
    
    // Merchant endpoints
    Route::prefix('merchant')->group(function () {
        Route::post('/register', [MerchantController::class, 'register']);
        Route::get('/menus', [MerchantController::class, 'getMenus']);
        Route::post('/menus', [MerchantController::class, 'addMenu']);
    });
    
    // Order endpoints (Ride, Car, Food, Send)
    Route::post('/orders', [OrderController::class, 'create']);
    Route::get('/orders/{id}', [OrderController::class, 'show']);
    Route::put('/orders/{id}/status', [OrderController::class, 'updateStatus']);

    // Admin endpoints
    Route::middleware('role:admin')->prefix('admin')->group(function () {
        Route::get('/users', [UserController::class, 'index']);
        Route::get('/dashboard-stats', function () {
            return response()->json([
                'total_orders' => \App\Models\Order::count(),
                'active_drivers' => \App\Models\DriverProfile::where('is_online', true)->count(),
                'total_merchants' => \App\Models\MerchantProfile::count(),
            ]);
        });
    });
});
