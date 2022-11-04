<?php

namespace App\Models;

use App\Traits\HasCan;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;


class Post extends Model
{
    use HasFactory;
    use HasCan;
    use LogsActivity;


    protected $fillable = [
        'title',
        'content',
    ];
    protected static $logFillable = true;



    /**
     * The accessors to append to the model's array form.
     *
     * @var array
     */
    protected $appends = [
        'can',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function getCreatedAtAttribute($value)
    {
        return now()->parse($value)->timezone(config('app.timezone'))->format('F d, Y g:i A');
    }

    public function getUpdatedAtAttribute($value)
    {
        return now()->parse($value)->timezone(config('app.timezone'))->format('F d, Y g:i A');
    }

    public function scopeFilter($query, array $filters)
    {
        $query->when($filters['search'] ?? null, function ($query, $search) {
            $query->where(function ($query) use ($search) {
                $query->where('title', 'like', '%' . $search . '%')
                    ->orWhere('content', 'like', '%' . $search . '%');
            });
        });
    }
}
