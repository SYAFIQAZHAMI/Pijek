<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $fillable = [
        'name',
        'email',
        'phone',
        'password',
        'role',
        'fcm_token',
        'referral_code',
        'referred_by'
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function driverProfile()
    {
        return $this->hasOne(DriverProfile::class);
    }

    public function merchantProfile()
    {
        return $this->hasOne(MerchantProfile::class);
    }

    public function wallet()
    {
        return $this->hasOne(Wallet::class);
    }

    public function isAdmin() { return $this->role === 'admin'; }
    public function isDriver() { return $this->role === 'driver'; }
    public function isMerchant() { return $this->role === 'merchant'; }
    public function isUser() { return $this->role === 'user'; }
}
