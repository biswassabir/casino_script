@extends($activeTemplate . 'layouts.master')
@section('content')
@php
$gesBon = App\Models\GuessBonus::get();
@endphp
<section class="pt-120 pb-120">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="game-details-left number--guess">
                    <div class="game-details-left__body d-flex align-items-center">
                        <img class="vert-move-down vert down d-none" src="{{ asset($activeTemplateTrue . 'images/play/Down-arrow.png') }}" height="70" width="70" />
                        <img class="vert-move-up vert up d-none" src="{{ asset($activeTemplateTrue . 'images/play/up-arrow.png') }}" height="70" width="70" />
                        <div class="text">
                            <h2 class="custom-font base--color text-center">@lang('You Will Get') {{ $gesBon->count() }} @lang('Chances Per Invest')</h2>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 mt-lg-0 mt-5">
                <div class="game-details-right">
                    <form id="game">
                        <h3 class="f-size--28 mb-4 text-center">@lang('Current Balance') : <span class="base--color"><span class="bal">{{ showAmount(auth()->user()->balance) }}</span> {{ __($general->cur_text) }}</span>
                        </h3>
                        <div class="form-group">
                            <div class="input-group amf mb-3">
                                <input class="form-control amount-field" name="invest" type="text" placeholder="@lang('Enter amount')">
                                <span class="input-group-text" id="basic-addon2" onclick="myFunc()">{{ __($general->cur_text) }}</span>
                            </div>
                            <small class="form-text text-muted"><i class="fas fa-info-circle mr-2"></i> @lang('Minimum')
                                : {{ showAmount($game->min_limit) }} {{ __($general->cur_text) }}
                                | @lang('Maximum')
                                : {{showAmount($game->max_limit) }} {{ __($general->cur_text) }} | <span class="text--warning">@lang('Win Bonus For This Chance') <span class="bon">{{ __($gesBon->first()->percent) }}%</span></small>
                        </div>
                        <div class="invBtn mt-5 text-center">
                            <button class="cmn-btn w-100 my-submit-btn text-center" type="submit">@lang('Start Game')</button>
                            <a class="game-instruction mt-2" data-bs-toggle="modal" data-bs-target="#exampleModalCenter">@lang('Game Instruction') <i class="las la-info-circle"></i></a>
                        </div>
                    </form>

                    <form class="startGame" id="start">
                        @csrf
                        <input name="game_id" type="hidden">
                        <div class="numberGs numHide">
                            <div class="form-group">
                                <input class="form-control guess" name="number" type="number" placeholder="@lang('Guess The Number')" autocomplete="off">
                            </div>
                            <button class="btn cmn-btn gmg w-100" type="submit">@lang('Guess The Number')</button>
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

@push('style')
<link href="{{ asset($activeTemplateTrue . 'css/guess.css') }}" rel="stylesheet">
@endpush
@push('script-lib')
<script src="{{ asset($activeTemplateTrue . 'js/guess.js') }}"></script>
@endpush
@push('style')
<style type="text/css">
    .game-details-left__body {
        height: 100%;
        width: 100%;
        background: #d3e0f71a;
        backdrop-filter: blur(4px);
        -webkit-backdrop-filter: blur(4px);
        border-radius: 10px;
        padding: 20px;
    }

    .game-details-left {
        padding: 30px;
        background: url('{{ asset($activeTemplateTrue . 'images/play/number.png') }}');
        background-size: 100% 100%;
    }

    .game-details-left h2 {
        font-size: 40px;
        text-shadow: none;
    }

    @media screen and (max-width:991px) {
        .number--guess {
            min-height: 520px;
        }
    }

    @media screen and (max-width:767px) {
        .text h2 {
            font-size: 36px;
            padding: 0 30px
        }
    }

    @media screen and (max-width:450px) {
        .number--guess {
            min-height: 390px
        }
    }

    @media screen and (max-width:575px) {
        .text h2 {
            font-size: 30px;
            padding: 0;
        }
    }
</style>
@endpush

@push('script')
<script>
    "use strict";
        function color() {
            var myArray = [
                "#0060651a",
                "#654f001a",
                "#6500001a",
                "#5f00651a",
                "#000c651a",
                "#0057651a",
            ];

            var randomItem = myArray[Math.floor(Math.random() * myArray.length)];
            return randomItem;
        }

        function myFunc() {
            $('.game-details-left__body').css('background', color());
        }

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
            var data = $(this).serialize();
            var url = "{{ route('user.play.game.invest', 'number_guess') }}";
            game(data, url);
        });

        $('#start').on('submit', function(e) {
            e.preventDefault();
            var data = $(this).serialize();
            var url = "{{ route('user.play.game.end', 'number_guess') }}";
            var bon = {{ $gesBon->first()->percent }}
            start(url, data, bon);
        });
</script>
@endpush