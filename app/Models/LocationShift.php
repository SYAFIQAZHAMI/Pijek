<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LocationShift extends Model
{
    use HasFactory;

    protected $fillable = [
        'name', 'location_lat', 'location_lng', 'type',
        'peak_hours_start', 'peak_hours_end', 'is_active'
    ];
}
