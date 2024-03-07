@extends('admin.layouts.app')

@section('panel')
<div class="row">
    <div class="col-12">
        <div class="row gy-4">

            <div class="col-xxl-3 col-sm-6">
                <div class="widget-two style--two box--shadow2 b-radius--5 bg--19">
                    <div class="widget-two__icon b-radius--5 bg--primary">
                        <i class="las la-money-bill-wave-alt"></i>
                    </div>
                    <div class="widget-two__content">
                        <h3 class="text-white">{{ $general->cur_sym }}{{ showAmount($user->balance) }}</h3>
                        <p class="text-white">@lang('Balance')</p>
                    </div>
                    <a class="widget-two__btn" href="{{ route('admin.report.transaction') }}?search={{ $user->username }}">@lang('View All')</a>
                </div>
            </div>

            <div class="col-xxl-3 col-sm-6">
                <div class="widget-two style--two box--shadow2 b-radius--5 bg--primary">
                    <div class="widget-two__icon b-radius--5 bg--primary">
                        <i class="las la-wallet"></i>
                    </div>
                    <div class="widget-two__content">
                        <h3 class="text-white">{{ $general->cur_sym }}{{ showAmount($totalDeposit) }}</h3>
                        <p class="text-white">@lang('Deposits')</p>
                    </div>
                    <a class="widget-two__btn" href="{{ route('admin.deposit.list') }}?search={{ $user->username }}">@lang('View All')</a>
                </div>
            </div>

            <div class="col-xxl-3 col-sm-6">
                <div class="widget-two style--two box--shadow2 b-radius--5 bg--1">
                    <div class="widget-two__icon b-radius--5 bg--primary">
                        <i class="fas fa-wallet"></i>
                    </div>
                    <div class="widget-two__content">
                        <h3 class="text-white">{{ $general->cur_sym }}{{ showAmount($totalWithdrawals) }}</h3>
                        <p class="text-white">@lang('Withdrawals')</p>
                    </div>
                    <a class="widget-two__btn" href="{{ route('admin.withdraw.log') }}?search={{ $user->username }}">@lang('View All')</a>
                </div>
            </div>

            <div class="col-xxl-3 col-sm-6">
                <div class="widget-two style--two box--shadow2 b-radius--5 bg--17">
                    <div class="widget-two__icon b-radius--5 bg--primary">
                        <i class="las la-gamepad"></i>
                    </div>
                    <div class="widget-two__content">
                        <h3 class="text-white">{{ $widget['total_played'] }}</h3>
                        <p class="text-white">@lang('Total Played')</p>
                    </div>
                    <a class="widget-two__btn" href="{{ route('admin.game.log') }}?search={{ $user->username }}">@lang('View All')</a>
                </div>
            </div>

            <div class="col-xxl-3 col-sm-6">
                <div class="widget-two style--two box--shadow2 b-radius--5 bg--10">
                    <div class="widget-two__icon b-radius--5 bg--10">
                        <i class="las la-money-bill-wave-alt"></i>
                    </div>
                    <div class="widget-two__content">
                        <h3 class="text-white">{{ $general->cur_sym }}{{ getAmount($widget['total_invest']) }}</h3>
                        <p class="text-white">@lang('Total Invest')</p>
                    </div>
                    <a class="widget-two__btn" href="{{ route('admin.game.log') }}?search={{ $user->username }}">@lang('View All')</a>
                </div>
            </div>

            <div class="col-xxl-3 col-sm-6">
                <div class="widget-two style--two box--shadow2 b-radius--5 bg--success">
                    <div class="widget-two__icon b-radius--5 bg--success">
                        <i class="las la-wallet"></i>
                    </div>
                    <div class="widget-two__content">
                        <h3 class="text-white">{{ $general->cur_sym }}{{ getAmount($widget['total_win_amount']) }}</h3>
                        <p class="text-white">@lang('Total Win Amount')</p>
                    </div>
                    <a class="widget-two__btn" href="{{ route('admin.game.log') }}?search={{ $user->username }}&win_status=1">@lang('View All')</a>
                </div>
            </div>

            <div class="col-xxl-3 col-sm-6">
                <div class="widget-two style--two box--shadow2 b-radius--5 bg--danger">
                    <div class="widget-two__icon b-radius--5 bg--danger">
                        <i class="fas fa-wallet"></i>
                    </div>
                    <div class="widget-two__content">
                        <h3 class="text-white">{{ $general->cur_sym }}{{ getAmount($widget['total_loss_amount']) }}</h3>
                        <p class="text-white">@lang('Total Loss Amount')</p>
                    </div>
                    <a class="widget-two__btn" href="{{ route('admin.game.log') }}?search={{ $user->username }}&win_status=2">@lang('View All')</a>
                </div>
            </div>

            <div class="col-xxl-3 col-sm-6">
                <div class="widget-two style--two box--shadow2 b-radius--5 bg--green">
                    <div class="widget-two__icon b-radius--5 bg--green">
                        <i class="las la-exchange-alt"></i>
                    </div>
                    <div class="widget-two__content">
                        <h3 class="text-white">{{ $totalTransaction }}</h3>
                        <p class="text-white">@lang('Total Transactions')</p>
                    </div>
                </div>
            </div>

        </div>

        <div class="d-flex mt-4 flex-wrap gap-3">
            <div class="flex-fill">
                <button class="btn btn--success btn--shadow w-100 btn-lg bal-btn" data-bs-toggle="modal" data-bs-target="#addSubModal" data-act="add">
                    <i class="las la-plus-circle"></i> @lang('Balance')
                </button>
            </div>

            <div class="flex-fill">
                <button class="btn btn--danger btn--shadow w-100 btn-lg bal-btn" data-bs-toggle="modal" data-bs-target="#addSubModal" data-act="sub">
                    <i class="las la-minus-circle"></i> @lang('Balance')
                </button>
            </div>

            <div class="flex-fill">
                <a class="btn btn--primary btn--shadow w-100 btn-lg" href="{{ route('admin.report.login.history') }}?search={{ $user->username }}">
                    <i class="las la-list-alt"></i>@lang('Logins')
                </a>
            </div>

            <div class="flex-fill">
                <a class="btn btn--secondary btn--shadow w-100 btn-lg" href="{{ route('admin.users.notification.log', $user->id) }}">
                    <i class="las la-bell"></i>@lang('Notifications')
                </a>
            </div>

            <div class="flex-fill">
                <a class="btn btn--primary btn--gradi btn--shadow w-100 btn-lg" href="{{ route('admin.users.login', $user->id) }}" target="_blank">
                    <i class="las la-sign-in-alt"></i>@lang('Login as User')
                </a>
            </div>

            @if ($user->kyc_data)
            <div class="flex-fill">
                <a class="btn btn--dark btn--shadow w-100 btn-lg" href="{{ route('admin.users.kyc.details', $user->id) }}" target="_blank">
                    <i class="las la-user-check"></i>@lang('KYC Data')
                </a>
            </div>
            @endif

            <div class="flex-fill">
                @if($user->status == Status::USER_ACTIVE)
                <button class="btn btn--warning btn--gradi btn--shadow w-100 btn-lg userStatus" data-bs-toggle="modal" data-bs-target="#userStatusModal" type="button">
                    <i class="las la-ban"></i>@lang('Ban User')
                </button>
                @else
                <button class="btn btn--success btn--gradi btn--shadow w-100 btn-lg userStatus" data-bs-toggle="modal" data-bs-target="#userStatusModal" type="button">
                    <i class="las la-undo"></i>@lang('Unban User')
                </button>
                @endif
            </div>
        </div>

        <div class="card mt-30">
            <div class="card-header">
                <h5 class="card-title mb-0">@lang('Information of') {{ $user->fullname }}</h5>
            </div>
            <div class="card-body">
                <form action="{{ route('admin.users.update', [$user->id]) }}" method="POST" enctype="multipart/form-data">
                    @csrf

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>@lang('First Name')</label>
                                <input class="form-control" name="firstname" type="text" value="{{ $user->firstname }}" required>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="form-control-label">@lang('Last Name')</label>
                                <input class="form-control" name="lastname" type="text" value="{{ $user->lastname }}" required>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>@lang('Email') </label>
                                <input class="form-control" name="email" type="email" value="{{ $user->email }}" required>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label>@lang('Mobile Number') </label>
                                <div class="input-group">
                                    <span class="input-group-text mobile-code"></span>
                                    <input class="form-control checkUser" id="mobile" name="mobile" type="number" value="{{ old('mobile') }}" required>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row mt-4">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>@lang('Address')</label>
                                <input class="form-control" name="address" type="text" value="{{ @$user->address->address }}">
                            </div>
                        </div>

                        <div class="col-xl-3 col-md-6">
                            <div class="form-group">
                                <label>@lang('City')</label>
                                <input class="form-control" name="city" type="text" value="{{ @$user->address->city }}">
                            </div>
                        </div>

                        <div class="col-xl-3 col-md-6">
                            <div class="form-group">
                                <label>@lang('State')</label>
                                <input class="form-control" name="state" type="text" value="{{ @$user->address->state }}">
                            </div>
                        </div>

                        <div class="col-xl-3 col-md-6">
                            <div class="form-group">
                                <label>@lang('Zip/Postal')</label>
                                <input class="form-control" name="zip" type="text" value="{{ @$user->address->zip }}">
                            </div>
                        </div>

                        <div class="col-xl-3 col-md-6">
                            <div class="form-group">
                                <label>@lang('Country')</label>
                                <select class="form-control" name="country">
                                    @foreach ($countries as $key => $country)
                                    <option data-mobile_code="{{ $country->dial_code }}" value="{{ $key }}">{{ __($country->country) }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-xl-3 col-md-6 col-12">
                            <label>@lang('Email Verification')</label>
                            <input name="ev" data-width="100%" data-onstyle="-success" data-offstyle="-danger" data-bs-toggle="toggle" data-on="@lang('Verified')" data-off="@lang('Unverified')" type="checkbox" @if ($user->ev) checked @endif>

                        </div>

                        <div class="form-group col-xl-3 col-md-6 col-12">
                            <label>@lang('Mobile Verification')</label>
                            <input name="sv" data-width="100%" data-onstyle="-success" data-offstyle="-danger" data-bs-toggle="toggle" data-on="@lang('Verified')" data-off="@lang('Unverified')" type="checkbox" @if ($user->sv) checked @endif>

                        </div>
                        <div class="form-group col-xl-3 col-md- col-12">
                            <label>@lang('2FA Verification') </label>
                            <input name="ts" data-width="100%" data-height="50" data-onstyle="-success" data-offstyle="-danger" data-bs-toggle="toggle" data-on="@lang('Enable')" data-off="@lang('Disable')" type="checkbox" @if ($user->ts) checked @endif>
                        </div>
                        <div class="form-group col-xl-3 col-md- col-12">
                            <label>@lang('KYC') </label>
                            <input name="kv" data-width="100%" data-height="50" data-onstyle="-success" data-offstyle="-danger" data-bs-toggle="toggle" data-on="@lang('Verified')" data-off="@lang('Unverified')" type="checkbox" @if ($user->kv == 1) checked @endif>
                        </div>
                    </div>

                    <div class="row mt-4">
                        <div class="col-md-12">
                            <div class="form-group">
                                <button class="btn btn--primary w-100 h-45" type="submit">@lang('Submit')
                                </button>
                            </div>
                        </div>

                    </div>
                </form>
            </div>
        </div>

    </div>
</div>

{{-- Add Sub Balance MODAL --}}
<div class="modal fade" id="addSubModal" role="dialog" tabindex="-1">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"><span class="type"></span> <span>@lang('Balance')</span></h5>
                <button class="close" data-bs-dismiss="modal" type="button" aria-label="Close">
                    <i class="las la-times"></i>
                </button>
            </div>
            <form action="{{ route('admin.users.add.sub.balance', $user->id) }}" method="POST">
                @csrf
                <input name="act" type="hidden">
                <div class="modal-body">
                    <div class="form-group">
                        <label>@lang('Amount')</label>
                        <div class="input-group">
                            <input class="form-control" name="amount" type="number" step="any" placeholder="@lang('Please provide positive amount')" required>
                            <div class="input-group-text">{{ __($general->cur_text) }}</div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>@lang('Remark')</label>
                        <textarea class="form-control" name="remark" placeholder="@lang('Remark')" rows="4" required></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn--primary h-45 w-100" type="submit">@lang('Submit')</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="userStatusModal" role="dialog" tabindex="-1">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">
                    @if($user->status == Status::USER_ACTIVE)
                    <span>@lang('Ban User')</span>
                    @else
                    <span>@lang('Unban User')</span>
                    @endif
                </h5>
                <button class="close" data-bs-dismiss="modal" type="button" aria-label="Close">
                    <i class="las la-times"></i>
                </button>
            </div>
            <form action="{{ route('admin.users.status', $user->id) }}" method="POST">
                @csrf
                <div class="modal-body">
                    @if($user->status == Status::USER_ACTIVE)
                    <h6 class="mb-2">@lang('If you ban this user he/she won\'t able to access his/her dashboard.')</h6>
                    <div class="form-group">
                        <label>@lang('Reason')</label>
                        <textarea class="form-control" name="reason" rows="4" required></textarea>
                    </div>
                    @else
                    <p><span>@lang('Ban reason was'):</span></p>
                    <p>{{ $user->ban_reason }}</p>
                    <h4 class="mt-3 text-center">@lang('Are you sure to unban this user?')</h4>
                    @endif
                </div>
                <div class="modal-footer">
                    @if($user->status == Status::USER_ACTIVE)
                    <button class="btn btn--primary h-45 w-100" type="submit">@lang('Submit')</button>
                    @else
                    <button class="btn btn--dark" data-bs-dismiss="modal" type="button">@lang('No')</button>
                    <button class="btn btn--primary" type="submit">@lang('Yes')</button>
                    @endif
                </div>
            </form>
        </div>
    </div>
</div>
@endsection

@push('script')
<script>
    (function($) {
            "use strict"
            $('.bal-btn').click(function() {
                var act = $(this).data('act');
                $('#addSubModal').find('input[name=act]').val(act);
                if (act == 'add') {
                    $('.type').text('Add');
                } else {
                    $('.type').text('Subtract');
                }
            });
            let mobileElement = $('.mobile-code');
            $('select[name=country]').change(function() {
                mobileElement.text(`+${$('select[name=country] :selected').data('mobile_code')}`);
            });

            $('select[name=country]').val('{{ @$user->country_code }}');
            let dialCode = $('select[name=country] :selected').data('mobile_code');
            let mobileNumber = `{{ $user->mobile }}`;
            mobileNumber = mobileNumber.replace(dialCode, '');
            $('input[name=mobile]').val(mobileNumber);
            mobileElement.text(`+${dialCode}`);

        })(jQuery);
</script>
@endpush