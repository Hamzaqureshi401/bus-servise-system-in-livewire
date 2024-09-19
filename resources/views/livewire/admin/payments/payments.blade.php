<div>
    
<div class="row mb-2 mb-xl-3">
    <div class="col-auto d-none d-sm-block">
        <h3><strong>{{$lang->data['create_maintainance'] ?? 'Vehicle Assignment'}}</strong></h3>
    </div>

    <div class="col-auto ms-auto text-end mt-n1">
        <a href="{{route('admin.add_assigning')}}" class="btn btn-dark">{{$lang->data['back'] ?? 'Back'}}</a>
    </div>
</div>

<div class="col-md-12">
    <div class="card">

        <div class="card-body">
          
            <div class="row">
                 <div class="mb-3 col-md-6">
                    <label class="form-label">{{$lang->data['driver'] ?? 'Driver '}}<span class="text-danger"><strong>*</strong></span></label>
                    <select class="form-control" wire:change="driverData" wire:model="driver_id">
                        <option selected value="">{{$lang->data['choose'] ?? 'Choose...'}}</option>
                        @foreach ($driver as $item)
                            <option value="{{$item->id}}">{{$item->name}}</option>
                        @endforeach
                    </select>
                    @error('driver_id')
                        <span class="text-danger">{{$message}}</span>
                    @enderror
                </div>
                <div class="mb-3 col-md-6">
                    <label class="form-label">{{ 'Vehicle Assigning '}}<span class="text-danger"><strong>*</strong></span></label>
                    <select class="form-control" wire:change="vehicleAssigning" wire:model="vehicleAssigning_id">
                        <option selected value="">{{$lang->data['choose'] ?? 'Choose...'}}</option>
                        @foreach ($vehicleAssigning as $item)
                            <option value="{{$item->id}}">{{$item->company->name ?? '--'}}/{{$item->driver->name ?? '--'}}/{{$item->vehicle->file_no ?? '--'}}</option>
                        @endforeach
                    </select>
                    @error('vehicleAssigning_id')
                        <span class="text-danger">{{$message}}</span>
                    @enderror
                </div>
                 <div class="mb-3 col-md-6">
                    <label class="form-label">{{ 'Purpose '}}<span class="text-danger"><strong>*</strong></span></label>
                    <select class="form-control" wire:model="purpose">
                        <option selected value="">{{$lang->data['choose'] ?? 'Choose...'}}</option>
                       
                            <option value="{{'Petrol'}}">{{ 'Petrol' }}</option>
                            <option value="{{'Other'}}">{{ 'Other' }}</option>
                       
                    </select>
                    @error('purpose')
                        <span class="text-danger">{{$message}}</span>
                    @enderror
                </div>
                
               <div class="mb-3 col-md-6">
                    <label class="form-label" for="inputZip">{{ 'Payment'}} </label>       
                    <input type="number" class="form-control" wire:model="amount">
                </div>
                <div class="mb-3 col-md-6">
                    <label class="form-label" for="inputZip">{{ 'Description'}} </label>       
                    <input type="text" class="form-control" wire:model="description">
                </div>
 
            </div>
                
               
               
          
            


                <button type="button" class="btn btn-primary float-end" :disabled="isUploading == true" wire:click.prevent="create">{{$lang->data['submit'] ?? 'Submit'}}</button>
            </form>
        </div>
    </div>
</div>
</div>
