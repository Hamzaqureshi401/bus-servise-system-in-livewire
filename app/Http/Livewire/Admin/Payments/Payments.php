<?php

namespace App\Http\Livewire\Admin\Payments;
use App\Models\VehicleAssigning;
use App\Models\Driver;
use App\Models\Payment;
use App\Models\Vehicle;
use Illuminate\Support\Facades\Auth;

use Livewire\Component;

class Payments extends Component
{
    public $purpose, $date, $amount,$description, $driver_id, $vehicleAssigning =[] , $selectedVehicleAssigning , $vehicleAssigning_id;

    public function render()
    {
        return view('livewire.admin.payments.payments');
    }

    public function mount()
    {
        $this->date = date('Y-m-d');
        $this->driver = $this->getAssigningDrivers();
        
        if(!Auth::user()->can('add_assigning'))
        {
            abort(404);
        }
    }

    public function getAssigningDrivers(){
        return Driver::whereIn('id' , VehicleAssigning::pluck('driver_id')->toArray())->get();
    }
    /* store products*/
    public function create()
    {
        // Validate the incoming request data
        $this->validate([
            'driver_id' => 'required|exists:drivers,id',
            'vehicleAssigning_id' => 'required|exists:vehicle_assignings,id',
            'purpose' => 'required|string|max:255',
            'amount' => 'required|numeric',
            'description' => 'nullable|string',
            
        ]);

        // Create a new payment record using mass assignment
        $payment = Payment::create([
            'driver_id'             => $this->driver_id,
            'vehicle_assigning_id'  => $this->vehicleAssigning_id,
            'purpose'               => $this->purpose,
            'amount'                => $this->amount,
            'description'           => $this->description,
            'company_id'            => $this->selectedVehicleAssigning->company_id,
            'vehicle_id'            => $this->selectedVehicleAssigning->vehicle_id,
            'vehicle_file_no'       => $this->selectedVehicleAssigning->vehicle_file_no,
        ]);
        
        return redirect()->route('admin.payments.view');
    }
    
    public function driverData(){
    
        $this->vehicleAssigning = VehicleAssigning::where('driver_id',$this->driver_id)->get();  
    }
    
    public function vehicleAssigning(){
    
        $this->selectedVehicleAssigning = VehicleAssigning::where('id',$this->vehicleAssigning_id)->first();        
    }

}
