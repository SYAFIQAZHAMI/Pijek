<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use App\Models\User;

class UserSeeder extends Seeder
{
    public function run()
    {
        User::updateOrCreate(
            ['phone' => '081234567890'],
            [
                'name' => 'Super Admin',
                'email' => 'admin@pijek.com',
                'role' => 'admin',
                'password' => Hash::make('password123'),
            ]
        );

        User::updateOrCreate(
            ['phone' => '081234567891'],
            [
                'name' => 'Test User',
                'email' => 'user@pijek.com',
                'role' => 'user',
                'password' => Hash::make('password123'),
            ]
        );
        
        User::updateOrCreate(
            ['phone' => '081234567892'],
            [
                'name' => 'Test Driver',
                'email' => 'driver@pijek.com',
                'role' => 'driver',
                'password' => Hash::make('password123'),
            ]
        );
    }
}
