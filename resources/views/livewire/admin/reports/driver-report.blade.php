<div>

    <div class="row mb-2 mb-xl-3">
        <div class="col-auto d-none d-sm-block">
            <h3><strong>{{$lang->data['customer_report'] ?? 'Maintainance Report'}}</strong></h3>
        </div>
    </div>

    <div class="row">
        <div class="col-12">
            <div class="card p-0">
                <div class="card-header p-3">
                    <div class="row">
                        <div class="row">
                            <div class="col-md-3">
                                <label>{{$lang->data['start_date'] ?? 'Start Date'}}</label>
                                <input type="date" class="form-control" wire:model="start_date">
                            </div>
                            <div class="col-md-3">
                                <label>{{$lang->data['end_date'] ?? 'End Date'}}</label>
                                <input type="date" class="form-control" wire:model="end_date">
                            </div>

                            <div class="col-md-3">
                                <label class="form-label">{{$lang->data['driver'] ?? 'Driver '}}</label>
                                <select class="form-control" wire:model="driver_id">
                                    <option selected value="">{{$lang->data['choose'] ?? 'Choose...'}}</option>
                                    @foreach ($vehicle as $item)
                                    <option value="{{$item->driver_id}}">{{$item->driver->name}}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-md-3">
                                <label class="form-label">{{$lang->data['vehicle'] ?? 'Bus File no. '}}</label>
                                <select class="form-control" wire:model="vehicle_file_no">
                                    <option selected value="">{{$lang->data['choose'] ?? 'Choose...'}}</option>
                                    @foreach ($vehicle as $v)
                                    <option value="{{$v->vehicle_file_no }}">
                                        {{$v->vehicle_file_no}}
                                    </option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="mb-3 col-md-6">
                                <label class="form-label">{{ 'Purpose '}}<span class="text-danger"></span></label>
                                <select class="form-control" wire:model="purpose">
                                    <option selected value="">{{$lang->data['choose'] ?? 'Choose...'}}</option>

                                    <option value="{{'Petrol'}}">{{ 'Petrol' }}</option>
                                    <option value="{{'Other'}}">{{ 'Other' }}</option>

                                </select>
                                @error('purpose')
                                <span class="text-danger">{{$message}}</span>
                                @enderror
                            </div>
                            <div class="col-md-3">
                                <label class="form-label">{{$lang->data['Company'] ?? 'Company '}}</label>
                                <select class="form-control" wire:model="company_id">
                                    <option selected value="">{{$lang->data['choose'] ?? 'Choose...'}}</option>
                                    @foreach ($vehicle as $v)
                                    <option value="{{$v->company_id }}">
                                        {{$v->company->name}}
                                    </option>
                                    @endforeach
                                </select>
                            </div>

                            <div class="col-md-3 d-n-p">
                                <br>
                                <a href="#" class="btn btn-primary" wire:click='getData'>{{$lang->data['search'] ?? 'Search'}}</a>
                            </div>
                            <div class="col-2">
                                <br>
                                <a class="btn btn-primary print d-n-p">Print</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br>
        @if(count($payments) > 0)
        <div class="card-body p-0">
            <table class="table table-striped">
        <thead>
            <tr>
                <th>ID</th>
                <th>Driver</th>
                <th>Vehicle Assigning</th>
                <th>Purpose</th>
                <th>Amount</th>
                <th>Company</th>
                <th>Vehicle</th>
                <th>Vehicle File No</th>
                <th>Description</th>
            </tr>
        </thead>
        <tbody>
            @forelse($payments as $payment)
                <tr>
                    <td>{{ $payment->id }}</td>
                    <td>{{ $payment->driver->name  }}</td>
                    <td>{{ $payment->vehicle_assigning_id }}</td>
                    <td>{{ $payment->purpose }}</td>
                    <td>{{ $payment->amount }}</td>
                    <td>{{ $payment->company->name }}</td>
                    <td>{{ $payment->vehicle->plate_no }}/{{ $payment->vehicle->owner_name }}/{{ $payment->vehicle->vehicle_model }}/{{ $payment->vehicle->fuel_type }}</td>
                    <td>{{ $payment->vehicle_file_no }}</td>
                    <td>{{ $payment->description }}</td>
                </tr>
            @empty
                <tr>
                    <td colspan="9" class="text-center">No payments found.</td>
                </tr>
            @endforelse
        </tbody>
    </table>
            @else
            <x-no-data-component message="{{$lang->data['no_data_found'] ?? 'No data was found..'}}" />
            @endif
        </div>
    </div>