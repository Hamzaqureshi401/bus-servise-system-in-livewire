<div>
    <!-- Search input -->
    <div class="mb-4">
        <input type="text" wire:model="searchTerm" placeholder="Search payments..." class="form-control">
    </div>
  @if(Auth::user()->can('add_assigning'))
    <div class="col-auto ms-auto text-end mt-n1">
        <a href="{{route('admin.add.payments')}}" class="btn btn-primary">{{$lang->data['new_add_payments'] ?? 'New Payments'}}</a>
    </div>
    @endif
    <!-- Payments Table -->
    <table class="table table-striped">
        <thead>
            <tr>
                <th>ID</th>
                <th>Driver</th>
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
            @forelse($payments as $payment)
                <tr>
                    <td>{{ $payment->id }}</td>
                    <td>{{ $payment->driver->name  }}</td>
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
        {{ $payments->links() }}
    </div>
</div>
