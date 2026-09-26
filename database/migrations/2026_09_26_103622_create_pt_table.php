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
        Schema::create('pt', function (Blueprint $table) {
            $table->string('id_pt', 36)->primary();
            $table->string('kode_pt', 6)->unique();
            $table->string('nama_pt', 150);
            $table->string('alamat_pt', 250)->nullable();
            $table->string('telepon_pt', 30)->nullable();
            $table->string('logo_pt', 150)->nullable();
            $table->boolean('status')->default(true);
            $table->dateTime('created_at')->nullable();
            $table->dateTime('updated_at')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('pt');
    }
};
