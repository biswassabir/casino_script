@php
$payment     = getContent('payment_method.content', true);
$payments    = getContent('payment_method.element', false, null, true);
$policyPages = getContent('policy_pages.element', false, null, true);
$socialIcon  = getContent('social_icon.element', false, null, true);
@endphp
<footer class="footer-section  overflow-hidden">
    <div class="payment-area">
        <div class="border-bottom container pb-5">
            <div class="row">
                <div class="col-xl-12 text-center">
                    <h3>{{ __(@$payment->data_values->heading) }}</h3>
                </div>
                <div class="col-xl-12 mt-4">
                    <div class="payment-slider">
                        @foreach ($payments as $payment)
                        <div class="single-slide">
                            <div class="payment-item">
                                <img src="{{ getImage('assets/images/frontend/payment_method/' . @$payment->data_values->image, '85x65') }}" alt="image">
                            </div>
                        </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-top">
        <div class="container">
            <div class="row gy-4 align-items-center justify-content-center justify-content-md-between">
                <div class="col-lg-4 col-md-4 text-md-left">
                    <div class="footer-widget text-md-start text-center">
                        <a class="footer-logo" href="{{ route('home') }}">
                            <img src="{{ getImage(getFilePath('logoIcon') . '/logo.png') }}" alt="image">
                        </a>
                    </div>
                </div>
                <div class="col-lg-6 col-md-8">
                    <form class="d-flex justify-content-end w-100 gap-2">
                        <div class="form-group w-100 mb-0">
                            <input class="form-control" name="email" type="text" placeholder="@lang('Enter email address')">
                        </div>
                        <button class="cmn-btn btn-sm subscribe-btn type= flex-shrink-0" type="button">@lang('Subscribe')</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <div class="container">
            <div class="d-flex justify-content-sm-between justify-content-center align-items-center flex-wrap gap-3">
                <p>@lang('Copyright') &copy; @php echo date('Y') @endphp. @lang('All Rights Reserved')</p>
                <ul class="footer-social-links d-flex align-items-center justify-content-md-end justify-content-center flex-wrap">
                    @foreach ($socialIcon as $social)
                    <li>
                        <a href="{{ @$social->data_values->url }}">@php echo $social->data_values->social_icon @endphp</a>
                    </li>
                    @endforeach
                </ul>
                <ul class="footer-menu">
                    @foreach ($policyPages as $policy)
                    <li>
                        <a href="{{ route('policy.pages', [slug($policy->data_values->title), $policy->id]) }}">{{ __(@$policy->data_values->title) }}</a>
                    </li>
                    @endforeach
                </ul>
            </div>
        </div>
    </div>
</footer>
@push('style')
<style>
    .subscribe-form {
        justify-content: space-between;
        display: flex;
        flex-wrap: wrap;
    }

    .subscribe-form .form--control {
        width: calc(100% - 155px);
    }

    .subscribe-form .cmn-btn {
        width: 135px;
    }
</style>
@endpush

@push('script')
<script>
    (function($) {
            "use strict";
            $('.subscribe-btn').on('click', function(e) {
                e.preventDefault()
                var email = $('[name=email]').val();
                $.ajax({
                    headers: {
                        "X-CSRF-TOKEN": "{{ csrf_token() }}",
                    },
                    url: "{{ route('subscribe.post') }}",
                    method: "POST",
                    data: {
                        email: email
                    },
                    success: function(response) {
                        if (response.success) {
                            $('[name=email]').val('')
                            notify('success', response.success);
                        } else {
                            notify('error', response.error);
                        }
                    }
                });
            });
        })(jQuery)
</script>
@endpush
