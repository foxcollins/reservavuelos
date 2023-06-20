<div class="p-10">
    

    <section class="mt-10">
        <h2 class="mb-10">Mis Reservaciones</h2>
        <div class="relative overflow-x-auto">
            @if ($flights->count()>0)
                @foreach ($flights as $flight)
                    
                    <div class="relative w-full p-6 bg-white border border-gray-200 rounded-lg shadow mb-5">
                        <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900">{{ $flight->hometown }} - {{ $flight->destination }}</h5>
                        <div class="absolute right-5 top-50">
                            <a href="#" data-modal-target="booking-modal" data-modal-toggle="booking-modal" wire:click="loadModal({{ $flight->id }},{{ $flight->pivot->id }})" class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300">
                                Actualzar
                                
                                <svg aria-hidden="true" class="w-4 h-4 ml-2 -mr-1" fill="currentColor" xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 384 512"><path d="M14 2.2C22.5-1.7 32.5-.3 39.6 5.8L80 40.4 120.4 5.8c9-7.7 22.3-7.7 31.2 0L192 40.4 232.4 5.8c9-7.7 22.3-7.7 31.2 0L304 40.4 344.4 5.8c7.1-6.1 17.1-7.5 25.6-3.6s14 12.4 14 21.8V488c0 9.4-5.5 17.9-14 21.8s-18.5 2.5-25.6-3.6L304 471.6l-40.4 34.6c-9 7.7-22.3 7.7-31.2 0L192 471.6l-40.4 34.6c-9 7.7-22.3 7.7-31.2 0L80 471.6 39.6 506.2c-7.1 6.1-17.1 7.5-25.6 3.6S0 497.4 0 488V24C0 14.6 5.5 6.1 14 2.2zM96 144c-8.8 0-16 7.2-16 16s7.2 16 16 16H288c8.8 0 16-7.2 16-16s-7.2-16-16-16H96zM80 352c0 8.8 7.2 16 16 16H288c8.8 0 16-7.2 16-16s-7.2-16-16-16H96c-8.8 0-16 7.2-16 16zM96 240c-8.8 0-16 7.2-16 16s7.2 16 16 16H288c8.8 0 16-7.2 16-16s-7.2-16-16-16H96z"/></svg>
                            </a>
                            <a href="#" wire:click="cancelBooking({{ $flight->pivot->id }})" class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-white bg-red-700 rounded-lg hover:bg-red-800 focus:ring-4 focus:outline-none focus:ring-red-300">
                                Cancelar
                                
                                
                                <svg aria-hidden="true" class="w-4 h-4 ml-2 -mr-1" fill="currentColor" xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 640 512"><path d="M514.3 192c34.2 0 93.7 29 93.7 64c0 36-59.5 64-93.7 64H440.6L630.8 469.1c10.4 8.2 12.3 23.3 4.1 33.7s-23.3 12.3-33.7 4.1L9.2 42.9C-1.2 34.7-3.1 19.6 5.1 9.2S28.4-3.1 38.8 5.1L238.1 161.3 197.8 20.4C194.9 10.2 202.6 0 213.2 0h56.2c11.5 0 22.1 6.2 27.8 16.1L397.7 192l116.6 0zM41.5 128.7l321 252.9L297.2 495.9c-5.7 10-16.3 16.1-27.8 16.1l-56.2 0c-10.6 0-18.3-10.2-15.4-20.4l49-171.6H144l-43.2 57.6c-3 4-7.8 6.4-12.8 6.4H46c-7.8 0-14-6.3-14-14c0-1.3 .2-2.6 .5-3.9L64 256 32.5 145.9c-.4-1.3-.5-2.6-.5-3.9c0-6.2 4-11.4 9.5-13.3z"/></svg>
                            </a>
                        </div>
                        <h3>Precio : ${{ $flight->price }} </h3>
                        <h3>Boletos reservados : {{ $flight->pivot->tickets }} </h3>
                        <h3>Fecha de salida: {{ \Carbon\Carbon::parse($flight->departure_at)->format('d/m/Y') }} | Hora de salida: {{ \Carbon\Carbon::parse($flight->departure_at)->format('H:i') }}   | Hora de llegada: {{ \Carbon\Carbon::parse($flight->arrival_at)->format('H:i') }}</h3>
                    </div>
                    
                @endforeach
                {{ $flights->links() }}
            @else
                <h3>No hay reservas disponibles</h3>
            @endif

        </div>

      

        <!-- Main modal -->

        <div wire:ignore.self id="booking-modal" tabindex="-1" aria-hidden="true" class="fixed top-0 left-0 right-0 z-50 hidden w-full p-4 overflow-x-hidden overflow-y-auto md:inset-0 h-[calc(100%-1rem)] max-h-full">
            <div class="relative w-full max-w-md max-h-full">
                <!-- Modal content -->
                <div class="relative bg-white rounded-lg shadow">
                    <button type="button" class="absolute top-3 right-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center" data-modal-hide="booking-modal">
                        <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
                        <span class="sr-only">Close modal</span>
                    </button>
                   @if ($modalok)
                     <div class="px-6 py-6 lg:px-8">
                        <h3 class="mb-4 text-xl font-medium text-gray-900">Reservar boletos</h3>
                        <div class="space-y-6" wire:ignore.self>
                            <h2>Vuelo <b>{{ $flightLoad->hometown }} - {{ $flightLoad->destination }}</b></h2>
                            <h3>Precio : ${{ $flightLoad->price }} </h3>
                            <h3>Boletos disponibles : {{ $available }} </h3>
                            <h3>Fecha de salida: {{ \Carbon\Carbon::parse($flightLoad->departure_at)->format('d/m/Y') }} | Hora de salida: {{ \Carbon\Carbon::parse($flightLoad->departure_at)->format('H:i') }} | Hora de llegada: {{ \Carbon\Carbon::parse($flightLoad->arrival_at)->format('H:i') }} </h3>
                            <div class="custom-number-input h-10 w-32 mb-50">
                                <label for="custom-input-number" class="w-full text-gray-700 text-sm font-semibold">Cantidad de boletos
                                </label>
                                <div class="flex flex-row h-10 w-full rounded-lg relative mt-1">
                                    <button type="button" wire:click="decrement" class=" bg-gray-300 text-gray-600 hover:text-gray-700 hover:bg-gray-400 h-full w-20 rounded-l cursor-pointer outline-none">
                                        <span class="m-auto text-2xl font-thin">−</span>
                                    </button>
                                    <input type="number" wire:model="tickets"  class="outline-none focus:outline-none text-center w-full  font-semibold text-md hover:text-black focus:text-black  md:text-basecursor-default flex items-center text-gray-700  outline-none" name="custom-input-number" min="1"></input>
                                    <button title="button" wire:click="increment" class="bg-gray-300 text-gray-600 hover:text-gray-700 hover:bg-gray-400 h-full w-20 rounded-r cursor-pointer">
                                        <span class="m-auto text-2xl font-thin">+</span>
                                    </button>
                                </div>
                            </div>
                            <div>
                                <button type="button" wire:click="updateBooking" class="mt-10  text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center">Actualizar reservación</button>
                                <button type="button" class="mt-4  text-white bg-blue-700 hover:bg-gray-800 focus:ring-4 focus:outline-none focus:ring-gray-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center" data-modal-hide="booking-modal">Cancelar</button>
                            </div>
                            
                        </div>
                    </div> 
                   @endif
                    
                
                </div>
            </div>
        </div> 




    </section>
