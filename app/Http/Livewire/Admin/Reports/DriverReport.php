<?php

namespace App\Http\Livewire\Admin\Reports;

use Carbon\Carbon;
use App\Models\Payment;
use App\Exports\DaywiseReportExport;
use Illuminate\Support\Facades\Auth;
use Maatwebsite\Excel\Facades\Excel;
use Livewire\Component;

class DriverReport extends Component
{
    public $start_date, $end_date, $driver_id, $vehicle_file_no, $purpose, $company_id;
    public $payments = [];
    public $lang, $vehicle = [];

    public function mount()
    {
        $this->start_date = Carbon::today()->startOfMonth()->toDateString();
        $this->end_date = Carbon::today()->toDateString();
        $this->vehicle = Payment::with('driver', 'company', 'vehicle')->get();
        $this->lang = getTranslation();

        if (!Auth::user()->can('customer_report')) {
            abort(404);
        }

        // Initial data fetch
        $this->getData();
    }

    public function updated($propertyName)
    {
        $this->getData(); // Fetch report data whenever a property changes
    }

    public function getData()
    {
        $query = Payment::query();

        if ($this->start_date) {
            $query->where('created_at', '>=', $this->start_date . ' 00:00:00');
        }

        if ($this->end_date) {
            $query->where('created_at', '<=', $this->end_date . ' 23:59:59'); // Include the entire end date
        }

        if ($this->driver_id) {
            $query->where('driver_id', $this->driver_id);
        }

        if ($this->vehicle_file_no) {
            $query->where('vehicle_file_no', $this->vehicle_file_no);
        }

        if ($this->purpose) {
            $query->where('purpose', $this->purpose);
        }

        if ($this->company_id) {
            $query->where('company_id', $this->company_id);
        }

        $this->payments = $query->with('driver', 'company', 'vehicle')->get();
    }


    public function exportToExcel()
    {
        return Excel::download(new DaywiseReportExport($this->payments), 'bus-report.xlsx');
    }

    public function exportToPDF()
    {
        return Excel::download(new DaywiseReportExport($this->payments), 'bus-report.pdf', \Maatwebsite\Excel\Excel::DOMPDF);
    }

    public function render()
    {
        return view('livewire.admin.reports.driver-report');
    }
}
