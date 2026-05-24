<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MerchantProfile extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'name',
        'address',
        'ktp_photo',
        'business_photo',
        'bank_account',
        'bank_name',
        'status',
        'is_open',
        'opening_hours',
        'location_lat',
        'location_lng',
        'rating'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function menus()
    {
        return $this->hasMany(MerchantMenu::class, 'merchant_id');
    }
}
