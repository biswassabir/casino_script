@extends('admin.layouts.app')
@section('panel')
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <form action="" method="POST">
                    @csrf
                    <div class="card-body">
                        <div class="form-group">
                            <label class="mb-4">@lang('Email Send Method')</label>
                            <select class="form-control" name="email_method">
                                <option value="php" @if ($general->mail_config->name == 'php') selected @endif>@lang('PHP Mail')</option>
                                <option value="smtp" @if ($general->mail_config->name == 'smtp') selected @endif>@lang('SMTP')</option>
                                <option value="sendgrid" @if ($general->mail_config->name == 'sendgrid') selected @endif>@lang('SendGrid API')</option>
                                <option value="mailjet" @if ($general->mail_config->name == 'mailjet') selected @endif>@lang('Mailjet API')</option>
                            </select>
                        </div>
                        <div class="row d-none configForm mt-4" id="smtp">
                            <div class="col-md-12">
                                <h6 class="mb-2">@lang('SMTP Configuration')</h6>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>@lang('Host') </label>
                                    <input class="form-control" name="host" type="text" value="{{ $general->mail_config->host ?? '' }}" placeholder="e.g. @lang('smtp.googlemail.com')" />
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>@lang('Port') </label>
                                    <input class="form-control" name="port" type="text" value="{{ $general->mail_config->port ?? '' }}" placeholder="@lang('Available port')" />
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>@lang('Encryption')</label>
                                    <select class="form-control" name="enc">
                                        <option value="ssl">@lang('SSL')</option>
                                        <option value="tls">@lang('TLS')</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>@lang('Username') </label>
                                    <input class="form-control" name="username" type="text" value="{{ $general->mail_config->username ?? '' }}" placeholder="@lang('Normally your email') address" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>@lang('Password') </label>
                                    <input class="form-control" name="password" type="text" value="{{ $general->mail_config->password ?? '' }}" placeholder="@lang('Normally your email password')" />
                                </div>
                            </div>
                        </div>
                        <div class="row d-none configForm mt-4" id="sendgrid">
                            <div class="col-md-12">
                                <h6 class="mb-2">@lang('SendGrid API Configuration')</h6>
                            </div>
                            <div class="form-group col-md-12">
                                <label>@lang('App Key') </label>
                                <input class="form-control" name="appkey" type="text" value="{{ $general->mail_config->appkey ?? '' }}" placeholder="@lang('SendGrid App key')" />
                            </div>
                        </div>
                        <div class="row d-none configForm mt-4" id="mailjet">
                            <div class="col-md-12">
                                <h6 class="mb-2">@lang('Mailjet API Configuration')</h6>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>@lang('Api Public Key') </label>
                                    <input class="form-control" name="public_key" type="text" value="{{ $general->mail_config->public_key ?? '' }}" placeholder="@lang('Mailjet Api Public Key')" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>@lang('Api Secret Key') </label>
                                    <input class="form-control" name="secret_key" type="text" value="{{ $general->mail_config->secret_key ?? '' }}" placeholder="@lang('Mailjet Api Secret Key')" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <button class="btn btn--primary w-100 h-45" type="submit">@lang('Submit')</button>
                    </div>
                </form>
            </div><!-- card end -->
        </div>

    </div>

    {{-- TEST MAIL MODAL --}}
    <div class="modal fade" id="testMailModal" role="dialog" tabindex="-1">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">@lang('Test Mail Setup')</h5>
                    <button class="close" data-bs-dismiss="modal" type="button" aria-label="Close">
                        <i class="las la-times"></i>
                    </button>
                </div>
                <form action="{{ route('admin.setting.notification.email.test') }}" method="POST">
                    @csrf
                    <input name="id" type="hidden">
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>@lang('Sent to') </label>
                                    <input class="form-control" name="email" type="text" placeholder="@lang('Email Address')">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn--primary w-100 h-45" type="submit">@lang('Submit')</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection
@push('breadcrumb-plugins')
        <button class="btn btn-sm btn-outline--primary" data-bs-target="#testMailModal" data-bs-toggle="modal" type="button"><i class="las la-paper-plane"></i> @lang('Send Test Mail')</button>
@endpush
@push('script')
    <script>
        (function($) {
            "use strict";

            var method = '{{ $general->mail_config->name }}';
            emailMethod(method);
            $('select[name=email_method]').on('change', function() {
                var method = $(this).val();
                emailMethod(method);
            });

            function emailMethod(method) {
                $('.configForm').addClass('d-none');
                if (method != 'php') {
                    $(`#${method}`).removeClass('d-none');
                }
            }

        })(jQuery);
    </script>
@endpush
