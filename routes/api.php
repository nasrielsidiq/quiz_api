<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\HistoryController;
use App\Http\Controllers\QuestionController;
use App\Http\Controllers\QuizController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::post('auth/login', [AuthController::class, 'login']);
Route::post('auth/register', [AuthController::class, 'register']);
Route::middleware('jwt_auth')->group(function () {
    Route::get('auth/logout', [AuthController::class, 'logout']);
    Route::get('quiz', [QuizController::class, 'getAll']);
    Route::post('quiz', [QuizController::class, 'create']);
    Route::get('quiz/{id_quiz}/questions',[QuestionController::class, 'getAll']);
    Route::post('quiz/{id_quiz}/questions',[QuestionController::class, 'create']);
    Route::get('quiz/{id_quiz}/questions/{id_question}',[QuestionController::class, 'get']);
    Route::post('quiz/{id_quiz}/questions/{id_question}/answer',[QuestionController::class, 'answer']);
    Route::get('quiz/{id_quiz}/submit',[HistoryController::class, 'submit']);
});
