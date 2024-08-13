<?php

namespace App\Http\Controllers;

use App\Models\DetailQuiz;
use App\Models\Quiz;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class QuizController extends Controller
{
    public function create(Request $request){
        $validator = Validator::make($request->all(),[
            'title' => ['required', 'unique:quizzes'],
            'time' => ['required', ],
            'duration' => ['required', 'numeric']
        ]);

        $user = Auth::guard('api')->user();
        if ($validator->fails()) {
            return response()->json([
                'message' => 'Invalid input',
                'errors' => $validator->errors()
            ], 422);
        }
        if ($user->level != ('techer'||'admin')) {
            return response()->json([
                'message' => 'You not have any permison'
            ], 403);
        }
        $quiz = new Quiz();
        $quiz->title = $request->title;
        $quiz->time = $request->time;
        $quiz->duration = $request->duration;
        $quiz->id_user = Auth::guard('api')->user()->id;
        $quiz->save();

        return response()->json([
            'message' => 'Add new quiz success',
            'quiz' => $quiz
        ],200);
    }

    public function getAll(){
        $quiz = Quiz::get();
        return response()->json([
            'message' => 'Get all data success',
            'quiz' => $quiz,
        ], 200);
    }


}
