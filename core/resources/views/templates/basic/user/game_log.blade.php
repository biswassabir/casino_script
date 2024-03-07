@extends($activeTemplate . 'layouts.master')
@section('content')
    <div class="pt-120 pb-120">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body p-0">
                            <div class="table--responsive">
                                <table class="style--two table">
                                    <thead>
                                        <tr>
                                            <th>@lang('Game Name')</th>
                                            <th>@lang('You Select')</th>
                                            <th>@lang('Result')</th>
                                            <th>@lang('Invest')</th>
                                            <th>@lang('Win or Lost')</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @forelse($logs as $log)
                                            <tr>
                                                <td>
                                                    <span class="text-end">{{ __($log->game->name) }}</span>
                                                </td>
                                                <td>
                                                    <div>
                                                        @if (gettype(json_decode($log->user_select)) == 'array')
                                                            {{ implode(', ', json_decode($log->user_select)) }}
                                                        @else
                                                            {{ __($log->user_select) }}
                                                        @endif
                                                    </div>
                                                </td>
                                                <td>
                                                    <div>
                                                        @if (gettype(json_decode($log->result)) == 'array')
                                                            {{ implode(', ', json_decode($log->result)) }}
                                                        @else
                                                            {{ __($log->result) }}
                                                        @endif
                                                    </div>
                                                </td>
                                                <td><span>{{ $general->cur_sym }}{{getAmount($log->invest) }}</span> </td>
                                                <td>
                                                    @if ($log->win_status != Status::LOSS)
                                                        <span class="badge badge--success"><i class="las la-smile"></i> @lang('Win')</span>
                                                    @else
                                                        <span class="badge badge--danger"><i class="las la-frown"></i> @lang('Lost')</span>
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
                            <div class="card-footer">
                                {{ paginateLinks($logs) }}
                            </div>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
