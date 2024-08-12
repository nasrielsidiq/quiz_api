<?php

namespace App\Http\Controllers;

use App\Models\Answer;
use App\Models\Choice;
use App\Models\DetailQuiz;
use App\Models\Question;
use App\Models\Quiz;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class QuestionController extends Controller
{
    public function create(Request $request, $id_quiz)
    {
        $validator = Validator::make($request->all(), [
            'text_question' => 'required',
            // 'status' => 'required',
            'choices' => ['required', 'array']
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => 'Invalid input',
                'errors' => $validator->errors()
            ], 422);
        }
        $question = new Question();
        $question->text_question = $request->text_question;
        $question->status = 0;
        $question->save();

        foreach ($request->choices as $key) {
            $choice = new Choice();
            $choice->choice = $key[0];
            $choice->is_true = $key[1];
            $choice->id_question = $question->id;
            $choice->save();
        }

        $choices = Choice::where('id_question', $question->id)->get();
        DetailQuiz::create([
            'id_quiz' => $id_quiz,
            'id_question' => $question->id
        ]);

        return response()->json([
            'message' => 'Create new question success',
            'question' => $question,
            'choices' => $choices
        ], 200);

    }
    public function getAll($id_quiz)
    {
        $question = DetailQuiz::where('id_quiz', $id_quiz)->has('question')->get();
        return response()->json([
            'message' => 'Get questions success',
            'questions' => $question
        ], 200);
    }
    public function get($id_quiz,$id_question){
        $question = Question::where('id',$id_question)->with('choices')->first();
        $detail = DetailQuiz::where('id_quiz',$id_quiz)->where('id_question', $id_question)->get();
        if (!$detail || !$question) {
            return response()->json([
                'message' => 'Question not found'
            ], 404);
        }
        return response()->json([
            'message' => 'Get question '.$question->text_question.' success',
            'question' => $question
        ], 200);
    }
    public function answer(Request $request, $id_quiz,$id_question){
        $detail = DetailQuiz::where('id_quiz', $id_quiz)->where('id_question',$id_question)->first();
        $user = Auth::guard('api')->user();
        $validator = Validator::make($request->all(),[
            'id_choice' => 'required'
        ]);
        if ($validator->fails()) {
            return response()->json([
                'message' => 'Invalid input',
                'errors' => $validator->errors()
            ], 422);
        }
        if (!$detail) {
            return response()->json([
                'message' => 'Quizz or question not found'
            ], 404);
        }
        $choice = Choice::find($request->id_choice);
        $answer = new Answer();
        $answer->id_detail = $detail->id;
        $answer->id_user = $user->id;
        $answer->id_choice = $request->id_choice;
        $answer->id_quiz = $id_quiz;
        if ($choice->is_true) {
            $answer->is_true = true;
        }else{
            $answer->is_true = false;
        }
        $answer->time = Carbon::now();
        $answer->save();

        Question::where('id', $id_question)->update([
            'status' => 1
        ]);

        return response()->json([
            'message' => 'Submit success',
            'answer' => $answer
        ],200);

    }
}
