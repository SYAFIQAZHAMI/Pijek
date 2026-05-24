<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\LocationShift;

class LocationShiftSeeder extends Seeder
{
    public function run()
    {
        $locations = [
            [
                'name' => 'Gate IMIP',
                'location_lat' => -2.825121, // Approximate coords for Bahodopi area
                'location_lng' => 122.158142,
                'type' => 'industry',
                'peak_hours_start' => '06:00',
                'peak_hours_end' => '08:00',
            ],
            [
                'name' => 'Mess Pekerja',
                'location_lat' => -2.830000,
                'location_lng' => 122.160000,
                'type' => 'residential',
                'peak_hours_start' => '17:00',
                'peak_hours_end' => '19:00',
            ],
            [
                'name' => 'Area Huabao Indonesia',
                'location_lat' => -2.810000,
                'location_lng' => 122.140000,
                'type' => 'industry',
                'peak_hours_start' => '06:00',
                'peak_hours_end' => '08:00',
            ],
            [
                'name' => 'Pelabuhan Bahodopi',
                'location_lat' => -2.800000,
                'location_lng' => 122.150000,
                'type' => 'port',
                'peak_hours_start' => '12:00',
                'peak_hours_end' => '14:00',
            ],
            [
                'name' => 'Kos Pekerja',
                'location_lat' => -2.840000,
                'location_lng' => 122.170000,
                'type' => 'residential',
                'peak_hours_start' => '18:00',
                'peak_hours_end' => '20:00',
            ]
        ];

        foreach ($locations as $loc) {
            LocationShift::updateOrCreate(
                ['name' => $loc['name']],
                $loc
            );
        }
    }
}
