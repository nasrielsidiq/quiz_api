<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Js;
use Tymon\JWTAuth\Facades\JWTAuth;

class AuthController extends Controller
{
    public function login(Request $request){
        $validator = Validator::make($request->all(),[
            'username' => 'required',
            'password' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'message' => 'Invalid Input',
                'errors' => $validator->errors()
            ],422);
        }
        $credential = $request->only('username', 'password');
        if (!$token = Auth::guard('api')->attempt($credential)) {
            return response()->json([
                'message' => 'Email or password incorrect',
            ],401);
        }
        $user = User::where('username', $request->username)->get();
        return response()->json([
            'message' => 'Login success',
            'token' => $token,
            'user' =>  $user
        ], 200);
    }
    public function logout(){
        $removeToken = JWTAuth::invalidate(JWTAuth::getToken());

        if ($removeToken) {
            return response()->json([
                'message' => 'Logout success'
            ],200);
        }
    }
}
