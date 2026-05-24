<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('driver_profiles', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained()->onDelete('cascade');
            $table->string('ktp_photo')->nullable();
            $table->string('sim_photo')->nullable();
            $table->string('stnk_photo')->nullable();
            $table->string('selfie_photo')->nullable();
            $table->string('vehicle_type')->default('motor'); // motor, mobil
            $table->string('vehicle_brand')->nullable();
            $table->string('vehicle_plate')->nullable();
            $table->integer('passenger_capacity')->default(1);
            $table->boolean('is_online')->default(false);
            $table->decimal('location_lat', 10, 8)->nullable();
            $table->decimal('location_lng', 11, 8)->nullable();
            $table->string('status')->default('pending'); // pending, approved, suspended
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('driver_profiles');
    }
};
