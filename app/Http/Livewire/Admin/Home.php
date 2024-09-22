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
        $this->data['payments'] = Payment::latest()->paginate(5);
        $this->data['expenses'] = Expense::latest()->paginate(5);
        $this->data['drivers']  = Driver::latest()->paginate(5);
        $this->data['assignings'] = VehicleAssigning::latest()->paginate(5);
        $this->data['vehicles']  = Vehicle::latest()->paginate(5);
        $this->data['maintainances']  = Maintainance::latest()->paginate(5);

        $this->lang = getTranslation();
    }

}
