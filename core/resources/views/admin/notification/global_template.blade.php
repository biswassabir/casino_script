@extends('admin.layouts.app')
@section('panel')
    <div class="row">
        <div class="col-md-12">
            <div class="card overflow-hidden">
                <div class="card-body p-0">
                    <div class="table-responsive table-responsive--sm">
                        <table class="align-items-center table--light table">
                            <thead>
                                <tr>
                                    <th>@lang('Short Code') </th>
                                    <th>@lang('Description')</th>
                                </tr>
                            </thead>
                            <tbody class="list">
                                <tr>
                                    <td><span class="short-codes">@{{fullname}}</span></td>
                                    <td>@lang('Full Name of User')</td>
                                </tr>
                                <tr>
                                    <td><span class="short-codes">@{{username}}</span></td>
                                    <td>@lang('Username of User')</td>
                                </tr>
                                <tr>
                                    <td><span class="short-codes">@{{message}}</span></td>
                                    <td>@lang('Message')</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <h6 class="mt-4 mb-2">@lang('Global Short Codes')</h6>
            <div class="card overflow-hidden">
                <div class="card-body p-0">
                    <div class="table-responsive table-responsive--sm">
                        <table class="align-items-center table--light table">
                            <thead>
                                <tr>
                                    <th>@lang('Short Code') </th>
                                    <th>@lang('Description')</th>
                                </tr>
                            </thead>
                            <tbody class="list">
                                @foreach ($general->global_shortcodes as $shortCode => $codeDetails)
                                    <tr>
                                        <td><span class="short-codes">@{{@php echo $shortCode @endphp}}</span></td>
                                        <td>{{ __($codeDetails) }}</td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-12">
            <div class="card mt-5">
                <div class="card-body">
                    <form action="{{ route('admin.setting.notification.global.update') }}" method="POST">
                        @csrf
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>@lang('Email Sent From') </label>
                                    <input class="form-control" name="email_from" type="text" value="{{ $general->email_from }}" placeholder="@lang('Email address')" required />
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>@lang('Email Body') </label>
                                    <textarea class="form-control nicEdit" name="email_template" rows="10" placeholder="@lang('Your email template')">{{ $general->email_template }}</textarea>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>@lang('SMS Sent From') </label>
                                    <input class="form-control" name="sms_from" value="{{ $general->sms_from }}" placeholder="@lang('SMS Sent From')" required>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>@lang('SMS Body') </label>
                                    <textarea class="form-control" name="sms_body" rows="4" placeholder="@lang('SMS Body')" required>{{ $general->sms_body }}</textarea>
                                </div>
                            </div>
                        </div>
                        <button class="btn w-100 btn--primary h-45" type="submit">@lang('Submit')</button>
                    </form>
                </div>
            </div><!-- card end -->
        </div>

    </div>
@endsection
