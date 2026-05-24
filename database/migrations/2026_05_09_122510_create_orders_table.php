<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained()->onDelete('cascade');
            $table->foreignId('driver_id')->nullable()->constrained('users')->onDelete('set null');
            $table->foreignId('merchant_id')->nullable()->constrained('merchant_profiles')->onDelete('set null');
            $table->string('service_type'); // ride, car, food, send
            
            $table->string('pickup_location')->nullable();
            $table->decimal('pickup_lat', 10, 8)->nullable();
            $table->decimal('pickup_lng', 11, 8)->nullable();
            
            $table->string('dropoff_location')->nullable();
            $table->decimal('dropoff_lat', 10, 8)->nullable();
            $table->decimal('dropoff_lng', 11, 8)->nullable();
            
            $table->decimal('price', 10, 2);
            $table->decimal('distance', 8, 2)->nullable();
            $table->string('status')->default('pending'); // pending, accepted, picking_up, on_delivery, completed, cancelled
            $table->string('payment_method')->default('cash'); // cash, qris, wallet
            $table->text('notes')->nullable();
            
            // For Pijek Send
            $table->string('sender_name')->nullable();
            $table->string('sender_phone')->nullable();
            $table->string('recipient_name')->nullable();
            $table->string('recipient_phone')->nullable();
            $table->string('item_details')->nullable();
            $table->string('proof_of_delivery_photo')->nullable();
            
            // For Morowali Shift specific
            $table->boolean('is_night_shift')->default(false);
            
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('orders');
    }
};
