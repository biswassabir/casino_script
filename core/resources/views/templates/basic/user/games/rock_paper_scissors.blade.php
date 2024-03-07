@extends($activeTemplate . 'layouts.master')
@section('content')
<section class="pt-120 pb-120">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="game-details-left">
                    <div class="game-details-left__body">
                        <div class="sld">
                            <div class="imgs sld-wrapper position-relative text-center">
                                <div class="img1">
                                    <img src="{{ asset($activeTemplateTrue . 'images/play/rock.png') }}">
                                </div>
                                <div class="img2 op-0">
                                    <img src="{{ asset($activeTemplateTrue . 'images/play/paper.png') }}">
                                </div>
                                <div class="img3 op-0">
                                    <img src="{{ asset($activeTemplateTrue . 'images/play/scissors.png') }}">
                                </div>
                            </div>
                            <div class="result d-none align-items-center text-center">
                                <div class="">
                                    <img class="im-1" src="{{ asset($activeTemplateTrue . 'images/play/rock.png') }}">
                                </div>
                                <h1 class="opac-0 vs-title">@lang('VS')</h1>
                                <div class="">
                                    <img class="im-2 opac-0" src="{{ asset($activeTemplateTrue . 'images/play/paper.png') }}">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 mt-lg-0 mt-4">
                <div class="game-details-right">
                    <form id="game">
                        @csrf
                        <h3 class="f-size--28 mb-4 text-center">@lang('Current Balance') : <span class="base--color"><span class="bal">{{showAmount(auth()->user()->balance) }}</span> {{ __($general->cur_text) }}</span>
                        </h3>
                        <div class="form-group">
                            <div class="input-group mb-3">
                                <input class="form-control amount-field" name="invest" type="text" placeholder="@lang('Enter amount')">
                                <span class="input-group-text" id="basic-addon2">{{ __($general->cur_text) }}</span>
                            </div>
                            <small class="form-text text-muted"><i class="fas fa-info-circle mr-2"></i> @lang('Minimum :') {{ showAmount($game->min_limit) }} {{ __($general->cur_text) }}
                                | @lang('Maximum:') {{showAmount($game->max_limit) }} {{ __($general->cur_text) }}
                                | <span class="text--warning">@lang('Win Amount') @if ($game->invest_back == 1)
                                    {{ showAmount($game->win + 100) }}
                                    @else
                                    {{ showAmount($game->win) }}
                                    @endif %</span></small>
                        </div>
                        <div class="form-group justify-content-center d-flex mt-5">
                            <div class="single-select rock p-0">
                                <img src="{{ asset($activeTemplateTrue . '/images/play/rock.pn') }}g" alt="game-image">
                            </div>
                            <div class="single-select paper p-0">
                                <img src="{{ asset($activeTemplateTrue . '/images/play/paper.png') }}" alt="game-image">
                            </div>
                            <div class="single-select scissors p-0">
                                <img src="{{ asset($activeTemplateTrue . '/images/play/scissors.png') }}" alt="game-image">
                            </div>
                        </div>
                        <input name="choose" type="hidden">
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

@push('style')
<style type="text/css">
    .result {
        display: flex;
    }

    .game-details-left {
        border-radius: 5px;
    }

    .img1 {
        position: relative;
    }

    .img2 {
        position: absolute;
        height: 100%;
        width: 100%;
        left: 0;
        top: 0;
    }

    .img3 {
        position: absolute;
        height: 100%;
        width: 100%;
        left: 0;
        top: 0;
    }

    .op-1 {
        opacity: 1;
    }

    .op-0 {
        opacity: 0;
    }

    .vs-title {
        font-size: 20px;
    }

    .game-details-left {
        padding: 30px 10px;
    }

    @media screen and (min-width:576px) {
        .vs-title {
            font-size: 30px;
        }

        .game-details-left {
            padding: 50px;
        }
    }
</style>
@endpush
@push('script-lib')
<script src="{{ asset($activeTemplateTrue . 'js/rockpaper.js') }}"></script>
@endpush
@push('script')
<script>
    "use strict";
    $('#game').on('submit', function(e) {
        e.preventDefault();

        $('.cd-ft').html('');

        $('.cmn-btn').html('<i class="la la-gear fa-spin"></i> Processing...');
        $('.cmn-btn').attr('disabled', '');
        var data = $(this).serialize();
        var url = "{{ route('user.play.game.invest', 'rock_paper_scissors') }}";
        game(data, url);
    });

    function endGame(data) {
        var url = '{{ route('user.play.game.end', 'rock_paper_scissors') }}';
        var img1 = '{{ asset($activeTemplateTrue . 'images/play/rock.png') }}';
        var img2 = '{{ asset($activeTemplateTrue . 'images/play/paper.png') }}';
        var img3 = '{{ asset($activeTemplateTrue . 'images/play/scissors.png') }}';
        var imgObj = {
            img1,
            img2,
            img3
        };
        complete(data, url, imgObj);
    }
        
</script>
@endpush