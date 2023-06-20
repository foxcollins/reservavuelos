<?php

namespace App\Http\Livewire\Flights;

use Livewire\Component;
use Livewire\WithPagination;
use App\Models\Flight;
use App\Models\Booking;
use Carbon\Carbon;
use Auth;

class FlightList extends Component
{
    use WithPagination;
    protected $flights;
    public $hometowns;
    public $destinations;
    public $currentDate;
    public $origen;
    public $destino;
    public $start;
    public $end;
    public $search=false;
    public $page = 1;
    public $flightLoad=null;
    public $tickets=0;
    public $modalok = false;
    public $booking;
     
    protected $queryString = [
        'search' => ['except' => false],
        'page' => ['except' => 1],
    ];

    protected $rules = [
        'origen' => 'different:destino',
        'destino' => 'different:origen',
        'start' => 'before_or_equal:end',
        'end'   => 'after_or_equal:start'
    ];
    protected $messages = [
        'origen.different' => 'Debe ser diferente al destino',
        'destino.different' => 'Debe ser diferente a la salida',
        'start.required' => 'Seleccione fecha',
        'end.required' => 'Seleccione fecha',
    ];

    protected $listeners = ['dateSelectedstart' => 'updateStart','dateSelectedend'=>'updateEnd'];

    public function updateStart($date)
    {
        $this->start = Carbon::parse($date)->format('d/m/Y');
    }
    public function updateEnd($date)
    {
        $this->end = Carbon::parse($date)->format('d/m/Y');
    }

    public function mount(){
        $this->flightLoad = new Flight;
        $currentDate = Carbon::now();
        $this->hometowns = Flight::where('departure_at', '>=', $currentDate)
            ->orderBy('hometown','ASC')
            ->pluck('hometown')
            ->unique()
            ->toArray();

        $this->destinations = Flight::where('departure_at', '>=', $currentDate)
            ->orderBy('destination','ASC')
            ->pluck('destination')
            ->unique()
            ->toArray();
        
    }

    
    public function render()
    {
        $currentDate = Carbon::now();


        if ($this->origen OR $this->destino OR $this->start OR $this->end) {
            $this->search = true;
            $flights = Flight::query()
            ->where('departure_at', '>=', $currentDate)
            ->when($this->origen, function ($query) {
                $query->where('hometown', $this->origen);
            })
            ->when($this->destino, function ($query) {
                $query->where('destination', $this->destino);
            })
            ->when($this->start, function ($query) {
                $query->whereDate('departure_at', '>=', Carbon::createFromFormat('d/m/Y',$this->start)->format('Y-m-d'));
            })
            ->when($this->end, function ($query) {
                $query->whereDate('departure_at', '<=',Carbon::createFromFormat('d/m/Y',$this->end)->format('Y-m-d'));
            })
                
            
            ->orderBy('departure_at', 'ASC')
            ->paginate(10);
        }else{
            $flights = Flight::query()
            ->where('departure_at', '>=', $currentDate)
            ->orderBy('departure_at', 'ASC')
            ->paginate(10);
        }

            

            return view('livewire.flights.flight-list', [
                'flights' => $flights,
            ]);
    }

    public function updated($propertyName){
        $this->resetPage();
        $this->validateOnly($propertyName);
    }

    public function clear(){
        $this->search = false;
        $this->origen = '';
        $this->destino = '';
        $this->start = '';
        $this->end = '';
        $this->resetErrorBag();
        $this->render();
        
    }



    public function loadModal($id){
        
        $this->tickets = 1;
        $this->flightLoad = Flight::findOrFail($id);
        $this->modalok = true;
    }

    public function increment(){
        if ($this->tickets< $this->flightLoad->available_tickets) {
            $this->tickets++;
        }
    }
    public function decrement(){
        if ($this->tickets>1) {
            $this->tickets--;
        }
    }

    public function booking(){
        /*dd($this->flightLoad);*/
        $this->flightLoad = Flight::findOrFail($this->flightLoad->id);
        if ($this->tickets<=$this->flightLoad->available_tickets) {
            $this->booking = new Booking;
            $this->booking->user_id = Auth::user()->id;
            $this->booking->flight_id=$this->flightLoad->id;
            $this->booking->tickets = $this->tickets;
            $this->booking->save();
            notify()->success('Reserva de boletos se completo correctamente!','Reservación completa');
            return redirect()->to('/home');
        }else{
            //no hay boletos disponibles
            notify()->error('Ya no hay boletos disponibles!');
            return redirect()->to('/home');

        }

    }
    
}
