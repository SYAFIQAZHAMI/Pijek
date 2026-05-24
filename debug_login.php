<?php
require __DIR__.'/vendor/autoload.php';
$app = require_once __DIR__.'/bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Http\Kernel::class);
$kernel->handle(Illuminate\Http\Request::capture());

$email = 'admin@admin.com';
$password = 'admin';

$user = \App\Models\User::where('email', $email)->first();

if (!$user) {
    echo "USER NOT FOUND\n";
} else {
    echo "USER FOUND: " . $user->name . "\n";
    echo "IS ACTIVE: " . ($user->is_active ? 'YES' : 'NO') . "\n";
    echo "ROLE: " . $user->role . "\n";
    if (\Illuminate\Support\Facades\Hash::check($password, $user->password)) {
        echo "PASSWORD MATCH: YES\n";
    } else {
        echo "PASSWORD MATCH: NO\n";
    }
}
