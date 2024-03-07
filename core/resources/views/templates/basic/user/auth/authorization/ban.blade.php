@extends($activeTemplate . 'layouts.app')
@section('app')
@php
$banned = getContent('banned.content',true);
@endphp
<div class="maintenance-page flex-column justify-content-center">
    <div class="container">
        <div class="row justify-content-center align-items-center">
            <div class="col-lg-8 text-center">
                <div class="row justify-content-center">
                    <div class="col-xl-10">
                        <h3 class="text--danger mb-2">{{ __(@$banned->data_values->heading) }}</h3>
                    </div>
                    <div class="col-sm-6 col-8 col-lg-12">
                        <img src="{{ getImage('assets/images/frontend/banned/' . @$banned->data_values->image, '360x370') }}" alt="@lang('image')" class="img-fluid mx-auto mb-5">
                    </div>
                </div>
                <p class="text-center mx-auto mb-4">{{ __($user->ban_reason) }} </p>
                <a href="{{ route('home') }}" class="cmn-btn"> @lang('Go to Home') </a>
            </div>
        </div>
    </div>
</div>
@endsection