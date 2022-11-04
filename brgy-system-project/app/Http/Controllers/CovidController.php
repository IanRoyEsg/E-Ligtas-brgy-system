<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;
use App\Models\Covid;
use Illuminate\Support\Facades\Validator;

class CovidController extends Controller
{
    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function index()
    {
        $data = Covid::all();
        return Inertia::render('covids', ['data' => $data]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function store(Request $request)
    {
        Validator::make($request->all(), [
            'title' => ['required'],
            'body' => ['required'],
        ])->validate();

        Covid::create($request->all());

        // return redirect()->back()
        //             ->with('message', 'Resident added successfully.');
        return redirect()->route('covids.index')->with('success', 'Resident was added successfully.');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function update(Request $request)
    {
        Validator::make($request->all(), [
            'title' => ['required'],
            'body' => ['required'],
        ])->validate();

        if ($request->has('id')) {
            Covid::find($request->input('id'))->update($request->all());
            return redirect()->back()
                    ->with('message', 'Resident updated successfully.');
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function destroy(Request $request)
    {
        if ($request->has('id')) {
            Covid::find($request->input('id'))->delete();
            return redirect()->back();
        }
    }
}
