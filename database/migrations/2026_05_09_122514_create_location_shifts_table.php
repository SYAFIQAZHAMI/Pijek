<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('location_shifts', function (Blueprint $table) {
            $table->id();
            $table->string('name'); // Gate IMIP, Mess pekerja, Area Huabao, dll
            $table->decimal('location_lat', 10, 8);
            $table->decimal('location_lng', 11, 8);
            $table->string('type')->default('industry'); // industry, residential, port
            $table->string('peak_hours_start')->nullable(); // e.g. 17:00
            $table->string('peak_hours_end')->nullable(); // e.g. 20:00
            $table->boolean('is_active')->default(true);
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('location_shifts');
    }
};
