<div>
    <!-- <center>
                            <div>
                                @php
                                $logo = '/uploads/logo/1698697749.png';
                                @endphp
                                <img src="{{ $logo }}" alt="Company Logo" style="width: auto; height: auto; max-width: 60%; max-height: 60%;">
                            </div>
                       </center>
<br> -->
<div class="col-auto d-none d-sm-block">
        <h3><strong>{{$lang->data['expense'] ?? 'Payments'}}</strong></h3>
    </div>

    <table class="table tableh table-striped">
        <thead>
            <tr>
                <!-- <th>Sl</th>
                 --><th>Date</th>
                <th>Driver</th>
                <th>Added By</th>
                <!-- <th>Vehicle Assigning</th> -->
                <th>Purpose</th>
                <th>Amount</th>
                <th>Company</th>
                <!-- <th>Vehicle</th> -->
                <th>Vehicle File No</th>
                <th>Description</th>
            </tr>
        </thead>
        <tbody>
            @forelse($data['payments'] as $payment)
                <tr>

                    <!-- <td>{{ $loop->index + 1 }}</td>
                     --><td>{{ date('d/m/Y', strtotime($payment->created_at)) }}</td>
                            
                    <td>{{ $payment->driver->name  }}</td>
                    <td>{{ $payment->user->name ?? '--' }}</td>
                    
                    <!-- <td>{{ $payment->vehicle_assigning_id }}</td>
                     --><td>{{ $payment->purpose }}</td>
                    <td>{{ $payment->amount }}</td>
                    <td>{{ $payment->company->name }}</td>
                    <!-- <td>{{ $payment->vehicle->plate_no }}/{{ $payment->vehicle->owner_name }}/{{ $payment->vehicle->vehicle_model }}/{{ $payment->vehicle->fuel_type }}</td>
                     --><td>{{ $payment->vehicle_file_no }}</td>
                    <td>{{ $payment->description }}</td>
                </tr>
            @empty
                <tr>
                    <td colspan="9" class="text-center">No payments found.</td>
                </tr>
            @endforelse
        </tbody>
    </table>

    <!-- Pagination links -->
    <div class="mt-4">
        {{ $data['payments']->links() }}
    </div>
    <div class="col-auto d-none d-sm-block">
        <h3><strong>{{$lang->data['expense'] ?? 'Expences'}}</strong></h3>
    </div>
<table class="table tableh table-striped table-bordered mb-0">
                        <thead class="bg-secondary-light">
                        <tr>
                            <!-- <th class="tw-5">{{$lang->data['sl'] ?? 'Sl'}}</th>
                             --><th class="tw-15">{{$lang->data['date'] ?? 'Date'}}</th>
                            <th>Added By</th>
                
                            <th class="tw-20">{{$lang->data['vehicle_plate_no'] ?? 'File no. & Company'}}</th>
                            <th class="tw-15">{{$lang->data['expense_type'] ?? 'Driver '}}</th>
                            <th class="tw-15">{{$lang->data['expense_type'] ?? 'Expense Type '}}</th>
                            <th class="tw-15">{{$lang->data['amount'] ?? 'Amount'}}</th>
                            <th class="tw-15">{{$lang->data['description'] ?? 'Description'}}</th>
                            <!-- <th class="tw-15">{{$lang->data['actions'] ?? 'Actions'}}</th> -->
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($data['expenses'] as $item)
                        <tr>
                            <!-- <td>{{$loop->index + 1}}</td>
                             --><td>{{ date('d/m/Y', strtotime($item->date)) }}</td>
                            <td>{{$item->user->name ?? '--'}}</td>
                                
                            <td>{{$item->assigning->vehicle->file_no}}-{{$item->assigning->company->name}} </td>
                            <td><strong>{{$item->assigning->driver->name}}</strong></td>

                            <td><span class="badge bg-dark">{{$item->expensetype->name}}</span></td>
                            <td>{{$item->amount}}</td>
                             <td>{{$item->description}}</td>
                           
                            <!-- <td>
                               
                                @if(Auth::user()->can('edit_expenses'))
                                <a href="{{route('admin.edit_expense',$item->id)}}" class="btn btn-sm btn-primary">{{$lang->data['edit'] ?? 'Edit'}}</a>
                                @endif

                                @if(Auth::user()->can('delete_expenses'))
                                <a href="#" class="btn btn-sm btn-danger" wire:click="delete({{$item}})">{{$lang->data['delete'] ?? 'Delete'}}</a>
                                @endif

                            </td> -->
                        </tr>
                        @endforeach
                    </tbody>
                </table>
                @if(count($data['expenses']) == 0)
                    <x-no-data-component message="{{$lang->data['no_products_found'] ?? 'No Expenses were found..'}}" />
                @endif
