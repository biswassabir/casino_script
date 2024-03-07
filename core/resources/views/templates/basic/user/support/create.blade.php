@extends($activeTemplate . 'layouts.master')
@section('content')
<div class="pt-120 pb-120">
    <div class="container">
        <div class="row justify-content-center mt-4">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <form action="{{ route('ticket.store') }}" method="post" enctype="multipart/form-data">
                            @csrf
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label class="form-label">@lang('Name')</label>
                                    <input class="form-control form--control" name="name" type="text" value="{{ @$user->firstname . ' ' . @$user->lastname }}" required readonly>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="form-label">@lang('Email Address')</label>
                                    <input class="form-control form--control" name="email" type="email" value="{{ @$user->email }}" required readonly>
                                </div>

                                <div class="form-group col-md-6">
                                    <label class="form-label">@lang('Subject')</label>
                                    <input class="form-control form--control" name="subject" type="text" value="{{ old('subject') }}" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="form-label">@lang('Priority')</label>
                                    <select class="form-control form--control form-select" name="priority" required>
                                        <option value="3">@lang('High')</option>
                                        <option value="2">@lang('Medium')</option>
                                        <option value="1">@lang('Low')</option>
                                    </select>
                                </div>
                                <div class="col-12 form-group">
                                    <label class="form-label">@lang('Message')</label>
                                    <textarea class="form-control form--control" id="inputMessage" name="message" rows="6" required>{{ old('message') }}</textarea>
                                </div>
                            </div>

                            <div class="form-group d-flex my-2 gap-2">
                                <div class="position-relative w-100">
                                    <input class="form-control custom--file-upload" id="inputAttachments" name="attachments[]" type="file" />
                                    <label for="inputAttachments">@lang('Attachments')</label>
                                </div>
                                <button class="cmn-btn btn-sm addFile flex-shrink-0" type="button"><i class="las la-plus"></i></button>
                            </div>
                            <div id="fileUploadsContainer"></div>
                            <p class="ticket-attachments-message text-muted">
                                @lang('Allowed File Extensions'): .@lang('jpg'), .@lang('jpeg'), .@lang('png'), .@lang('pdf'), .@lang('doc'), .@lang('docx')
                            </p>

                            <button class="cmn-btn w-100 mt-3" type="submit"><i class="fa fa-paper-plane"></i>&nbsp;@lang('Submit')</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@push('style')
<style>
    .input-group-text:focus {
        box-shadow: none !important;
    }
</style>
@endpush

@push('script')
<script>
    (function($) {
            "use strict";
            var fileAdded = 0;
            $('.addFile').on('click', function() {
                if (fileAdded >= 4) {
                    notify('error', 'You\'ve added maximum number of file');
                    return false;
                }
                fileAdded++;
                $("#fileUploadsContainer").append(`
                    <div class="form-group d-flex gap-2 my-2">
                        <div class="position-relative w-100">
                            <input type="file" id="inputAttachments" name="attachments[]" class="form-control custom--file-upload" required/>
                            <label for="inputAttachments">@lang('Attachments')</label>
                        </div>
                        <button class="btn--danger btn-sm remove-btn flex-shrink-0" type="button"><i class="las la-times"></i></button>
                    </div>
                `)
            });
            $(document).on('click', '.remove-btn', function() {
                fileAdded--;
                $(this).closest('.form-group').remove();
            });
        })(jQuery);
</script>
@endpush