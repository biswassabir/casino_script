@extends($activeTemplate . 'layouts.master')
@section('content')
<section class="pt-120 pb-120">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="card-body h-100 middle-el">
                    <div class="cd-ft"></div>
                    <div class="game-details-left">
                        <div class="game-details-left__body">
                            <div class="roll">
                                <div id="wrapper">
                                    <div id="platform">
                                        <div class="diceRolling" id="dice">
                                            <div class="side front">
                                                <div class="dot center"></div>
                                            </div>
                                            <div class="side front inner"></div>
                                            <div class="side top">
                                                <div class="dot dtop dleft"></div>
                                                <div class="dot dbottom dright"></div>
                                            </div>
                                            <div class="side top inner"></div>
                                            <div class="side right">
                                                <div class="dot dtop dleft"></div>
                                                <div class="dot center"></div>
                                                <div class="dot dbottom dright"></div>
                                            </div>
                                            <div class="side right inner"></div>
                                            <div class="side left">
                                                <div class="dot dtop dleft"></div>
                                                <div class="dot dtop dright"></div>
                                                <div class="dot dbottom dleft"></div>
                                                <div class="dot dbottom dright"></div>
                                            </div>
                                            <div class="side left inner"></div>
                                            <div class="side bottom">
                                                <div class="dot center"></div>
                                                <div class="dot dtop dleft"></div>
                                                <div class="dot dtop dright"></div>
                                                <div class="dot dbottom dleft"></div>
                                                <div class="dot dbottom dright"></div>
                                            </div>
                                            <div class="side bottom inner"></div>
                                            <div class="side back">
                                                <div class="dot dtop dleft"></div>
                                                <div class="dot dtop dright"></div>
                                                <div class="dot dbottom dleft"></div>
                                                <div class="dot dbottom dright"></div>
                                                <div class="dot center dleft"></div>
                                                <div class="dot center dright"></div>
                                            </div>
                                            <div class="side back inner"></div>
                                            <div class="side cover x"></div>
                                            <div class="side cover y"></div>
                                            <div class="side cover z"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 mt-lg-0 mt-5">
                <div class="game-details-right">
                    <form id="game">
                        <h3 class="f-size--28 mb-4 text-center">@lang('Current Balance') : <span class="base--color"><span class="bal">{{ showAmount(auth()->user()->balance) }}</span> {{ $general->cur_text }}</span>
                        </h3>
                        <div class="form-group">
                            <div class="input-group mb-3">
                                <input class="form-control custom-amount-input amount-field" name="invest" type="text" placeholder="@lang('Amount')" autocomplete="off" required>
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
                            <div class="single-select dice dice1">
                                <img class="gmimg dice1" src="{{ asset($activeTemplateTrue . 'images/play/dice1.png') }}" alt="">
                            </div>
                            <div class="single-select dice dice2">
                                <img class="gmimg dice2" src="{{ asset($activeTemplateTrue . 'images/play/dice2.png') }}" alt="">
                            </div>
                            <div class="single-select dice dice3">
                                <img class="gmimg dice3" src="{{ asset($activeTemplateTrue . 'images/play/dice3.png') }}" alt="">
                            </div>
                            <div class="single-select dice dice4">
                                <img class="gmimg dice4" src="{{ asset($activeTemplateTrue . 'images/play/dice4.png') }}" alt="">
                            </div>
                            <div class="single-select dice dice5">
                                <img class="gmimg dice5" src="{{ asset($activeTemplateTrue . 'images/play/dice5.png') }}" alt="">
                            </div>
                            <div class="single-select dice dice6">
                                <img class="gmimg dice6" src="{{ asset($activeTemplateTrue . 'images/play/dice6.png') }}" alt="">
                            </div>
                        </div>

                        <input name="choose" type="hidden">
                        <input name="type" type="hidden" value="ht">

                        <div class="mt-5 text-center">
                            <button class="cmn-btn w-100 text-center" id="flip" type="submit">@lang('Play Now')</button>
                            <a class="game-instruction mt-2" data-bs-toggle="modal" data-bs-target="#exampleModalCenter">@lang('Game Instruction') <i class="las la-info-circle"></i></a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Modal -->
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
<link href="{{ asset($activeTemplateTrue . 'css/dice.css') }}" rel="stylesheet">
@endpush
@push('script-lib')
<script type="text/javascript" src="{{ asset($activeTemplateTrue . 'js/dice.js') }}"></script>
@endpush
@push('style')
<style type="text/css">
    .dices {
        cursor: pointer;
    }

    .op {
        opacity: 0.5;
    }

    .roll {
        height: 263px;
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
</style>
@endpush

@push('script')
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
            var url = "{{ route('user.play.game.invest', 'dice_rolling') }}";
            var data = $(this).serialize();
            game(data, url);
        });

        function endGame(data) {
            var url = "{{ route('user.play.game.end', 'dice_rolling') }}";
            complete(data, url)
        }
</script>
@endpush