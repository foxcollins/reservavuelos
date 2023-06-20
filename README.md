# reservavuelos
aplicacion de prueba  para reservas de boletos de vuelos con laravel 10 usando  blade, jetstream y livewire


# Install

clonar repositorio
$git clone https://github.com/foxcollins/reservavuelos.git

$cd reservavuelos

Instalar: $composer install

Modificar .env para la base de datos y migraciones

despues de instalar

# Instalar migraciones y seeders

$ php artisan migrate:fresh --seed


# Usuario de prueba

luis@admin.com
pass: password


# Notas
>en los seeder estan configurados para cargar 20 usuarios al azar y uno definido como usuario de prueba (luis@admin.com)

>en las carpetas existe una llamada DER que contiene una imagen del diagrama de entidad basico para entender un poco como estan las relaciones y las entidades

>Tambien esta una carpeta llamada DB que contiene una sql con datos de una migracion recien realizada en caso de querer importarla directamente

