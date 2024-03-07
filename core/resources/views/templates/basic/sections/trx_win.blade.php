@php
$content = getContent('trx_win.content', true);
$latestWinners = \App\Models\GameLog::where('win_status', '!=', 0)
->where('win_amo', '>', '0')
->take(6)
->with(['user', 'game'])
->latest('id')
->get();
$transactions = \App\Models\Transaction::with('user')
->latest()
->limit(7)
->get();
@endphp
<section class="pt-120 pb-120">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-6 col-lg-8">
                <div class="section-header text-center">
                    <h2 class="section-title">{{ __(@$content->data_values->heading) }}</h2>
                    <p class="mt-3">{{ __(@$content->data_values->sub_heading) }}</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-4 wow fadeInUp" data-wow-duration="0.5s" data-wow-delay="0.3s">
                <h4 class="mb-4">@lang('Latest Winners')</h4>
                <div class="winner-slider winner-list">
                    @foreach ($latestWinners as $winner)
                    <div class="single-slide">
                        <div class="winner-item">
                            <div class="winner-content">
                                <h6 class="name">{{ $winner->user->fullname }}</h6>
                                <span>{{ __(@$winner->game->name) }}</span>
                            </div>
                            <div class="winner-amount">
                                <span class="text--base">{{ $general->cur_sym }}{{ getAmount($winner->win_amo) }}</span>
                            </div>
                        </div>
                    </div>
                    @endforeach
                </div>
            </div>
            <div class="col-xl-8 mt-xl-0 wow fadeInUp mt-5" data-wow-duration="0.5s" data-wow-delay="0.5s">
                <h4 class="mb-4">@lang('Latest Transactions')</h4>
                <div class="transaction-wrapper card">
                    <div class="card-body p-0">
                        <div class="table--responsive table-responsive--sm">
                            <table class="style--two mb-0 table">
                                <thead>
                                    <tr>
                                        <th>@lang('Transaction ID')</th>
                                        <th>@lang('User name')</th>
                                        <th>@lang('Date')</th>
                                        <th>@lang('Amount')</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @forelse($transactions as $transaction)
                                    <tr>
                                        <td><span>#{{ $transaction->trx }}</span></td>
                                        <td>{{ $transaction->user->username }}</td>
                                        <td>{{ showDateTime($transaction->created_at) }}</td>
                                        <td><span class="text--base">{{ $general->cur_sym }}{{ getAmount($transaction->amount) }}</span></td>
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
        </div>
    </div>
</section>
