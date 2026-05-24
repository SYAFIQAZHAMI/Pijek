<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DriverProfile extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'ktp_photo',
        'sim_photo',
        'stnk_photo',
        'selfie_photo',
        'vehicle_type',
        'vehicle_brand',
        'vehicle_plate',
        'passenger_capacity',
        'is_online',
        'location_lat',
        'location_lng',
        'status'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
