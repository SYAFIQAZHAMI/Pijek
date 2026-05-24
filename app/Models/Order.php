<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id', 'driver_id', 'merchant_id', 'service_type',
        'pickup_location', 'pickup_lat', 'pickup_lng',
        'dropoff_location', 'dropoff_lat', 'dropoff_lng',
        'price', 'distance', 'status', 'payment_method', 'notes',
        'sender_name', 'sender_phone', 'recipient_name', 'recipient_phone',
        'item_details', 'proof_of_delivery_photo', 'is_night_shift'
    ];

    public function user() { return $this->belongsTo(User::class); }
    public function driver() { return $this->belongsTo(User::class, 'driver_id'); }
    public function merchant() { return $this->belongsTo(MerchantProfile::class, 'merchant_id'); }
    public function items() { return $this->hasMany(OrderItem::class); }
}
