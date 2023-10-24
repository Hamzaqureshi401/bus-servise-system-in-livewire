<?php

namespace App\Http\Livewire\Admin\Reports;
use Carbon\Carbon;
//use App\Http\Components\DetailedReport;
 
use App\Models\User;
use App\Models\Driver;
use App\Models\Company;
use App\Models\Expense;
use App\Models\Vehicle;
use Livewire\Component;
use App\Models\ExpenseType;
use App\Models\Maintainance;
use App\Models\VehicleAssigning;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Maatwebsite\Excel\Facades\Excel;
use App\Exports\DetailedReportExport;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class DetailedReport extends Component
{
    public 
    $start_date, 
    $assignings,
    $expenses,
    $maintenances,
    $end_date, 
    $assignment_id,
    $vehicle_id,
    $data=[],
    $lang,
    $vehicle;
    /* render the page */
    public function render()
    {
        return view('livewire.admin.reports.detailed_report');
    }
    /* process before render */
    public function mount($id , $date)
    {
       // dd($date);
    $this->data = $this->generateReportVeriable($id , $date);
        $this->lang = getTranslation();
        if(!Auth::user()->can('day_wise_sales_report'))
        {
            abort(404);
        }

    }
    /* feach daily sales report */
    public function show(Request $request , $id)
    {

        $data = $this->generateReportVeriable($id);
        return view('livewire.admin.reports.detailed_report', [
            'assignmentId' => $id,
            'assignment'   => $data['assignment'],
            'assignings'   => $data['assignings'],
            'expenses'     => $data['expenses'],
            'maintenances' => $data['maintenances'],
        ]);
    } 

    public function generateReportVeriable($id , $date){

        $assignment = Vehicle::find($id);
        if (!$assignment) {
            // Handle the case when the assignment with the given ID is not found
            abort(404);
        }
        // $currentDate    = Carbon::now();
        // $startDate      = $currentDate->copy()->startOfMonth();
        // $endDate        = $currentDate->copy()->endOfMonth();

        $currentDate    = $date; //Carbon::now();
        $startDate      = $date; //$currentDate->copy()->startOfMonth();
        $endDate        = $date; //$currentDate->copy()->endOfMonth();      
        $assignings     = VehicleAssigning::where('vehicle_id', $id)
            //->whereBetween('date', [$startDate, $endDate])
                         ->whereDate('date' , $date)
            ->get();

        $expenses       = Expense::whereIn('assignment_id', $assignings->pluck('id')->toArray())
            //->whereBetween('date', [$startDate, $endDate])
                         ->whereDate('date' , $date)
            ->get();

        $maintenances   = Maintainance::where('assignment_id', $assignings->pluck('id')->toArray())
            //->whereBetween('date', [$startDate, $endDate])
                         ->whereDate('date' , $date)
            ->get();

        $data =[
            'assignment'  => $assignment,
            'currentDate' => $currentDate,
            'startDate'   => $startDate,
            'endDate'     => $endDate,
            'assignings'  => $assignings,
            'expenses'    => $expenses,
            'maintenances'=> $maintenances,
        ];
        return $data;
    }
    public function exportToExcel(){
        $this->getData();
        return Excel::download(new DaywiseReportExport($this->data ), 'bus-report.xlsx');
    }

    public function exportToPDF(){
        $this->getData();
        return Excel::download(new DaywiseReportExport($this->data ), 'bus-report.pdf', \Maatwebsite\Excel\Excel::DOMPDF);
    }
}
