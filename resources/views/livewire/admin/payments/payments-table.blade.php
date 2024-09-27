<div>
    
    <!-- Payments Table -->
    <table class="table tableh table-striped">
        <thead>
            <tr>
                <th>ID</th>
                <th>Driver</th>
                <th>Purpose</th>
                <th>Amount</th>
                <th>Company</th>
                <th>Vehicle File No</th>
                <th>Description</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            @forelse($payments as $payment)
                <tr>
                    <td>{{ $payment->id }}</td>
                    <td>{{ $payment->driver->name }}</td>
                    <td>{{ $payment->purpose }}</td>
                    <td>{{ $payment->amount }}</td>
                    <td>{{ $payment->company->name }}</td>
                    <td>{{ $payment->vehicle_file_no }}</td>
                    <td>{{ $payment->description }}</td>
                    <td>
                        <!-- Edit Button triggers modal -->
                        <a href="#" class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#EditVehicle" wire:click="openEditModal({{ $payment->id }})" class="btn btn-sm btn-primary">Edit</a >

                        <a href="#" class="btn btn-sm btn-danger" wire:click="deletePayment({{ $payment->id }})" class="btn btn-sm btn-primary">Delete</a >
                    </td>
                </tr>
            @empty
                <tr>
                    <td colspan="9" class="text-center">No payments found.</td>
                </tr>
            @endforelse
        </tbody>
    </table>

<!-- Edit Payment Modal -->
@if($showEditModal)
<div class="modal fade" id="EditVehicle" tabindex="-1" role="dialog" aria-hidden="true" wire:ignore.self>
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">{{$lang->data['add_new_bus'] ?? 'Edit Payment'}}</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form wire:submit.prevent="updatePayment">
                    <div class="mb-3">
                        <label for="driver_id" class="form-label">Driver</label>
                        <select class="form-control" wire:model="driver_id">
                            <option value="">{{ $lang->data['choose'] ?? 'Choose...' }}</option>
                            @foreach($drivers as $driver)
                                <option value="{{ $driver->id }}">{{ $driver->name }}</option>
                            @endforeach
                        </select>
                    </div>
                    
                    <div class="mb-3">
                        <label for="vehicleAssigning_id" class="form-label">Assigned Vehicle</label>
                        <select class="form-control" wire:model="vehicle_assigning_id">
                            <option value="">{{ $lang->data['choose'] ?? 'Choose...' }}</option>
                            @foreach($vehicleAssigning as $item)
                                <option value="{{ $item->id }}">{{ $item->company->name ?? '--' }}/{{ $item->driver->name ?? '--' }}/{{ $item->vehicle->file_no ?? '--' }}</option>
                            @endforeach
                        </select>
                    </div>

                    <div class="mb-3">
                        <label for="purpose" class="form-label">Purpose</label>
                        <select class="form-control" wire:model="purpose">
                            <option value="">{{ $lang->data['choose'] ?? 'Choose...' }}</option>
                            <option value="Petrol">Petrol</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>
                    
                    <div class="mb-3">
                        <label for="amount" class="form-label">Amount</label>
                        <input type="number" wire:model="amount" class="form-control">
                    </div>

                    <div class="mb-3">
                        <label for="description" class="form-label">Description</label>
                        <textarea wire:model="description" class="form-control"></textarea>
                    </div>

                    <button type="submit" class="btn btn-primary">Update Payment</button>
                </form>
            </div>
        </div>
    </div>
</div>
@endif


