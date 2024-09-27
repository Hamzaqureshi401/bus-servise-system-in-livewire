<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Payment extends Model
{
    use HasFactory;

    // Define the fillable fields
    protected $fillable = [
        'driver_id',
        'vehicle_assigning_id',
        'purpose',
        'amount',
        'description',
        'company_id',
        'vehicle_id',
        'vehicle_file_no',
        'user_id'
    ];

    // If you have relationships, define them here (Optional)
    public function driver()
    {
        return $this->belongsTo(Driver::class);
    }

    public function vehicleAssigning()
    {
        return $this->belongsTo(VehicleAssigning::class);
    }

    public function company()
    {
        return $this->belongsTo(Company::class);
    }

    public function vehicle()
    {
        return $this->belongsTo(Vehicle::class);
    }
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
