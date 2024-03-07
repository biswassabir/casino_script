@extends($activeTemplate . 'layouts.frontend')
@section('content')
<div class="pt-120 pb-120">
    <div class="container">
        <div class="d-flex justify-content-center">
            <div class="verification-code-wrapper">
                <div class="verification-area">
                    <h5 class="border-bottom pb-3 text-center">@lang('2FA Verification')</h5>
                    <form class="submit-form" action="{{ route('user.go2fa.verify') }}" method="POST">
                        @csrf

                        <div class="mt-3">
                            @include($activeTemplate . 'partials.verification_code')
                        </div>

                        <div class="form--group">
                            <button class="cmn-btn w-100" type="submit">@lang('Submit')</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection