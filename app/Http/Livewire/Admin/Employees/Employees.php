<?php


namespace App\Http\Livewire\Admin\Employees;
use App\Models\Employee;
use Livewire\Component;
use Illuminate\Support\Facades\Auth;

class Employees extends Component
{
    public $employee,$name,$mobile_no,$registration_date,$status = true,$lang;
    public  $employees ;
    /* render the page */
    public function render()
    {
        $this->employees = Employee::latest()->get();
        return view('livewire.admin.employee.employee');
    }
    /* process before render */
    public function mount()
    {
        $this->lang = getTranslation();
        if(!Auth::user()->can('employee_list'))
        {
            abort(404);
        }
    }
    /* store Employee data */
    public function create()
    {
        $this->validate([
            'name'  => 'required',
            
        ]);
        $employee = new Employee();
        $employee->name = $this->name;
        $employee->mobile_no = $this->mobile_no;
        $employee->registration_date = $this->registration_date;
        $employee->save();
        $this->emit('closemodal');
        $this->dispatchBrowserEvent(
            'alert', ['type' => 'success',  'message' => 'Employee has been added!']);
    }

    /* reset Employee data */
    public function edit(Employee $employee)
    {
        $this->resetFields();
        $this->employee = $employee;
        $this->name = $employee->name;
        $this->mobile_no = $employee->mobile_no;
        $this->registration_date = $employee->registration_date;
    }
    /* update driver data */
    public function update()
    {
        $this->validate([
            'name'  => 'required',
            
        ]);
        $employee = $this->employee;
        $employee->name = $this->name;
        $employee->mobile_no = $this->mobile_no;
        $employee->registration_date = $this->registration_date;
        $employee->save();
        $this->emit('closemodal');
        $this->dispatchBrowserEvent(
            'alert', ['type' => 'success',  'message' => 'Employee has been updated!']);
    }
    /* delete driver data */
    public function delete(Employee $employee)
    {
        $employee->delete();
        $this->employee = null;
        $this->dispatchBrowserEvent(
            'alert', ['type' => 'success',  'message' => 'Employee has been deleted!']);
    }
    /* reset driver data */
    public function resetFields()
    {
        $this->name = '';
        $this->mobile_no = '';
        $this->registration_date = '';
        $this->resetErrorBag();
    }
}
