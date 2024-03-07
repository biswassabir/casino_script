@extends('admin.layouts.app')
@section('panel')
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <form action="" method="POST">
                    @csrf
                    <div class="card-body">
                        <div class="form-group">
                            <label>@lang('Sms Send Method')</label>
                            <select class="form-control" name="sms_method">
                                <option value="clickatell" @if (@$general->sms_config->name == 'clickatell') selected @endif>@lang('Clickatell')</option>
                                <option value="infobip" @if (@$general->sms_config->name == 'infobip') selected @endif>@lang('Infobip')</option>
                                <option value="messageBird" @if (@$general->sms_config->name == 'messageBird') selected @endif>@lang('Message Bird')</option>
                                <option value="nexmo" @if (@$general->sms_config->name == 'nexmo') selected @endif>@lang('Nexmo')</option>
                                <option value="smsBroadcast" @if (@$general->sms_config->name == 'smsBroadcast') selected @endif>@lang('Sms Broadcast')</option>
                                <option value="twilio" @if (@$general->sms_config->name == 'twilio') selected @endif>@lang('Twilio')</option>
                                <option value="textMagic" @if (@$general->sms_config->name == 'textMagic') selected @endif>@lang('Text Magic')</option>
                                <option value="custom" @if (@$general->sms_config->name == 'custom') selected @endif>@lang('Custom API')</option>
                            </select>
                        </div>
                        <div class="row d-none configForm mt-4" id="clickatell">
                            <div class="col-md-12">
                                <h6 class="mb-2">@lang('Clickatell Configuration')</h6>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>@lang('API Key') </label>
                                    <input class="form-control" name="clickatell_api_key" type="text" value="{{ @$general->sms_config->clickatell->api_key }}" placeholder="@lang('API Key')" />
                                </div>
                            </div>
                        </div>
                        <div class="row d-none configForm mt-4" id="infobip">
                            <div class="col-md-12">
                                <h6 class="mb-2">@lang('Infobip Configuration')</h6>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>@lang('Username') </label>
                                    <input class="form-control" name="infobip_username" type="text" value="{{ @$general->sms_config->infobip->username }}" placeholder="@lang('Username')" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>@lang('Password') </label>
                                    <input class="form-control" name="infobip_password" type="text" value="{{ @$general->sms_config->infobip->password }}" placeholder="@lang('Password')" />
                                </div>
                            </div>
                        </div>
                        <div class="row d-none configForm mt-4" id="messageBird">
                            <div class="col-md-12">
                                <h6 class="mb-2">@lang('Message Bird Configuration')</h6>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>@lang('API Key') </label>
                                    <input class="form-control" name="message_bird_api_key" type="text" value="{{ @$general->sms_config->message_bird->api_key }}" placeholder="@lang('API Key')" />
                                </div>
                            </div>
                        </div>
                        <div class="row d-none configForm mt-4" id="nexmo">
                            <div class="col-md-12">
                                <h6 class="mb-2">@lang('Nexmo Configuration')</h6>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>@lang('API Key') </label>
                                    <input class="form-control" name="nexmo_api_key" type="text" value="{{ @$general->sms_config->nexmo->api_key }}" placeholder="@lang('API Key')" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>@lang('API Secret') </label>
                                    <input class="form-control" name="nexmo_api_secret" type="text" value="{{ @$general->sms_config->nexmo->api_secret }}" placeholder="@lang('API Secret')" />
                                </div>
                            </div>
                        </div>
                        <div class="row d-none configForm mt-4" id="smsBroadcast">
                            <div class="col-md-12">
                                <h6 class="mb-2">@lang('Sms Broadcast Configuration')</h6>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>@lang('Username') </label>
                                    <input class="form-control" name="sms_broadcast_username" type="text" value="{{ @$general->sms_config->sms_broadcast->username }}" placeholder="@lang('Username')" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>@lang('Password') </label>
                                    <input class="form-control" name="sms_broadcast_password" type="text" value="{{ @$general->sms_config->sms_broadcast->password }}" placeholder="@lang('Password')" />
                                </div>
                            </div>
                        </div>
                        <div class="row d-none configForm mt-4" id="twilio">
                            <div class="col-md-12">
                                <h6 class="mb-2">@lang('Twilio Configuration')</h6>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>@lang('Account SID') </label>
                                    <input class="form-control" name="account_sid" type="text" value="{{ @$general->sms_config->twilio->account_sid }}" placeholder="@lang('Account SID')" />
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>@lang('Auth Token') </label>
                                    <input class="form-control" name="auth_token" type="text" value="{{ @$general->sms_config->twilio->auth_token }}" placeholder="@lang('Auth Token')" />
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>@lang('From Number') </label>
                                    <input class="form-control" name="from" type="text" value="{{ @$general->sms_config->twilio->from }}" placeholder="@lang('From Number')" />
                                </div>
                            </div>
                        </div>
                        <div class="row d-none configForm mt-4" id="textMagic">
                            <div class="col-md-12">
                                <h6 class="mb-2">@lang('Text Magic Configuration')</h6>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>@lang('Username') </label>
                                    <input class="form-control" name="text_magic_username" type="text" value="{{ @$general->sms_config->text_magic->username }}" placeholder="@lang('Username')" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>@lang('Apiv2 Key') </label>
                                    <input class="form-control" name="apiv2_key" type="text" value="{{ @$general->sms_config->text_magic->apiv2_key }}" placeholder="@lang('Apiv2 Key')" />
                                </div>
                            </div>
                        </div>
                        <div class="row d-none configForm mt-4" id="custom">
                            <div class="col-md-12">
                                <h6 class="mb-2">@lang('Custom API')</h6>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>@lang('API URL') </label>
                                    <div class="input-group">
                                        <span class="input-group-text">
                                            <select class="method-select" name="custom_api_method">
                                                <option value="get">@lang('GET')</option>
                                                <option value="post">@lang('POST')</option>
                                            </select>
                                        </span>
                                        <input class="form-control" name="custom_api_url" type="text" value="{{ @$general->sms_config->custom->url }}" placeholder="@lang('API URL')" />
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="table-responsive table-responsive--sm mb-3">
                                        <table class="align-items-center table--light table">
                                            <thead>
                                                <tr>
                                                    <th>@lang('Short Code') </th>
                                                    <th>@lang('Description')</th>
                                                </tr>
                                            </thead>
                                            <tbody class="list">
                                                <tr>
                                                    <td>@{{message}}</td>
                                                    <td>@lang('Message')</td>
                                                </tr>
                                                <tr>
                                                    <td>@{{number}}</td>
                                                    <td>@lang('Number')</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="card border--dark mb-3">
                                        <div class="card-header bg--dark d-flex justify-content-between">
                                            <h5 class="text-white">@lang('Headers')</h5>
                                            <button class="btn btn-sm btn-outline-light addHeader float-right" type="button"><i class="la la-fw la-plus"></i>@lang('Add') </button>
                                        </div>
                                        <div class="card-body">
                                            <div class="headerFields">
                                                @for ($i = 0; $i < count($general->sms_config->custom->headers->name); $i++)
                                                    <div class="row mt-3">
                                                        <div class="col-md-5">
                                                            <input class="form-control" name="custom_header_name[]" type="text" value="{{ @$general->sms_config->custom->headers->name[$i] }}" placeholder="@lang('Headers Name')">
                                                        </div>
                                                        <div class="col-md-5">
                                                            <input class="form-control" name="custom_header_value[]" type="text" value="{{ @$general->sms_config->custom->headers->value[$i] }}" placeholder="@lang('Headers Value')">
                                                        </div>
                                                        <div class="col-md-2">
                                                            <button class="btn btn--danger btn-block removeHeader h-100" type="button"><i class="las la-times"></i></button>
                                                        </div>
                                                    </div>
                                                @endfor
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="card border--dark mb-3">
                                        <div class="card-header bg--dark d-flex justify-content-between">
                                            <h5 class="text-white">@lang('Body')</h5>
                                            <button class="btn btn-sm btn-outline-light addBody float-right" type="button"><i class="la la-fw la-plus"></i>@lang('Add') </button>
                                        </div>
                                        <div class="card-body">
                                            <div class="bodyFields">
                                                @for ($i = 0; $i < count($general->sms_config->custom->body->name); $i++)
                                                    <div class="row mt-3">
                                                        <div class="col-md-5">
                                                            <input class="form-control" name="custom_body_name[]" type="text" value="{{ @$general->sms_config->custom->body->name[$i] }}" placeholder="@lang('Body Name')">
                                                        </div>
                                                        <div class="col-md-5">
                                                            <input class="form-control" name="custom_body_value[]" type="text" value="{{ @$general->sms_config->custom->body->value[$i] }}" placeholder="@lang('Body Value')">
                                                        </div>
                                                        <div class="col-md-2">
                                                            <button class="btn btn--danger btn-block removeBody h-100" type="button"><i class="las la-times"></i></button>
                                                        </div>
                                                    </div>
                                                @endfor
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <button class="btn w-100 h-45 btn--primary" type="submit">@lang('Submit')</button>
                    </div>
                </form>
            </div><!-- card end -->
        </div>

    </div>

    {{-- TEST MAIL MODAL --}}
    <div class="modal fade" id="testSMSModal" role="dialog" tabindex="-1">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">@lang('Test SMS Setup')</h5>
                    <button class="close" data-bs-dismiss="modal" type="button" aria-label="Close">
                        <i class="las la-times"></i>
                    </button>
                </div>
                <form action="{{ route('admin.setting.notification.sms.test') }}" method="POST">
                    @csrf
                    <input name="id" type="hidden">
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>@lang('Sent to') </label>
                                    <input class="form-control" name="mobile" type="text" placeholder="@lang('Mobile')">
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
        <button class="btn btn-outline--primary btn-sm" data-bs-target="#testSMSModal" data-bs-toggle="modal" type="button"> <i class="las la-paper-plane"></i> @lang('Send Test SMS')</button>
