<?php

namespace App\Http\Controllers;

use App\Models\Answer;
use App\Models\DetailQuiz;
use App\Models\HistoryQuiz;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HistoryController extends Controller
{
    public function submit($id_quiz){
        $user = Auth::guard('api')->user();
        $quiz = Answer::where('id_quiz',$id_quiz)->get();
        if (!$quiz) {
            return response()->json([
                'message' => 'Quiz not found'
            ], 404);
        }
        $true_answer = count($quiz);
        $length_question = count(DetailQuiz::where('id_quiz',$id_quiz)->get());

        $answer = new HistoryQuiz();
        $answer->id_user = $user->id;
        $answer->id_quiz = $id_quiz;
        $answer->score = ($true_answer/$length_question)*100;
        $answer->save();

        return response()->json([
            'message' => 'Answer success',
            'answer' => $answer,
        ], 200);
     }
}
