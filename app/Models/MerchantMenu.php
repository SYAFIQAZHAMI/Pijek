<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MerchantMenu extends Model
{
    use HasFactory;

    protected $fillable = [
        'merchant_id',
        'name',
        'category',
        'description',
        'price',
        'photo',
        'is_available'
    ];

    public function merchant()
    {
        return $this->belongsTo(MerchantProfile::class, 'merchant_id');
    }
}
