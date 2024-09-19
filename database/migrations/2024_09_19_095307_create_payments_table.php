<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePaymentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('payments', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('driver_id');
            $table->unsignedBigInteger('vehicle_assigning_id');
            $table->string('purpose');
            $table->decimal('amount', 10, 2); // Assuming the amount will be stored as a decimal
            $table->text('description')->nullable();
            $table->unsignedBigInteger('company_id');
            $table->unsignedBigInteger('vehicle_id');
            $table->string('vehicle_file_no')->nullable(); // In case vehicle file number is optional
            $table->timestamps();

            
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('payments');
    }
}