<div class="col-auto d-none d-sm-block">
        <h3><strong>{{$lang->data['salary'] ?? 'Salary'}}</strong></h3>
    </div>
<table class="table tableh table-striped table-bordered mb-0">
                        <thead class="bg-secondary-light">
                        <tr>
                            <!-- <th class="tw-5">{{$lang->data['sl'] ?? 'Sl'}}</th>
                             --><th class="tw-15">{{$lang->data['date'] ?? 'Date'}}</th>
                            <th>Added By</th>
                
                            <th class="tw-20">{{$lang->data['vehicle_plate_no'] ?? 'File no. & Company'}}</th>
                            <th class="tw-15">{{$lang->data['expense_type'] ?? 'Driver '}}</th>
                            <th class="tw-15">{{$lang->data['expense_type'] ?? 'Expense Type '}}</th>
                            <th class="tw-15">{{$lang->data['amount'] ?? 'Amount'}}</th>
                            <th class="tw-15">{{$lang->data['description'] ?? 'Description'}}</th>
                            <!-- <th class="tw-15">{{$lang->data['actions'] ?? 'Actions'}}</th> -->
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($data['sellary'] as $item)
                        <tr>
                            <!-- <td>{{$loop->index + 1}}</td>
                             --><td>{{ date('d/m/Y', strtotime($item->date)) }}</td>
                            <td>{{$item->user->name ?? '--'}}</td>
                                
                            <td>{{$item->assigning->vehicle->file_no}}-{{$item->assigning->company->name}} </td>
                            <td><strong>{{$item->assigning->driver->name}}</strong></td>

                            <td><span class="badge bg-dark">{{$item->expensetype->name}}</span></td>
                            <td>{{$item->amount}}</td>
                             <td>{{$item->description}}</td>
                           
                            <!-- <td>
                               
                                @if(Auth::user()->can('edit_expenses'))
                                <a href="{{route('admin.edit_expense',$item->id)}}" class="btn btn-sm btn-primary">{{$lang->data['edit'] ?? 'Edit'}}</a>
                                @endif

                                @if(Auth::user()->can('delete_expenses'))
                                <a href="#" class="btn btn-sm btn-danger" wire:click="delete({{$item}})">{{$lang->data['delete'] ?? 'Delete'}}</a>
                                @endif

                            </td> -->
                        </tr>
                        @endforeach
                    </tbody>
                </table>
                @if(count($data['sellary']) == 0)
                    <x-no-data-component message="{{$lang->data['no_products_found'] ?? 'No Expenses were found..'}}" />
                @endif
                <div class="col-auto d-none d-sm-block">
            <h3><strong>{{$lang->data['maintainance']??'Maintainance'}}</strong></h3>
        </div>
