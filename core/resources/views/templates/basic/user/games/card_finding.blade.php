@extends($activeTemplate . 'layouts.master')
@section('content')
<section class="pt-120 pb-120">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="card-body h-100 middle-el overflow-hidden">
                    <div class="game-details-left">
                        <div class="fly">
                            <div class="d-none" id="cards"></div>
                            <div class="flying text-center">
                                <div class="card-holder">
                                    <div class="back"></div>
                                    <div class="flying-card clubs">
                                        <img class="w-100" src="{{ asset($activeTemplateTrue . 'images/play/cards/01.png') }}">
                                    </div>
                                </div>
                                <div class="card-holder">
                                    <div class="back"></div>
                                    <div class="flying-card clubs">
                                        <img class="w-100" src="{{ asset($activeTemplateTrue . 'images/play/cards/34.png') }}">
                                    </div>
                                </div>
                                <div class="card-holder">
                                    <div class="back"></div>
                                    <div class="flying-card clubs">
                                        <img class="w-100" src="{{ asset($activeTemplateTrue . 'images/play/cards/20.png') }}">
                                    </div>
                                </div>
                                <div class="card-holder">
                                    <div class="back"></div>
                                    <div class="flying-card clubs">
                                        <img class="w-100" src="{{ asset($activeTemplateTrue . 'images/play/cards/29.png') }}">
                                    </div>
                                </div>
                                <div class="card-holder">
                                    <div class="back"></div>
                                    <div class="flying-card clubs">
                                        <img class="w-100" src="{{ asset($activeTemplateTrue . 'images/play/cards/09.png') }}">
                                    </div>
                                </div>
                                <div class="card-holder">
                                    <div class="back"></div>
                                    <div class="flying-card clubs">
                                        <img class="w-100" src="{{ asset($activeTemplateTrue . 'images/play/cards/53.png') }}">
                                    </div>
                                </div>
                                <div class="card-holder">
                                    <div class="back"></div>
                                    <div class="flying-card clubs">
                                        <img class="w-100" src="{{ asset($activeTemplateTrue . 'images/play/cards/2.png') }}">
                                    </div>
                                </div>
                                <div class="card-holder">
                                    <div class="back"></div>
                                    <div class="flying-card clubs">
                                        <img class="w-100" src="{{ asset($activeTemplateTrue . 'images/play/cards/52.png') }}">
                                    </div>
                                </div>
                                <div class="card-holder">
                                    <div class="back"></div>
                                    <div class="flying-card clubs">
                                        <img class="w-100" src="{{ asset($activeTemplateTrue . 'images/play/cards/36.png') }}">
                                    </div>
                                </div>
                                <div class="card-holder">
                                    <div class="back"></div>
                                    <div class="flying-card clubs">
                                        <img class="w-100" src="{{ asset($activeTemplateTrue . 'images/play/cards/25.png') }}">
                                    </div>
                                </div>
                                <div class="card-holder">
                                    <div class="back"></div>
                                    <div class="flying-card clubs">
                                        <img class="w-100" src="{{ asset($activeTemplateTrue . 'images/play/cards/40.png') }}">
                                    </div>
                                </div>
                                <div class="card-holder">
                                    <div class="back"></div>
                                    <div class="flying-card clubs">
                                        <img class="w-100" src="{{ asset($activeTemplateTrue . 'images/play/cards/30.png') }}">
                                    </div>
                                </div>
                                <div class="card-holder">
                                    <div class="back"></div>
                                    <div class="flying-card clubs">
                                        <img class="w-100" src="{{ asset($activeTemplateTrue . 'images/play/cards/19.png') }}">
                                    </div>
                                </div>
                                <div class="card-holder">
                                    <div class="back"></div>
                                    <div class="flying-card clubs">
                                        <img class="w-100" src="{{ asset($activeTemplateTrue . 'images/play/cards/53.png') }}">
                                    </div>
                                </div>
                                <div class="card-holder">
                                    <div class="back"></div>
                                    <div class="flying-card clubs">
                                        <img class="w-100" src="{{ asset($activeTemplateTrue . 'images/play/cards/13.png') }}">
                                    </div>
                                </div>
                                <div class="card-holder">
                                    <div class="back"></div>
                                    <div class="flying-card clubs">
                                        <img class="w-100" src="{{ asset($activeTemplateTrue . 'images/play/cards/51.png') }}">
                                    </div>
                                </div>
                                <div class="card-holder">
                                    <div class="back"></div>
                                    <div class="flying-card clubs">
                                        <img class="w-100" src="{{ asset($activeTemplateTrue . 'images/play/cards/16.png') }}">
                                    </div>
                                </div>
                                <div class="card-holder">
                                    <div class="back"></div>
                                    <div class="flying-card clubs">
                                        <img class="w-100" src="{{ asset($activeTemplateTrue . 'images/play/cards/50.png') }}">
                                    </div>
                                </div>
                                <div class="card-holder">
                                    <div class="back"></div>
                                    <div class="flying-card clubs">
                                        <img class="w-100" src="{{ asset($activeTemplateTrue . 'images/play/cards/08.png') }}">
                                    </div>
                                </div>
                                <div class="card-holder">
                                    <div class="back"></div>
                                    <div class="flying-card clubs">
                                        <img class="w-100" src="{{ asset($activeTemplateTrue . 'images/play/cards/47.png') }}">
                                    </div>
                                </div>
                                <div class="card-holder">
                                    <div class="back"></div>
                                    <div class="flying-card clubs">
                                        <img class="w-100" src="{{ asset($activeTemplateTrue . 'images/play/cards/24.png') }}">
                                    </div>
                                </div>
                            </div>
                            <div class="d-none res res-thumb-img t--60px m-0">
                                <div class="res--card--img">
                                    <div class="back"></div>
                                    <div class="flying-card clubs resImg">
                                        <img class="w-100" src="{{ asset($activeTemplateTrue . 'images/play/cards/24.png') }}">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 mt-lg-0 mt-5">
                <div class="game-details-right">
                    <form id="game" method="post">
                        @csrf

                        <h3 class="f-size--28 mb-4 text-center">@lang('Current Balance'): <span class="base--color"><span class="bal">{{ showAmount(auth()->user()->balance) }}</span> {{ $general->cur_text }}</span>
                        </h3>
                        <div class="form-group">
                            <div class="input-group mb-3">
                                <input class="form-control amount-field custom-amount-input" name="invest" type="text" placeholder="@lang('Enter Amount')" autocomplete="off" required>
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
                        <div class="form-group justify-content-center d-flex mt-5">
                            <div class="single-select red">
                                <img class="red" src="{{ asset($activeTemplateTrue . 'images/play/cards/27.png') }}" alt="">
                            </div>
                            <div class="single-select black">
                                <img class="black" src="{{ asset($activeTemplateTrue . 'images/play/cards/40.png') }}" alt="">
                            </div>
                        </div>

                        <input name="choose" type="hidden">
                        <input name="type" type="hidden" value="ht">

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
<link href="{{ asset($activeTemplateTrue . 'css/deck.css') }}" rel="stylesheet">
<link href="{{ asset($activeTemplateTrue . 'css/card.css') }}" rel="stylesheet">
@endpush
@push('style')
<style type="text/css">
    .game-details-left {
        padding: 10px;
    }
