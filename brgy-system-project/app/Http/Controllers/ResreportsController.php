<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;
use App\Models\Resreport;
use Illuminate\Support\Facades\Validator;

class ResreportsController extends Controller
{
    public function index()
    {
        $data = Resreport::all();
        return Inertia::render('resreports', ['data' => $data]);
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

        Resreport::create($request->all());

        // return redirect()->back()
        //             ->with('message', 'Reports Created Successfully.');

        return redirect()->route('dashboard')->with('success', 'Report was successfully asdfas.');
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
            Resreport::find($request->input('id'))->update($request->all());
            return redirect()->back()
                    ->with('message', 'Report Submitted!');
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
            Resreport::find($request->input('id'))->delete();
            return redirect()->back();
        }
    }
}
