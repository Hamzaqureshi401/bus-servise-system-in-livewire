<?php

namespace App\Http\Livewire\Admin\Payments;

use Livewire\Component;
use App\Models\Payment;
use App\Models\Driver;
use App\Models\VehicleAssigning;
use Auth;

class PaymentsTable extends Component
{
    public $payments;
    public $selectedPayment;
    public $showEditModal = false;
    public $drivers, $vehicleAssigning;
    public $driver_id, $vehicle_assigning_id, $purpose, $amount, $description;

    public function mount()
    {
$this->payments = Payment::orderByRaw('CAST(vehicle_file_no AS UNSIGNED) ASC')->get();
        $this->drivers = Driver::all(); // Fetch drivers for the dropdown
        $this->vehicleAssigning = VehicleAssigning::all(); // Fetch vehicle assignments
    }

    public function openEditModal($paymentId)
    {
        $this->selectedPayment = Payment::findOrFail($paymentId);
        $this->driver_id = $this->selectedPayment->driver_id;
        $this->vehicle_assigning_id = $this->selectedPayment->vehicle_assigning_id;
        $this->purpose = $this->selectedPayment->purpose;
        $this->amount = $this->selectedPayment->amount;
        $this->description = $this->selectedPayment->description;
        $this->showEditModal = true;
    }

    public function updatePayment()
    {
        $this->validate([
            'driver_id' => 'required|exists:drivers,id',
            'vehicle_assigning_id' => 'required|exists:vehicle_assignings,id',
            'purpose' => 'required|string|max:255',
            'amount' => 'required|numeric',
            'description' => 'nullable|string',
        ]);

        $vehicleAssigning = VehicleAssigning::find($this->vehicle_assigning_id);
        $this->selectedPayment->update([
            'driver_id' => $this->driver_id,
            'vehicle_assigning_id' => $this->vehicle_assigning_id,
            'purpose' => $this->purpose,
            'amount' => $this->amount,
            'description' => $this->description,
            'company_id'            => $vehicleAssigning->company_id,
            'vehicle_id'            => $vehicleAssigning->vehicle_id,
            'vehicle_file_no'       => $vehicleAssigning->vehicle_file_no,
            'user_id'               => Auth::id(),
        ]); 

       $this->emit('closemodal');
        $this->dispatchBrowserEvent(
            'alert', ['type' => 'success',  'message' => 'Payment has been updated!']);
        $this->payments = Payment::all(); // Refresh the payment list
    }

    public function render()
    {
        return view('livewire.admin.payments.payments-table', [
            'payments' => $this->payments
        ]);
    }

    public function deletePayment($paymentId ){
        $this->selectedPayment = Payment::findOrFail($paymentId)->delete();
        $this->dispatchBrowserEvent(
            'alert', ['type' => 'success',  'message' => 'Payment has been Deleted!']);
        $this->payments = Payment::all(); // Refresh the payment list
    }
}