<table class="table tableh datatable table-striped table-bordered mb-0">
                        <thead class="bg-secondary-light">
                            <tr>
                                <th class="tw-15">{{$lang->data['date'] ?? 'Date'}}</th>
                                <td>{{$item->user->name ?? '--'}}</td>
                                 
                                 <th class="tw-15">{{$lang->data['vehicle_plate_no'] ?? 'File no. & Company'}}</th>
                                 <th class="tw-10">{{$lang->data['vehicle_file_no'] ?? 'Driver'}}</th>
                                <th class="tw-15">{{$lang->data['parts_type'] ?? 'Parts Type '}}</th>
                                <th class="tw-15">{{$lang->data['amount'] ?? 'Parts Amount'}}</th>
                                <th class="tw-15">{{$lang->data['garage_services_charges'] ?? 'Garage Services Charges'}}</th>
                                <th class="tw-15">{{$lang->data['description'] ?? 'Description'}}</th>
                                <th class="tw-15">{{$lang->data['total'] ?? 'Total'}}</th>
                                
                                
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($data['maintainances'] as $item)
                            <tr>
                                <td>{{ date('d/m/Y', strtotime($item->date)) }}</td>
                                <td>{{$item->user->name ?? '--'}}</td>
                                
                                <td>{{$item->assigning->vehicle->file_no}}-{{$item->assigning->company->name}} </td>
                                <td><strong>{{$item->assigning->driver->name}}</strong></td>
                                <td><span class="badge bg-dark">{{$item->partstype->name}}</span></td>
                                <td>{{$item->payment}}</td>
                                <td>{{$item->garage_services_charges}}</td>
                                <td>{{$item->description}}</td>
                                <td>{{$item->total}}</td>
                                
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                    @if(count($data['maintainances']) == 0)
                        <x-no-data-component message="No Maintainance Record were found" messageindex="not_found"/>
                    @endif
                <div class="col-auto d-none d-sm-block">
        <h3><strong>{{$lang->data['drivres'] ?? 'Drivers'}}</strong></h3>
    </div>
    <table class="table tableh table-striped table-bordered mb-0">
                        <thead class="bg-secondary-light">
                            <tr>
                                <!-- <th class="tw-5">{{$lang->data['sl']??'Sl'}}</th>
                                 --><th>Date</th>
                                <th>Added By</th>
                
                                <th class="tw-20">{{$lang->data['name']??'Name'}}</th>
                                <th class="tw-20">{{$lang->data['mobile_no']??'Mobile No.'}}</th>
                                <th class="tw-20">{{$lang->data['registration_no']??'Registration No'}}</th>
                                <th class="tw-20">{{$lang->data['monthly_salary']??'Monthly Salary'}}</th>
                                <th class="tw-20">{{$lang->data['Status']??'Status'}}</th>
                                <th class="tw-20">Busses Assigned</th>
                                <!-- <th class="tw-10">{{$lang->data['actions']??'Actions'}}</th> -->
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($data['drivers'] as $item)
                            <tr>
                                <!-- <td>{{$loop->index+1}}</td>
                                 --><td>{{ date('d/m/Y', strtotime($item->created_at)) }}</td>
                                <td>{{$item->user->name ?? '--'}}</td>
                                <td>{{$item->name}}</td>
                                <td>{{$item->mobile_no}}</td>
                                <td>{{ date('d/m/Y', strtotime($item->registration_date)) }}</td>
                                <td>{{$item->monthly_salary}}</td>
                               <td>
                                    @if ($item->status == 1)
                                        <span style="font-weight: bold; color: blue;">Booked</span>
                                    @else
                                        <span style="font-weight: bold; color: green;">Free</span>
                                    @endif
                                </td>
                                    
                                
                                <td>@foreach($item->assigning()->get() as $a)
                                    
                                 File No:{{ $a->vehicle->file_no ?? '--' }} | Plate No:{{ $a->vehicle->plate_no ?? '--'  }} | Owner:{{ $a->vehicle->owner_name ?? '--'  }} | Type:{{ $a->vehicle->vehicle_type ?? '--'  }} | Model:{{ $a->vehicle->vehicle_model ?? '--'  }} | Fuel:{{ $a->vehicle->fuel_type ?? '--'  }}
                                 <br>

                                 @endforeach
                             </td>
                                <!-- <td>
                                    @if(Auth::user()->can('edit_driver'))
                                    <a href="#" class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#EditModalCustomer" wire:click='edit({{$item}})'>{{$lang->data['edit']??'Edit'}}</a>
                                    @endif
                                    @if(Auth::user()->can('edit_driver'))
                                    <a href="#" class="btn btn-sm btn-danger" wire:click="delete({{$item}})">{{$lang->data['delete']??'Delete'}}</a>
                                    @endif
                                </td> -->
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                    @if(count($data['drivers']) == 0)
                        <x-no-data-component message="No Customers were found" messageindex="no_customers_found"/>
                    @endif
                    <div class="col-auto d-none d-sm-block">
        <h3><strong>{{$lang->data['expense'] ?? 'Vehicle Assigning List'}}</strong></h3>
    </div>
    <table class="table tableh table-striped table-bordered mb-0">
                    <thead class="bg-secondary-light">
                        <tr>
                            <!-- <th class="tw-5">{{$lang->data['sl'] ?? 'Sl'}}</th>
                             --><th class="tw-15">{{$lang->data['date'] ?? 'Date'}}</th>
                            <th>Added By</th>
                
                            <th class="tw-10">{{$lang->data['vehicle_file_no'] ?? 'Vehicle File No'}}</th>
                            <th class="tw-15">{{$lang->data['vehicle_plate_no'] ?? 'Vehicle Plate No'}}</th>
                            <th class="tw-10">{{$lang->data['company'] ?? 'Company'}}</th>
                            <th class="tw-10">{{$lang->data['driver'] ?? 'Driver'}}</th>
                            <th class="tw-10">{{$lang->data['amount'] ?? 'Amount'}}</th>
                            <th class="tw-10">{{$lang->data['agreement'] ?? 'End of Aggrement'}}</th>
                            <th class="tw-10">{{$lang->data['status'] ?? 'Status'}}</th>
                            <!-- <th class="tw-15">{{$lang->data['actions'] ?? 'Actions'}}</th> -->
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($data['assignings'] as $item)
                        <tr>
                            <!-- <td>{{$loop->index + 1}}</td>
                             --><td>{{ date('d/m/Y', strtotime($item->date)) }}</td>
                            <td>{{$item->user->name ?? '--'}}</td>
                                
                            <td>{{$item->vehicle->file_no}}</td>
                            <td>{{$item->vehicle->plate_no}}</td>
                            <td>{{$item->company->name}}</td>
                            <td>{{$item->driver->name}}</td>
                            <td>{{$item->amount}}</td>
                            <td>{{ date('d/m/Y', strtotime($item->end_of_time)) }}</td>
                            
                            <td>
                                @if ($item->status == 1)
                                    <span style="font-weight: bold; color: blue;">booked</span>
                                @else
                                    <span style="font-weight: bold; color: red;">Stop</span>
                                @endif
                            </td>

                            <!-- <td>
                                
                                @if(Auth::user()->can('delete_assigning')&& (Auth::user()->can('edit_assigning')) && ($item->status == 1))
                                    <a href="#" class="btn btn-sm btn-danger" wire:click="end_assigning({{ $item->id }})">{{ $lang->data['delete'] ?? 'End Assigning' }}</a>
                                    <a href="{{route('admin.edit_assigning',$item->id)}}" class="btn btn-sm btn-primary">{{$lang->data['edit'] ?? 'Edit'}}</a>
                                 @else
                                    <span style="font-weight: bold; color: red;">Stop</span>
                                @endif

                            </td> -->
                        </tr>
                        @endforeach
                    </tbody>
                </table>
                @if(count($data['assignings']) == 0)
                    <x-no-data-component message="{{$lang->data['no_products_found'] ?? 'No Assigning were found..'}}" />
                @endif
                <div class="col-auto d-none d-sm-block">
            <h3><strong>{{$lang->data['bus']??'Bus'}}</strong></h3>
        </div>
