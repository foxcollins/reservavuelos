<?php

namespace App\Http\Livewire\Bookings;

use Livewire\Component;
use Livewire\WithPagination;
use App\Models\Flight;
use App\Models\Booking;
use Carbon\Carbon;
use Auth;

class BookingList extends Component
{
    use WithPagination;
    protected $bookings;
    public $flightLoad;
    public $tickets;
    public $booking;
    public $modalok = false;
    public $available;

    public function mount(){
        
    }
    public function render()
    {   
        $flights = Auth::user()->flights()->paginate(10);
        
        return view('livewire.bookings.booking-list', [
                'flights' => $flights,
            ]);
    }

    public function increment(){
       
        if ($this->tickets<$this->available) {
            $this->tickets++;
        }
    }
    public function decrement(){
        if ($this->tickets>1) {
            $this->tickets--;
        }
    }


    public function cancelBooking($id){
        $this->booking = booking::findOrFail($id);
        $this->booking->delete();
        notify()->success('Reserva de boletos cancelada correctamente!','Reservación cancelada');
        return redirect()->to('/bookings');
    }

    public function loadModal($id,$booking_id){
        $this->booking = booking::findOrFail($booking_id);
        $this->flightLoad = Flight::findOrFail($id);
        
        $this->tickets = $this->booking->tickets;
        $this->available = $this->tickets+$this->flightLoad->available_tickets;
        $this->modalok = true;
    }

    public function updateBooking(){
        $this->flightLoad = Flight::findOrFail($this->flightLoad->id);
        $update = Booking::findOrFail($this->booking->id);
        if ($this->tickets<=($update->tickets+$this->flightLoad->available_tickets)) {
            
            $update->tickets = $this->tickets;
            $update->save();
            notify()->success('Reserva de boletos se completo correctamente!','Reservación completa');
            return redirect()->to('/bookings');
        }else{
            //no hay boletos disponibles
            notify()->error('Ya no hay boletos disponibles!');
            return redirect()->to('/bookings');

        }

    }
}
