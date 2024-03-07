@extends('admin.layouts.app')
@section('panel')
    <div class="row">
        <div class="col-lg-12">
            <div class="card b-radius--10">
                <div class="card-body p-0">
                    <div class="table-responsive--md table-responsive">
                        <table class="table--light style--two table">
                            <thead>
                                <tr>
                                    <th>@lang('Game Name')</th>
                                    <th>@lang('User')</th>
                                    <th>@lang('User Select')</th>
                                    <th>@lang('Result')</th>
                                    <th>@lang('Invest')</th>
                                    <th>@lang('Win or fail')</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($logs as $log)
                                    <tr>
                                        <td>{{ __($log->game->name) }}</td>
                                        <td>
                                            <span class="fw-bold">{{ @$log->user->fullname }}</span>
                                            <br>
                                            <span class="small">
                                                <a href="{{ route('admin.users.detail', $log->user->id) }}"><span>@</span>{{ $log->user->username }}</a>
                                            </span>
                                        </td>
                                        <td>
                                            @if (gettype(json_decode($log->user_select)) == 'array')
                                                {{ implode(', ', json_decode($log->user_select)) }}
                                            @else
                                                {{ __($log->user_select) }}
                                            @endif
                                        </td>
                                        <td>
                                            @if (gettype(json_decode($log->result)) == 'array')
                                                {{ implode(', ', json_decode($log->result)) }}
                                            @else
                                                {{ __($log->result) }}
                                            @endif
                                        </td>
                                        <td>{{ $general->cur_sym }}{{ __(showAmount($log->invest)) }} </td>
                                        <td>
                                            @if ($log->win_status != Status::LOSS)
                                                <span class="badge badge--success">@lang('Win')</span>
                                            @else
                                                <span class="badge badge--danger">@lang('Loss')</span>
                                            @endif
                                        </td>
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
                @if ($logs->hasPages())
                    <div class="card-footer py-4">
                        {{ paginateLinks($logs) }}
                    </div>
                @endif
            </div>
        </div>
    </div>
@endsection
@push('breadcrumb-plugins')
            <x-search-form />
            <div class="input-group w-auto">
                <select class="form-control win-status" name="win_status" form="filter-form">
                    <option value="">@lang('All')</option>
                    <option value="1" @selected(request()->win_status == 1)>@lang('Win')</option>
                    <option value="0" @selected(request()->win_status != null && request()->win_status == 0)>@lang('Loss')</option>
                </select>
                <button form="filter-form" class="btn btn--primary input-group-text" type="submit"><i class="fa fa-search"></i></button>
            </div>
@endpush

@push('style')
    <style>
        .win-status {
            width: 217px !important;
        }
    </style>
@endpush