<table class="table tableh table-striped table-bordered mb-0">
                        <thead class="bg-secondary-light">
                            <tr>
                                <!-- <th class="tw-5">{{$lang->data['sl']??'Sl'}}</th>
                                 --><th class="tw-15">{{$lang->data['registration_date']??'Registration Date'}}</th>
                                <th>Added By</th>
                
                                
                                <th class="tw-8">{{$lang->data['file_no']??'File No.'}}</th>
                                <th class="tw-12">{{$lang->data['plate_no']??'Plate No.'}}</th>
                                <th class="tw-12">{{$lang->data['owner']??'Owner'}}</th>
                                <th class="tw-12">{{$lang->data['vehicle_type']??'Vehicle Type'}}</th>
                                <th class="tw-12">{{$lang->data['vehicle_type']??'Model'}}</th>
                                <th class="tw-12">{{$lang->data['vehicle_type']??'Fuel Type'}}</th>
                                <th class="tw-15">{{$lang->data['insurance_start_date']??'Istamara End Date '}}</th>
                                <th class="tw-15">{{$lang->data['insurance_end_date']??'Insurance End'}}</th>
                                <th class="tw-15">{{$lang->data['Status']??'Status'}}</th>
                                <!-- <th class="tw-10">{{$lang->data['actions']??'Actions'}}</th> -->
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($data['vehicles'] as $item)
                            <tr>
                                <!-- <td>{{$loop->index+1}}</td>
                                 --><td>{{ date('d/m/Y', strtotime($item->registration_date)) }}</td>
                                <td>{{$item->user->name ?? '--'}}</td>
                                
                                <td>{{$item->file_no}}</td>
                                <td>{{$item->plate_no}}</td>
                                <td>{{$item->owner_name}}</td>
                                <td>{{$item->vehicle_type}}</td>
                                <td>{{$item->vehicle_model}}</td>
                                <td>{{$item->fuel_type}}</td>
                                <td>{{ date('d/m/Y', strtotime($item->istamara_end_date)) }}</td>
                                <td>{{ date('d/m/Y', strtotime($item->insurance_end_date)) }}</td>
                    
                                <td>
                                    @if ($item->status == 1)
                                        <span style="font-weight: bold; color: blue;">booked</span>
                                    @else
                                        <span style="font-weight: bold; color: green;">Free</span>
                                    @endif
                                </td>
                                <!-- <td>
                                    @if(Auth::user()->can('edit_vehicles'))
                                    <a href="#" class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#EditVehicle" wire:click='edit({{$item}})'>{{$lang->data['edit']??'Edit'}}</a>
                                    @endif
                                    @if(Auth::user()->can('delete_vehicles'))
                                    <a href="#" class="btn btn-sm btn-danger" wire:click="delete({{$item}})">{{$lang->data['delete']??'Delete'}}</a>
                                    @endif
                                </td> -->
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                    @if(count($data['vehicles']) == 0)
                        <x-no-data-component message="No Bus were found" messageindex="no_bus_found"/>
                    @endif
</div>
	