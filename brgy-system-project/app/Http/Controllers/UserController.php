<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;

class UserController extends Controller
{
    public function __construct()
    {
        $this->authorizeResource(User::class);
    }

    /**
     * Display a listing of the resource.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $queries = ['search'];

        return Inertia::render('User/Index', [
            'users' => User::filter($request->only($queries))->paginate()->withQueryString(),
            'filters' => $request->all($queries),
        ]);



        // $queries = ['search', 'page'];
        // return Inertia::render('Post/Index', [
        //     'posts' => Post::when($request->user()->hasRole('user'), function ($query) use ($request) {
        //         $query->where('user_id', $request->user()->id);
        //     })
        //         ->filter($request->only($queries))
        //         ->paginate(4)
        //         ->withQueryString(),
        //     'filters' => $request->all($queries),
        // ]);

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return Inertia::render('User/Create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //added


        $request->validate([
            'firstname' => 'required|string',
            'lastname' => 'required|string',
            'username' => 'required|string',

            'email' => 'required|email',
            'role' => 'required|string',
        ]);

        $request->user()->users()->create($request->only('firstname', 'lastname', 'username','email'));
        // return redirect(route('posts.index'))->withSuccess('Report submitted successfully!');


        return redirect()->route('users.index')->with('success', 'User created successfully!');


    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function show(User $user)
    {
        return Inertia::render('User/Show', ['manageUser' => $user]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function edit(User $user)
    {
        return Inertia::render('User/Edit', ['manageUser' => $user]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, User $user)
    {
        $authUser = $request->user();

        $request->validate([
            'firstname' => 'required|string',
            'lastname' => 'required|string',
            'username' => 'required|string',
            'email' => 'required|email',
            'role' => 'required|string',
        ]);

        $user->update($request->only('firstname','lastname', 'username','email'));

        if ($authUser->hasRole('admin')) {
            $user->role = $request->role;
            $user->save();
        }
        // added just now
        return redirect()->route('users.index')->with('success', 'Post was successfully created');

        // return back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function destroy(User $user)
    {
        $user->delete();

        return back()->with('success', 'User was successfully deleted');
    }
}
