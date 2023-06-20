<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Carbon\Carbon;

class Flight extends Model
{
    use HasFactory;

    protected $fillable = [
           
        ];
    protected $dates = [
        'departure_at',
        'arrival_at',
        'created_at',
        'updated_at'
    ];

    //relations
    public function bookings(): HasMany
    {
        return $this->hasMany(Booking::class,'flight_id');
    }
    public function users(): BelongsToMany
    {
        return $this->belongsToMany(User::class);
    }



    ////functions
    public function getAvailableTicketsAttribute()
    {
        $bookedTickets = $this->bookings()->sum('tickets');
        $availableTickets = $this->capacity - $bookedTickets;
        return $availableTickets;
    }

}
