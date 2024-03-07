@extends('admin.layouts.app')
@section('panel')
<div class="row">
    <div class="col-sm-8 col-lg-8 col-xl-6 mx-auto">
        <div class="card border--primary parent">
            <div class="card-header bg--primary">
                <h5 class="text-white float-start">@lang('Deposit Referral Commission')</h5>
                @if($general->dc == 0)
                <a href="{{ route('admin.referral.status',1) }}" class="btn btn--success btn-sm float-end"><i class="las la-toggle-on"></i> @lang('Enable Now')</a>
                @else
                <a href="{{ route('admin.referral.status',0) }}" class="btn btn--danger btn-sm float-end"><i class="las la-toggle-off"></i> @lang('Disable Now')</a>
                @endif
            </div>

            <div class="card-body">
                <ul class="list-group list-group-flush">
                    @forelse($referrals as $key => $referral)
                    <li class="list-group-item d-flex flex-wrap justify-content-between">
                        <span class="fw-bold">@lang('Level') {{ $referral->level }}</span>
                        <span class="fw-bold">{{ $referral->percent }}%</span>
                    </li>
                    @endforeach
                </ul>

                <div class="border-line-area">
                    <h6 class="border-line-title">@lang('Update Setting')</h6>
                </div>

                <div class="form-group mb-0">
                    <label>@lang('Number of Level')</label>
                    <div class="input-group">
                        <input type="number" name="level" min="1" placeholder="@lang('Type a number & hit ENTER ↵')" class="form-control">
                        <button type="button" class="btn btn--primary generate">@lang('Generate')</button>
                    </div>
                    <span class="text--danger required-message d-none">@lang('Please enter a number')</span>
                </div>

                <form action="{{ route('admin.referral.store') }}" method="post" class="d-none levelForm">
                    @csrf
                    <h6 class="text--danger my-3">@lang('The old setting will be removed after generating new')</h6>
                    <div class="form-group">
                        <div class="referralLevels"></div>
                    </div>
                    <button type="submit" class="btn btn--primary h-45 w-100">@lang('Submit')</button>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection
@push('style')
<style>
    .border-line-area {
        position: relative;
        text-align: center;
        z-index: 1;
    }

    .border-line-area::before {
        position: absolute;
        content: '';
        top: 50%;
        left: 0;
        width: 100%;
        height: 1px;
        background-color: #e5e5e5;
        z-index: -1;
    }

    .border-line-title {
        display: inline-block;
        padding: 3px 10px;
        background-color: #fff;
    }
</style>
@endpush

@push('script')
<script>
    (function($){
        "use strict";
        $('[name="level"]').on('keyup', function(e){
            if(e.which == 13){
                generrateLevels($(this));
            }
        });

        $(".generate").on('click', function () {
            let $this = $(this).parents('.card-body').find('[name="level"]');
            generrateLevels($this);
        });

        $(document).on('click', '.deleteBtn', function () {
            $(this).closest('.input-group').remove();
        });

        function generrateLevels($this){
            let numberOfLevel = $this.val();
            let parent = $this.parents('.card-body');
            let html = '';
            if (numberOfLevel && numberOfLevel > 0){
                parent.find('.levelForm').removeClass('d-none');
                parent.find('.required-message').addClass('d-none');

                for (i = 1; i <= numberOfLevel; i++){
                    html += `
                    <div class="input-group mb-3">
                        <span class="input-group-text justify-content-center">@lang('Level') ${i}</span>
                        <input type="hidden" name="level[]" value="${i}" required>
                        <input name="percent[]" class="form-control col-10" type="number" step="any" required placeholder="@lang('Commission Percentage')">
                        <button class="btn btn--danger input-group-text deleteBtn" type="button"><i class=\'la la-times\'></i></button>
                    </div>`
                }

                parent.find('.referralLevels').html(html);
            }else {
                parent.find('.levelForm').addClass('d-none');
                parent.find('.required-message').removeClass('d-none');
            }
        }

    })(jQuery);

</script>
@endpush