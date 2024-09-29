<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('algorithm_collaboratives', function (Blueprint $table) {
            $table->id();
            $table->foreignId('product_id')->constrained('metal_hub_products')->onDelete('cascade'); // Foreign key to metal_hub_products table
            $table->decimal('filtering_value', 10, 2); // Store the calculated filtering value
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('algorithm_collaboratives');
    }
};
