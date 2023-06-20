<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Flight;
use Carbon\Carbon;
/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Model>
 */
class FlightFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    protected $model = Flight::class;

    public function definition(): array
    {
        $departureDate = $this->faker->dateTimeBetween('now', '+1 week');
        $arrivalDate = $this->faker->dateTimeBetween($departureDate, $departureDate->format('Y-m-d H:i:s').' +12 hours');
        $ciudadesColombia = [
            'Bogotá',
            'Medellín',
            'Cali',
            'Barranquilla',
            'Cartagena',
            'Santa Marta',
            'Pereira',
            'Bucaramanga',
            'Ibagué',
            'Manizales',
        ];
        $hometown = $this->faker->randomElement($ciudadesColombia);
        $destinations = array_diff($ciudadesColombia, [$hometown]);
        $destination = $this->faker->randomElement($destinations);
        return [
            'hometown'     => $hometown,
            'destination'  => $destination,
            'departure_at' => Carbon::parse($departureDate),
            'arrival_at'   => Carbon::parse($arrivalDate),
            'capacity'     => rand(20,40),
            'price'        => rand(20,400),
        ];
    }
}
