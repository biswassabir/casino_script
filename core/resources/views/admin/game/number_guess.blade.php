@extends('admin.layouts.app')
@section('panel')
<div class="row">
    <div class="col-lg-6">
        <div class="card b-radius--10">
            <div class="card-header">
                <h4 class="card-title mb-0">@lang('Current Setting')</h4>
            </div>
            <div class="card-body">
                <div class="table-responsive--md table-responsive">
                    <table class="table--light style--two table">
                        <thead>
                            <tr>
                                <th>@lang('Chance')</th>
                                <th>@lang('Commision')</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($bonuses as $bonus)
                            <tr>
                                <td>@lang('CHANCE#') {{ $bonus->chance }}</td>
                                <td>{{ getAmount($bonus->percent) }} %</td>
                            </tr>
                            @empty
                            <tr>
                                <td class="text-center" colspan="100%">{{ __($emptyMessage) }}</td>
                            </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="card b-radius--10">
            <div class="card-header">
                <h4 class="card-title mb-0">@lang('Change Setting')</h4>
            </div>
            <div class="card-body">

                <div class="form-group mb-0">
                    <label>@lang('Number of Chances')</label>
                    <div class="input-group">
                        <input type="number" name="level" min="1" placeholder="@lang('Type a number & hit ENTER ↵')" class="form-control">
                        <button type="button" class="btn btn--primary generate">@lang('Generate')</button>
                    </div>
                    <span class="text--danger required-message d-none">@lang('Please enter a number')</span>
                </div>
                <form action="{{ route('admin.game.chance.create') }}" method="post" class="d-none levelForm">
                    @csrf
                    <h6 class="text--danger my-3">@lang('Chance & Bonus old data will remove after generate')</h6>
                    <div class="form-group">
                        <div class="chanceLevels"></div>
                    </div>
                    <button type="submit" class="btn btn--primary h-45 w-100">@lang('Submit')</button>
                </form>

            </div>
        </div>
    </div>
</div>
<div class="row mt-5">
    <div class="col-lg-12">
        <div class="card">
            <form action="{{ route('admin.game.update', $game->id) }}" method="post" enctype="multipart/form-data">
                @csrf
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <div class="image-upload">
                                    <div class="thumb">
                                        <div class="avatar-preview">
                                            <div class="profilePicPreview" style="background-image: url({{ getImage(getFilePath('game') . '/' . $game->image, getFileSize('game')) }})">
                                                <button class="remove-image" type="button"><i class="fa fa-times"></i></button>
                                            </div>
                                        </div>
                                        <div class="avatar-edit">
                                            <input class="profilePicUpload" id="profilePicUpload" name="image" type="file" accept=".png, .jpg, .jpeg" requierd>
                                            <label class="bg--primary" for="profilePicUpload">@lang('Post image')</label>
                                            <small class="text-facebook mt-2">@lang('Supported files:') <b>@lang('jpeg, jpg')</b>. @lang('Image will be resized into') <b>{{ getFileSize('game') }}@lang('px')</b></small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="form-group">
                                <label>@lang('Game Name')</label>
                                <input class="form-control" name="name" type="text" value="{{ $game->name }}" placeholder="@lang('Game Name')" required>
                            </div>
                            <div class="row justify-content-center mt-5">
                                <div class="col-md-12">
                                    <div class="card border--primary">
                                        <h5 class="card-header bg--primary">@lang('Play Amount')</h5>
                                        <div class="card-body">
                                            <div class="form-group">
                                                <label>@lang('Minimum Invest Amount')</label>
                                                <div class="input-group">
                                                    <input class="form-control" name="min" type="number" step="any" value="{{ getAmount($game->min_limit) }}" min="1" placeholder="@lang('Minimum Invest Amount')" required>
                                                    <span class="input-group-text" id="basic-addon2">{{ $general->cur_sym }}</span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label>@lang('Maximum Invest Amount')</label>
                                                <div class="input-group">
                                                    <input class="form-control" name="max" type="number" step="any" value="{{ getAmount($game->max_limit) }}" min="1" placeholder="@lang('Maximum Invest Amount')" required>
                                                    <span class="input-group-text" id="basic-addon2">{{ $general->cur_sym }}</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="card border--primary mt-3">
                            <h5 class="card-header bg--primary">@lang('Game Instruction')</h5>
                            <div class="card-body">
                                <div class="form-group">
                                    <textarea class="form-control border-radius-5 nicEdit" name="instruction" rows="8">@php echo $game->instruction @endphp</textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 mt-3">
                        <button class="btn btn--primary w-100 h-45" type="submit">@lang('Submit')</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection

@push('breadcrumb-plugins')
<x-back route="{{ route('admin.game.index') }}" />
@endpush


@push('style')
<style type="text/css">
    .description {
        width: 100%;
        border: 1px solid #ddd;
        padding: 10px;
        border-radius: 5px
    }
</style>
@endpush
@push('script')
<script>
    (function($) {
        "use strict";
            $('[name="level"]').on('keyup', function(e){
                if(e.which == 13){
                    generrateLevels($(this));
                }
            });

        $(".generate").on('click', function () {
            let $this = $(this).parents('.card-body').find('[name="level"]');
            generrateLevels($this);
        });

        $(document).on('click', '.deleteBtn', function () {
            $(this).closest('.input-group').remove();
        });

        function generrateLevels($this){
            let numberOfLevel = $this.val();
            let parent = $this.parents('.card-body');
            let html = '';
            if (numberOfLevel && numberOfLevel > 0){
                parent.find('.levelForm').removeClass('d-none');
                parent.find('.required-message').addClass('d-none');

                for (i = 1; i <= numberOfLevel; i++){
                    html += `
                    <div class="input-group mb-3">
                        <span class="input-group-text justify-content-center">@lang('Chance') ${i}</span>
                        <input type="hidden" name="chance[]" value="${i}" required>
                        <input name="percent[]" class="form-control col-10" type="number" required placeholder="@lang('Commission Percentage')">
                        <button class="btn btn--danger input-group-text deleteBtn" type="button"><i class=\'la la-times\'></i></button>
                    </div>`
                }

                parent.find('.chanceLevels').html(html);
            }else {
                parent.find('.levelForm').addClass('d-none');
                parent.find('.required-message').removeClass('d-none');
            }
        }

        })(jQuery)
</script>
@endpush