</style>
@endpush
@push('script-lib')
<script type="text/javascript" src="{{ asset($activeTemplateTrue . 'js/deck.js') }}"></script>
<script type="text/javascript" src="{{ asset($activeTemplateTrue . 'js/deckinit.js') }}"></script>
<script type="text/javascript" src="{{ asset($activeTemplateTrue . 'js/cardgame.js') }}"></script>
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
            beforeProcess();
            var data = $(this).serialize();
            var url = '{{ route('user.play.game.invest', 'card_finding') }}';
            game(data, url);
        });


        function startGame(data) {
            animationCard(data);
            $('button[type=submit]').html('<i class="la la-gear fa-spin"></i> Playing...');
            timerA = setInterval(function() {
                succOrError();
                endGame(data);
            }, 10110);
            $('button[type=submit]').html('<i class="la la-gear fa-spin"></i> Playing...');
        }

        function animationCard(data) {
            $('.flying').addClass('d-none');
            $('#cards').removeClass('d-none');
            deck.sort()
            deck.sort()
            deck.sort()
            deck.sort()
            deck.sort()
            deck.sort()
            deck.fan()
            var img = `{{ asset($activeTemplateTrue . 'images/play/cards/') }}/${card(data.result)}.png`;
            setTimeout(function() {
                $('.resImg').find('img').attr('src', img)
                $('#cards').addClass('op');
                $('.res').removeClass('d-none');
            }, 10110);
        }


        function success(data) {

            $('.win-loss-popup').addClass('active');
            $('.win-loss-popup__body').find('img').addClass('d-none');
            if (data.type == 'success') {
                $('.win-loss-popup__body').find('.win').removeClass('d-none');
            } else {
                $('.win-loss-popup__body').find('.lose').removeClass('d-none');
            }
            $('.win-loss-popup__footer').find('.data-result').text(data.result);


            var bal = parseFloat(data.bal);
            $('.bal').html(bal.toFixed(2));
            $('button[type=submit]').html('Play');
            $('button[type=submit]').removeAttr('disabled');
            $('.single-select').removeClass('active');
            $('.single-select').removeClass('op');
            $('.single-select').find('img').removeClass('op');
            $('img').removeClass('op');
        }

        function endGame(data) {
            var url = "{{ route('user.play.game.end', 'card_finding') }}";
            complete(data, url);
        }
</script>
@endpush