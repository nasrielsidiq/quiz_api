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
        Schema::create('detail_quizzes', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('id_quiz');
            $table->unsignedBigInteger('id_question');
            $table->timestamps();
            $table->foreign('id_quiz')->references('id')->on('quizzes')->cascadeOnDelete()->cascadeOnUpdate();
            $table->foreign('id_question')->references('id')->on('questions')->cascadeOnDelete()->cascadeOnUpdate();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('detail_quizzes');
    }
};
