<div class="p-10">
    
    <section>
        <!-- component -->
        <div class="mb-10">
            <div class="container mx-auto flex justify-center items-center p-2 md:p-0">
                <div>
                    <div class="grid grid-cols-1 md:grid-cols-2">
                        <div class="grid grid-cols-2  gap-2  p-2 ">
                            <div class="relative mb-6">
                                <div>
                                    <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                                        <svg aria-hidden="true" class="w-5 h-5 text-gray-500 " fill="currentColor" xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 384 512"><path d="M215.7 499.2C267 435 384 279.4 384 192C384 86 298 0 192 0S0 86 0 192c0 87.4 117 243 168.3 307.2c12.3 15.3 35.1 15.3 47.4 0zM192 128a64 64 0 1 1 0 128 64 64 0 1 1 0-128z"/></svg>
                                    </div>
                                       <select id="hometown" wire:model="origen"  class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full pl-10 p-2.5">
                                           <option value="">Todas</option>
                                           @foreach ($hometowns as $hometown)
                                               <option>{{ $hometown }}</option>
                                           @endforeach
                                       </select>
                                </div>
                                <div class="absolute">
                                    @if($errors->has('origen'))
                                        <span class="text-red-400 text-xs">{{ $errors->first('origen') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="relative mb-6">
                                <div>
                                    <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                                        <svg aria-hidden="true" class="w-5 h-5 text-gray-500 " fill="currentColor" xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 384 512"><path d="M215.7 499.2C267 435 384 279.4 384 192C384 86 298 0 192 0S0 86 0 192c0 87.4 117 243 168.3 307.2c12.3 15.3 35.1 15.3 47.4 0zM192 128a64 64 0 1 1 0 128 64 64 0 1 1 0-128z"/></svg>
                                    </div>
                                        <select wire:model="destino" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full pl-10 p-2.5">
                                            <option value="">Todas</option>
                                            @foreach ($destinations as $destination)
                                                <option value="{{ $destination }}">{{ $destination }}</option>
                                            @endforeach
                                        </select>
                                </div>
                                <div class="absolute">
                                    @if($errors->has('destino'))
                                        <span class="text-red-400 text-xs">{{ $errors->first('destino') }}</span>
                                    @endif
                                </div>
                                
                            </div>
                        </div>
                        <div class="grid grid-cols-2 gap-2  p-2 rounded">
                            <div class="relative mb-6">
                                <div wire:ignore>
                                    <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                                        <svg aria-hidden="true" class="w-5 h-5 text-gray-500" fill="currentColor" xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 448 512"><path d="M128 0c17.7 0 32 14.3 32 32V64H288V32c0-17.7 14.3-32 32-32s32 14.3 32 32V64h48c26.5 0 48 21.5 48 48v48H0V112C0 85.5 21.5 64 48 64H96V32c0-17.7 14.3-32 32-32zM0 192H448V464c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V192zm80 64c-8.8 0-16 7.2-16 16v96c0 8.8 7.2 16 16 16h96c8.8 0 16-7.2 16-16V272c0-8.8-7.2-16-16-16H80z"/></svg>
                                    </div>
                                    <input wire:model="start"  placeholder="Seleccionar desde"  name="start" id="start" type="text" autocomplete="off" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full pl-10 p-2.5">
                                </div>
                                <div class="absolute">
                                    @if($errors->has('start'))
                                        <span class="text-red-400 text-xs">{{ $errors->first('start') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="relative mb-6">
                                <div wire:ignore>
                                    <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                                        
                                        <svg aria-hidden="true" class="w-5 h-5 text-gray-500" fill="currentColor" xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 448 512"><path d="M152 24c0-13.3-10.7-24-24-24s-24 10.7-24 24V64H64C28.7 64 0 92.7 0 128v16 48V448c0 35.3 28.7 64 64 64H384c35.3 0 64-28.7 64-64V192 144 128c0-35.3-28.7-64-64-64H344V24c0-13.3-10.7-24-24-24s-24 10.7-24 24V64H152V24zM48 192h80v56H48V192zm0 104h80v64H48V296zm128 0h96v64H176V296zm144 0h80v64H320V296zm80-48H320V192h80v56zm0 160v40c0 8.8-7.2 16-16 16H320V408h80zm-128 0v56H176V408h96zm-144 0v56H64c-8.8 0-16-7.2-16-16V408h80zM272 248H176V192h96v56z"/></svg>
                                    </div>
                                    <input  wire:model="end"  id="end" placeholder="Seleccionar hasta" name="end" type="text" autocomplete="off" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full pl-10 p-2.5">
                                </div>
                                <div class="absolute">
                                    @if($errors->has('end'))
                                        <span class="text-red-400 text-xs">{{ $errors->first('end') }}</span>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>
                    {{-- <div class="flex justify-center"><button wire:click="finding" class="p-2 border w-1/4 rounded-md bg-gray-800 text-white">Buscar</button></div> --}}

                    @if ($search)
                        <div  class="flex justify-center"><button wire:click="clear" class="p-2 border w-1/4 rounded-md bg-blue-300 text-black">Limpiar Filtro</button></div>
                    @endif
                </div>
            </div>
        </div>
    </section>

    <section class="mt-10">
        
        <div class="relative overflow-x-auto">
            @if ($flights->count()>0)
                @foreach ($flights as $flight)
                    {{-- @if ($flight->available_tickets>0) --}}
                        <div class="relative w-full p-6 bg-white border border-gray-200 rounded-lg shadow mb-5">
                            <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900">{{ $flight->hometown }} - {{ $flight->destination }}</h5>
                            <div class="absolute right-5 top-50">
                                @if ($flight->available_tickets>0)
                                <a href="#" data-modal-target="booking-modal" data-modal-toggle="booking-modal" wire:click="loadModal({{ $flight->id }})" class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300">
                                    Reservar
                                    
                                    <svg aria-hidden="true" class="w-4 h-4 ml-2 -mr-1" fill="currentColor" xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 384 512"><path d="M14 2.2C22.5-1.7 32.5-.3 39.6 5.8L80 40.4 120.4 5.8c9-7.7 22.3-7.7 31.2 0L192 40.4 232.4 5.8c9-7.7 22.3-7.7 31.2 0L304 40.4 344.4 5.8c7.1-6.1 17.1-7.5 25.6-3.6s14 12.4 14 21.8V488c0 9.4-5.5 17.9-14 21.8s-18.5 2.5-25.6-3.6L304 471.6l-40.4 34.6c-9 7.7-22.3 7.7-31.2 0L192 471.6l-40.4 34.6c-9 7.7-22.3 7.7-31.2 0L80 471.6 39.6 506.2c-7.1 6.1-17.1 7.5-25.6 3.6S0 497.4 0 488V24C0 14.6 5.5 6.1 14 2.2zM96 144c-8.8 0-16 7.2-16 16s7.2 16 16 16H288c8.8 0 16-7.2 16-16s-7.2-16-16-16H96zM80 352c0 8.8 7.2 16 16 16H288c8.8 0 16-7.2 16-16s-7.2-16-16-16H96c-8.8 0-16 7.2-16 16zM96 240c-8.8 0-16 7.2-16 16s7.2 16 16 16H288c8.8 0 16-7.2 16-16s-7.2-16-16-16H96z"/></svg>
                                </a>
                                @else
                                <a href="#" disabled class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-white bg-blue-300 rounded-lg hover:bg-blue-400">
                                    Reservar
                                    
                                    <svg aria-hidden="true" class="w-4 h-4 ml-2 -mr-1" fill="currentColor" xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 384 512"><path d="M14 2.2C22.5-1.7 32.5-.3 39.6 5.8L80 40.4 120.4 5.8c9-7.7 22.3-7.7 31.2 0L192 40.4 232.4 5.8c9-7.7 22.3-7.7 31.2 0L304 40.4 344.4 5.8c7.1-6.1 17.1-7.5 25.6-3.6s14 12.4 14 21.8V488c0 9.4-5.5 17.9-14 21.8s-18.5 2.5-25.6-3.6L304 471.6l-40.4 34.6c-9 7.7-22.3 7.7-31.2 0L192 471.6l-40.4 34.6c-9 7.7-22.3 7.7-31.2 0L80 471.6 39.6 506.2c-7.1 6.1-17.1 7.5-25.6 3.6S0 497.4 0 488V24C0 14.6 5.5 6.1 14 2.2zM96 144c-8.8 0-16 7.2-16 16s7.2 16 16 16H288c8.8 0 16-7.2 16-16s-7.2-16-16-16H96zM80 352c0 8.8 7.2 16 16 16H288c8.8 0 16-7.2 16-16s-7.2-16-16-16H96c-8.8 0-16 7.2-16 16zM96 240c-8.8 0-16 7.2-16 16s7.2 16 16 16H288c8.8 0 16-7.2 16-16s-7.2-16-16-16H96z"/></svg>
                                </a>
                                @endif
                            </div>
                            <h3>Precio : ${{ $flight->price }} </h3>
                            <h3>Boletos disponibles : 
                                @if ($flight->available_tickets>0)
                                    {{ $flight->available_tickets }}
                                @else
                                    <span class="bg-red-600 text-gray-300 text-xs font-medium mr-2 px-2.5 py-0.5 rounded text-xs">Agotado</span>
                                @endif
                             </h3>
                            <h3>Fecha de salida: {{ \Carbon\Carbon::parse($flight->departure_at)->format('d/m/Y') }} | Hora de salida: {{ \Carbon\Carbon::parse($flight->departure_at)->format('H:i') }}   | Hora de llegada: {{ \Carbon\Carbon::parse($flight->arrival_at)->format('H:i') }}</h3>
                        </div>
                    {{-- @endif --}}
                @endforeach
                {{ $flights->links() }}
            @else
                <h3>No hay vuelos disponibles</h3>
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
                            <h3>Boletos disponibles : {{ $flightLoad->available_tickets }} </h3>
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
                                <button type="button" wire:click="booking" class="mt-10  text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center">Completar reservación</button>
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

