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
        Schema::create('answers', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('id_detail');
            $table->unsignedBigInteger('id_user');
            $table->unsignedBigInteger('id_choice');
            $table->unsignedBigInteger('id_quiz');
            $table->boolean('is_true');
            $table->time('time');
            $table->timestamps();
            $table->foreign('id_detail')->references('id')->on('detail_quizzes')->cascadeOnDelete()->cascadeOnUpdate();
            $table->foreign('id_user')->references('id')->on('users')->cascadeOnDelete()->cascadeOnUpdate();
            $table->foreign('id_choice')->references('id')->on('choices')->cascadeOnDelete()->cascadeOnUpdate();
            $table->foreign('id_quiz')->references('id')->on('quizzes')->cascadeOnDelete()->cascadeOnUpdate();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('answers');
    }
};
