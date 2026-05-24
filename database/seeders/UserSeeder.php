<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use App\Models\User;

class UserSeeder extends Seeder
{
    public function run()
    {
        User::create([
            'name' => 'Super Admin',
            'email' => 'admin@pijek.com',
            'phone' => '081234567890',
            'role' => 'admin',
            'password' => Hash::make('password123'),
        ]);

        User::create([
            'name' => 'Test User',
            'email' => 'user@pijek.com',
            'phone' => '081234567891',
            'role' => 'user',
            'password' => Hash::make('password123'),
        ]);
        
        User::create([
            'name' => 'Test Driver',
            'email' => 'driver@pijek.com',
            'phone' => '081234567892',
            'role' => 'driver',
            'password' => Hash::make('password123'),
        ]);
    }
}
