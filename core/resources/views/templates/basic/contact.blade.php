@php
$contactContent = getContent('contact_us.content', true);
$contactElement = getContent('contact_us.element', false, null, true);
@endphp
@extends($activeTemplate . 'layouts.frontend')
@section('content')
    <section class="pt-120 pb-120">
        <div class="pb-120 container">
            <div class="row justify-content-center">
                <div class="col-lg-12 mb-50">
                    <h2 class="font-weight-bold">{{ __(@$contactContent->data_values->heading) }}</h2>
                    <span>{{ __(@$contactContent->data_values->subheading) }}</span>
                </div>
                <div class="col-lg-12">
                    <div class="row mb-none-30">
                        @foreach ($contactElement as $contact)
                            <div class="col-md-4 col-sm-6 mb-30">
                                <div class="contact-item">
                                    @php
                                        echo $contact->data_values->icon;
                                    @endphp
                                    <h5 class="mt-2">{{ __(@$contact->data_values->title) }}</h5>
                                    <div class="mt-4">
                                        <p>{{ __(@$contact->data_values->contact_info) }}</p>

                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
        @php
            $user = auth()->user();
        @endphp
        <div class="container">
            <div class="contact-wrapper">
                <div class="row">
                    <div class="col-lg-6 contact-thumb bg_img" style="background-image: url('{{ getImage('assets/images/frontend/contact_us/' . @$contactContent->data_values->image, '1280x850') }}');"></div>
                    <div class="col-lg-6 contact-form-wrapper">
                        <h2 class="font-weight-bold">{{ __(@$contactContent->data_values->title) }}</h2>
                        <form class="contact-form verify-gcaptcha mt-4" method="post" action="">
                            @csrf
                            <div class="row">
                                <div class="form-group col-lg-6">
                                    <input class="form-control" name="name" type="text" value="@if ($user){{ $user->fullname }}@else{{ old('name') }}@endif" placeholder="@lang('Enter Your Name')" @if ($user) readonly @endif required>
                                </div>
                                <div class="form-group col-lg-6">
                                    <input class="form-control" name="email" type="text" value="@if ($user){{ $user->email }}@else{{ old('email') }}@endif" placeholder="@lang('Enter Email Address')" @if ($user) readonly @endif required>
                                </div>
                                <div class="form-group col-lg-12">
                                    <input class="form-control" name="subject" type="text" value="{{ old('subject') }}" placeholder="@lang('Write your subject')" required>
                                </div>
                                <div class="form-group col-lg-12">
                                    <textarea class="form-control" name="message" placeholder="@lang('Write your message')">{{ old('message') }}</textarea>
                                </div>
                                <x-captcha />
                                <div class="col-lg-12">
                                    <button class="cmn-btn w-100" type="submit">@lang('Send Message')</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    @if ($sections->secs != null)
        @foreach (json_decode($sections->secs) as $sec)
            @include($activeTemplate . 'sections.' . $sec)
        @endforeach
    @endif
@endsection
