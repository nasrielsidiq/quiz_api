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
        $user = User::where('username', $request->username)->first();
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
    public function register(Request $request){
        $validator = Validator::make($request->all(),[
            'name' => 'required',
            'username' => ['required', 'unique:users'],
            'password' => ['required', 'min:6']
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => 'Invalid input',
                'errors' => $validator->errors()
            ], 422);
        }
        $user = new User();
        $user->name = $request->name;
        $user->username = $request->username;
        $user->password = bcrypt($request->password);
        $user->level = 'siswa';
        $user->save();

        $credential = $request->only('username','password');

        if (!$token = Auth::guard('api')->attempt($credential)) {
            return response()->json([
                'message' => 'Username or password inccorect'
            ], 401);
        }

        return response()->json([
            'message' => 'Register success',
            'token' => $token,
            'user' => $user
        ],200  );
    }
}
