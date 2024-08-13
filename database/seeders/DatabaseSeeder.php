<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;

use App\Models\User;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // \App\Models\User::factory(10)->create();

        // \App\Models\User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);

        User::create([
            'username' => 'admin',
            'password' => bcrypt('123456'),
            'name' => 'Admin',
            'level' => 'admin'
        ]);
        User::create([
            'username' => 'geusan',
            'password' => bcrypt('123456'),
            'name' => 'Geusan',
            'level' => 'teacher'
        ]);
        User::create([
            'username' => 'naufal',
            'password' => bcrypt('123456'),
            'name' => 'Naufal',
            'level' => 'teacher'
        ]);
        User::create([
            'username' => 'rizal',
            'password' => bcrypt('123456'),
            'name' => 'Rizal',
            'level' => 'siswa'
        ]);
        User::create([
            'username' => 'hilman',
            'password' => bcrypt('123456'),
            'name' => 'Hilman',
            'level' => 'siswa'
        ]);

    }
}
