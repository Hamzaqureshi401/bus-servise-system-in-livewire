<?php

namespace App\Http\Livewire\Admin;
use Livewire\WithPagination;

//use App\Models\Order;
use App\Models\Payment;
use App\Models\Expense;
use App\Models\Driver;
use App\Models\VehicleAssigning;
use App\Models\Vehicle;
use App\Models\Maintainance;

use Carbon\Carbon;
use Livewire\Component;

class Home extends Component
{
    use WithPagination;
    public $lang , $data;
    /* render the page */
    public function render()
    {
       // $this->latestorders = Order::whereDate('date',Carbon::today())->get();
        //$this->pendingorders = Order::whereStatus(Order::PENDING)->get();
        return view('livewire.admin.home');
    }
    /* process before render */
    public function mount()
{
    // Fetch data from the models
    $this->data['payments'] = Payment::latest()->paginate(5);
    $this->data['expenses'] = Expense::whereExpenseTypeId(1)->latest()->paginate(5);
    $this->data['sellary'] = Expense::whereExpenseTypeId(2)->latest()->paginate(5);
    $this->data['drivers']  = Driver::latest()->paginate(5);
    $this->data['assignings'] = VehicleAssigning::latest()->paginate(5);
    $this->data['vehicles']  = Vehicle::latest()->paginate(5);
    $this->data['maintainances']  = Maintainance::latest()->paginate(5);

    // Get the latest updated timestamps for summary
    $this->latestUpdates = [
        'Payments' => $this->data['payments']->isNotEmpty() ? $this->data['payments']->max('updated_at') : null,
        'Expenses' => $this->data['expenses']->isNotEmpty() ? $this->data['expenses']->max('updated_at') : null,
        'Sellary' => $this->data['sellary']->isNotEmpty() ? $this->data['sellary']->max('updated_at') : null,
        'Drivers' => $this->data['drivers']->isNotEmpty() ? $this->data['drivers']->max('updated_at') : null,
        'Assignments' => $this->data['assignings']->isNotEmpty() ? $this->data['assignings']->max('updated_at') : null,
        'Vehicles' => $this->data['vehicles']->isNotEmpty() ? $this->data['vehicles']->max('updated_at') : null,
        'Maintainances' => $this->data['maintainances']->isNotEmpty() ? $this->data['maintainances']->max('updated_at') : null,
    ];

    // Convert to array of models and their last updated timestamps
    $this->latestUpdates = array_filter($this->latestUpdates); // Remove null entries
    arsort($this->latestUpdates); // Sort by latest update first

    $this->lang = getTranslation();
}


}
