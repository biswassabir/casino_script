@extends($activeTemplate . 'layouts.master')
@section('content')
    <div class="pt-120 pb-120">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header">
                            <h5>@lang('NMI')</h5>
                        </div>
                        <div class="card-body">
                            <form id="payment-form" role="form" method="{{ $data->method }}" action="{{ $data->url }}">
                                @csrf
                                <div class="row">
                                    <div class="col-md-12">
                                        <label class="form-label">@lang('Card Number')</label>
                                        <div class="input-group">
                                            <input class="form-control form--control" name="billing-cc-number" type="tel" value="{{ old('billing-cc-number') }}" autocomplete="off" required autofocus />
                                            <span class="input-group-text"><i class="fa fa-credit-card"></i></span>
                                        </div>
                                    </div>
                                </div>

                                <div class="row mt-4">
                                    <div class="col-md-6">
                                        <label class="form-label">@lang('Expiration Date')</label>
                                        <input class="form-control form--control" name="billing-cc-exp" type="tel" value="{{ old('billing-cc-exp') }}" placeholder="e.g. MM/YY" autocomplete="off" required />
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">@lang('CVC Code')</label>
                                        <input class="form-control form--control" name="billing-cc-cvv" type="tel" value="{{ old('billing-cc-cvv') }}" autocomplete="off" required />
                                    </div>
                                </div>
                                <br>
                                <button class="btn btn--base w-100" type="submit"> @lang('Submit')</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
