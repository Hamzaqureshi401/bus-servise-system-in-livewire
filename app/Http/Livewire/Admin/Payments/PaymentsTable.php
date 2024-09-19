<?php

namespace App\Http\Livewire\Admin\Payments;
use Livewire\WithPagination;
use App\Models\Payment;

use Livewire\Component;

class PaymentsTable extends Component
{
    use WithPagination;

    public $searchTerm;

    public function render()
    {
        // Fetch payments with optional search functionality
        $payments = Payment::orWhere('purpose', 'like', '%' . $this->searchTerm . '%')
                    ->orWhere('amount', 'like', '%' . $this->searchTerm . '%')
                    ->orWhere('vehicle_file_no', 'like', '%' . $this->searchTerm . '%')
                    ->paginate(10);

        return view('livewire.admin.payments.payments-table', [
            'payments' => $payments
        ]);
    }
}
