@extends($activeTemplate . 'layouts.master')
@section('content')
<section class="pt-120 pb-120">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="card-body h-100 middle-el p-0">
                    <div class="game-details-left fly">
                        <div class="game-details-left__body">
                            <div class="alt">
                            </div>
                            <div id="slot-view">
                                <div id="ball-1">
                                    <div class="poolNumber">@lang('1')</div>
                                </div>
                                <div id="ball-2">
                                    <div class="poolNumber">@lang('2')</div>
                                </div>
                                <div id="ball-3">
                                    <div class="poolNumber">@lang('3')</div>
                                </div>
                                <div id="ball-4">
                                    <div class="poolNumber">@lang('4')</div>
                                </div>
                                <div id="ball-5">
                                    <div class="poolNumber">@lang('5')</div>
                                </div>
                                <div id="ball-6">
                                    <div class="poolNumber">@lang('6')</div>
                                </div>
                                <div id="ball-7">
                                    <div class="poolNumber">@lang('7')</div>
                                </div>
                                <div id="ball-8">
                                    <div class="poolNumber">@lang('8')</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 mt-lg-0 mt-5">
                <div class="game-details-right">
                    <form id="game" method="post">
                        @csrf
                        <h3 class="f-size--28 mb-4 text-center">@lang('Current Balance') : <span class="base--color"><span class="bal">{{ showAmount(auth()->user()->balance) }}</span> {{ $general->cur_text }}</span>
                        </h3>
                        <div class="form-group">
                            <div class="input-group mb-3">
                                <input class="form-control amount-field custom-amount-input" name="invest" type="text" placeholder="@lang('Enter Amount')" required>
                                <span class="input-group-text" id="basic-addon2">{{ $general->cur_text }}</span>
                            </div>
                            <small class="form-text text-muted"><i class="fas fa-info-circle mr-2"></i> @lang('Minimum')
                                : {{ showAmount($game->min_limit) }} {{ $general->cur_text }} | @lang('Maximum')
                                : {{ showAmount($game->max_limit) }} {{ $general->cur_text }} | <span class="text--warning">@lang('Win Amount') @if ($game->invest_back == 1)
                                    {{ showAmount($game->win + 100) }}
                                    @else
                                    {{ showAmount($game->win) }}
                                    @endif %</span></small>
                        </div>
                        <div class="form-group justify-content-center d-flex mt-5 flex-wrap">
                            <div class="single-select pool pool-01">
                                <img class="gmimg pool-01" src="{{ asset($activeTemplateTrue . 'images/play/pools/01.png') }}" alt="">
                            </div>
                            <div class="single-select pool pool-02">
                                <img class="gmimg pool-02" src="{{ asset($activeTemplateTrue . 'images/play/pools/02.png') }}" alt="">
                            </div>
                            <div class="single-select pool pool-03">
                                <img class="gmimg pool-03" src="{{ asset($activeTemplateTrue . 'images/play/pools/03.png') }}" alt="">
                            </div>
                            <div class="single-select pool pool-04">
                                <img class="gmimg pool-04" src="{{ asset($activeTemplateTrue . 'images/play/pools/04.png') }}" alt="">
                            </div>
                            <div class="single-select pool pool-05">
                                <img class="gmimg pool-05" src="{{ asset($activeTemplateTrue . 'images/play/pools/05.png') }}" alt="">
                            </div>
                            <div class="single-select pool pool-06">
                                <img class="gmimg pool-06" src="{{ asset($activeTemplateTrue . 'images/play/pools/06.png') }}" alt="">
                            </div>
                            <div class="single-select pool pool-07">
                                <img class="gmimg pool-07" src="{{ asset($activeTemplateTrue . 'images/play/pools/07.png') }}" alt="">
                            </div>
                            <div class="single-select pool pool-08">
                                <img class="gmimg pool-08" src="{{ asset($activeTemplateTrue . 'images/play/pools/08.png') }}" alt="">
                            </div>
                        </div>

                        <input name="choose" type="hidden">

                        <div class="mt-5 text-center">
                            <button class="cmn-btn w-100 text-center" type="submit">@lang('Play Now')</button>
                            <a class="game-instruction mt-2" data-bs-toggle="modal" data-bs-target="#exampleModalCenter">@lang('Game Instruction') <i class="las la-info-circle"></i></a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<div class="modal fade" id="exampleModalCenter" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content section--bg">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">@lang('Game Rule')</h5>
                <button class="btn-close" data-bs-dismiss="modal" type="button" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                @php echo $game->instruction @endphp
            </div>
        </div>
    </div>
</div>
@endsection

@push('style-lib')
<link href="{{ asset($activeTemplateTrue . 'css/pool.css') }}" rel="stylesheet">
@endpush
@push('script-lib')
@endpush
@push('style')
<style type="text/css">
    .coins {
        cursor: pointer;
    }

    .op {
        opacity: 0.5;
    }

    .opc {
        opacity: 0.3;
    }

    .fly {
        height: 554px;
    }

    .none {
        display: none;
    }

    #game .row {
        margin-top: 18px;
    }

    .show {
        height: 100%;
        width: 100%;
        overflow-y: scroll;
        opacity: 1;
    }

    .hide {
        height: 0%;
        width: 0%;
        overflow-y: hidden;
        overflow-x: hidden;
        opacity: 0;
    }

    .pool-05 img {
        transform: rotate(-36deg);
    }

    .game-details-left {
        position: relative;
        overflow: hidden;
    }
</style>
@endpush
@push('script')
<script src="{{ asset($activeTemplateTrue . 'js/pool.js') }}"></script>
<script>
    "use strict";
        $('input[name=invest]').keypress(function(e) {
            var character = String.fromCharCode(e.keyCode)
            var newValue = this.value + character;
            if (isNaN(newValue) || hasDecimalPlace(newValue, 3)) {
                e.preventDefault();
                return false;
            }
        });

        function hasDecimalPlace(value, x) {
            var pointIndex = value.indexOf('.');
            return pointIndex >= 0 && pointIndex < value.length - x;
        }


        $('#game').on('submit', function(e) {
            e.preventDefault();
            $('button[type=submit]').html('<i class="la la-gear fa-spin"></i> Processing...');
            $('button[type=submit]').attr('disabled', '');
            $('.cd-ft').html('');
            var data = $(this).serialize();
            var url = "{{ route('user.play.game.invest', 'number_pool') }}"
            $('#slot-view').removeClass('finish');
            game(data, url);
        });

        function endGame(data) {
            var url = "{{ route('user.play.game.end', 'number_pool') }}";
            complete(data, url);
        }
</script>
@endpush