</div>
@section('css')
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <style>
      input[type='number']::-webkit-inner-spin-button,
      input[type='number']::-webkit-outer-spin-button {
        -webkit-appearance: none;
        margin: 0;
      }

      .custom-number-input input:focus {
        outline: none !important;
      }

      .custom-number-input button:focus {
        outline: none !important;
      }
    </style>
@endsection

@section('scripts')
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

    <script>
     $( function() {
       var dateFormat = "mm-dd-yy",
         from = $( "#start" )
           .datepicker({
             defaultDate: "+1w",
             minDate: 0,
             changeMonth: true,
             numberOfMonths: 1
           })
           .on( "change", function() {
             to.datepicker( "option", "minDate", getDate( this ) );
             window.livewire.emit('dateSelectedstart',  this.value);
           }),
         to = $( "#end" ).datepicker({
           defaultDate: "+1w",
           minDate: 0,
           changeMonth: true,
           numberOfMonths: 1
         })
         .on( "change", function() {
           from.datepicker( "option", "maxDate", getDate( this ) );
           window.livewire.emit('dateSelectedend', this.value);
         });
    
       function getDate( element ) {
         var date;
         try {
           date = $.datepicker.parseDate( dateFormat, element.value );
         } catch( error ) {
           date = null;
         }
    
         return date;
       }
     } );
     </script>
       

     
@endsection


