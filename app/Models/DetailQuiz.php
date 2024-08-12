<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DetailQuiz extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function quiz(){
        return $this->hasMany(Quiz::class,'id_quiz');
    }
    public function question(){
        return $this->hasMany(Question::class,'id');
    }
}