@endpush
@push('style')
    <style>
        .method-select {
            padding: 2px 7px;
        }
    </style>
@endpush
@push('script')
    <script>
        (function($) {
            "use strict";

            var method = '{{ @$general->sms_config->name }}';

            if (!method) {
                method = 'clickatell';
            }

            smsMethod(method);
            $('select[name=sms_method]').on('change', function() {
                var method = $(this).val();
                smsMethod(method);
            });

            function smsMethod(method) {
                $('.configForm').addClass('d-none');
                if (method != 'php') {
                    $(`#${method}`).removeClass('d-none');
                }
            }

            $('.addHeader').click(function() {
                var html = `
                    <div class="row mt-3">
                        <div class="col-md-5">
                            <input type="text" name="custom_header_name[]" class="form-control" placeholder="@lang('Headers Name')">
                        </div>
                        <div class="col-md-5">
                            <input type="text" name="custom_header_value[]" class="form-control" placeholder="@lang('Headers Value')">
                        </div>
                        <div class="col-md-2">
                            <button type="button" class="btn btn--danger btn-block removeHeader h-100"><i class="las la-times"></i></button>
                        </div>
                    </div>
                `;
                $('.headerFields').append(html);

            })
            $(document).on('click', '.removeHeader', function() {
                $(this).closest('.row').remove();
            })

            $('.addBody').click(function() {
                var html = `
                    <div class="row mt-3">
                        <div class="col-md-5">
                            <input type="text" name="custom_body_name[]" class="form-control" placeholder="@lang('Body Name')">
                        </div>
                        <div class="col-md-5">
                            <input type="text" name="custom_body_value[]" class="form-control" placeholder="@lang('Body Value')">
                        </div>
                        <div class="col-md-2">
                            <button type="button" class="btn btn--danger btn-block removeBody h-100"><i class="las la-times"></i></button>
                        </div>
                    </div>
                `;
                $('.bodyFields').append(html);

            })
            $(document).on('click', '.removeBody', function() {
                $(this).closest('.row').remove();
            })

            $('select[name=custom_api_method]').val('{{ @$general->sms_config->custom->method }}');

        })(jQuery);
    </script>
@endpush
