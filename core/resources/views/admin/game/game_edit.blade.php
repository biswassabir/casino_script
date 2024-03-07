@extends('admin.layouts.app')
@section('panel')
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <form action="{{ route('admin.game.update', $game->id) }}" method="POST">
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
                                                <div class="avatar-edit">
                                                    <input class="profilePicUpload" id="profilePicUpload" name="image" type="file" accept=".png, .jpg, .jpeg" requierd>
                                                    <label class="bg--primary" for="profilePicUpload">@lang('Post image')</label>
                                                    <small class="text-facebook mt-2">@lang('Supported files:') <b>@lang('jpeg, jpg')</b>. @lang('Image will be resized into') <b>{{ getFileSize('game') }}@lang('px')</b></small>
                                                </div>
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
                                <div class="row">
                                    <div class="col-md-5">
                                        <div class="card border--primary">
                                            <h5 class="card-header bg--primary">@lang('Play Amount')</h5>
                                            <div class="card-body">
                                                <div class="form-group">
                                                    <label>@lang('Minimum Invest Amount')</label>
                                                    <div class="input-group mb-3">
                                                        <input class="form-control" name="min" type="number" value="{{ getAmount($game->min_limit) }}" step="any" min="1" placeholder="@lang('Minimum Invest Amount')" required>
                                                        <span class="input-group-text" id="basic-addon2">{{ $general->cur_sym }}</span>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label>@lang('Maximum Invest Amount')</label>
                                                    <div class="input-group mb-3">
                                                        <input class="form-control" name="max" type="number" value="{{ getAmount($game->max_limit) }}" step="any" min="1" placeholder="@lang('Maximum Invest Amount')" required>
                                                        <span class="input-group-text" id="basic-addon2">{{ $general->cur_sym }}</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="card border--primary">
                                            <h5 class="card-header bg--primary">@lang('Win Setting') </h5>
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <label>@lang('Winning Chance')</label>
                                                            <div class="input-group mb-3">
                                                                <input class="form-control" name="probable" type="number" value="{{ getAmount($game->probable_win) }}" placeholder="@lang('Winning Chance')">
                                                                <span class="input-group-text" id="basic-addon2">@lang('%')</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label>@lang('Win Amount')</label>
                                                            <div class="input-group mb-3">
                                                                <input class="form-control" name="win" type="number" value="{{ getAmount($game->win) }}" step="any" placeholder="@lang('Win')">
                                                                <span class="input-group-text" id="basic-addon2">@lang('%')</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label>@lang('Invest')</label>
                                                            <input name="invest_back" data-width="100%" data-onstyle="-success" data-offstyle="-danger" data-bs-toggle="toggle" data-on="@lang('Give Back')" data-off="@lang('No Back"')" type="checkbox" @checked($game->invest_back)>
                                                        </div>
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
                                <h5 class="card-header bg--primary">@lang(' Game Instruction')</h5>
                                <div class="card-body">
                                    <div class="form-group">
                                        <textarea class="form-control border-radius-5 nicEdit" name="instruction" rows="8">@php echo $game->instruction @endphp</textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="mt-3">
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

