@extends('admin.layouts.app')

@section('panel')
<div class="row">
    <div class="col-lg-12">

        <div class="card">
            <div class="card-body">

                <h6 class="card-title mb-4">
                    <div class="row">
                        <div class="col-sm-8 col-md-6">
                            @php echo $ticket->statusBadge; @endphp
                            [@lang('Ticket#'){{ $ticket->ticket }}] {{ $ticket->subject }}
                        </div>
                        <div class="col-sm-4 col-md-6 text-sm-end mt-sm-0 mt-3">
                            @if($ticket->status != Status::TICKET_CLOSE)
                            <button class="btn btn--danger btn-sm" data-bs-toggle="modal" data-bs-target="#DelModal" type="button">
                                <i class="fa fa-lg fa-times-circle"></i> @lang('Close Ticket')
                            </button>
                            @endif
                        </div>
                    </div>
                </h6>

                <form class="form-horizontal" action="{{ route('admin.ticket.reply', $ticket->id) }}" enctype="multipart/form-data" method="post">
                    @csrf

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <textarea class="form-control" id="inputMessage" name="message" rows="5" required></textarea>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="row form-group">
                                <div class="col-12">
                                    <label for="inputAttachments">@lang('Attachments')</label> <span class="text--danger">@lang('Max 5 files can be uploaded. Maximum upload size is') {{ ini_get('upload_max_filesize') }}</span>
                                </div>
                                <div class="col-9">
                                    <div class="file-upload-wrapper" data-text="@lang('Select your file!')">
                                        <input class="file-upload-field" id="inputAttachments" name="attachments[]" type="file" />
                                    </div>
                                </div>
                                <div class="col-3">
                                    <button class="btn btn--dark extraTicketAttachment ms-0" type="button"><i class="fa fa-plus"></i></button>
                                </div>
                                <div class="col-12">
                                    <div id="fileUploadsContainer"></div>
                                </div>
                                <div class="col-md-12 ticket-attachments-message text-muted mt-3">
                                    @lang('Allowed File Extensions'): .@lang('jpg'), .@lang('jpeg'), .@lang('png'), .@lang('pdf'), .@lang('doc'), .@lang('docx')
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 offset-md-3">
                            <button class="btn btn--primary w-100 mt-4" name="replayTicket" type="submit" value="1"><i class="la la-fw la-lg la-reply"></i> @lang('Reply')
                            </button>
                        </div>
                    </div>

                </form>

                @foreach ($messages as $message)
                @if ($message->admin_id == 0)
                <div class="row border--primary border-radius-3 my-3 mx-2 border">

                    <div class="col-md-3 border-end text-md-end text-start">
                        <h5 class="my-3">{{ $ticket->name }}</h5>
                        @if ($ticket->user_id != null)
                        <p><a href="{{ route('admin.users.detail', $ticket->user_id) }}">&#64;{{ $ticket->name }}</a></p>
                        @else
                        <p>@<span>{{ $ticket->name }}</span></p>
                        @endif
                        <button class="btn btn-danger btn-sm confirmationBtn my-3" data-question="@lang('Are you sure to delete this message?')" data-action="{{ route('admin.ticket.delete', $message->id) }}"><i class="la la-trash"></i> @lang('Delete')</button>
                    </div>

                    <div class="col-md-9">
                        <p class="text-muted fw-bold my-3">
                            @lang('Posted on') {{ showDateTime($message->created_at, 'l, dS F Y @ H:i') }}</p>
                        <p>{{ $message->message }}</p>
                        @if ($message->attachments->count() > 0)
                        <div class="my-3">
                            @foreach ($message->attachments as $k => $image)
                            <a class="me-2" href="{{ route('admin.ticket.download', encrypt($image->id)) }}"><i class="fa fa-file"></i> @lang('Attachment') {{ ++$k }}</a>
                            @endforeach
                        </div>
                        @endif
                    </div>
                </div>
                @else
                <div class="row border-warning border-radius-3 admin-bg-reply my-3 mx-2 border">

                    <div class="col-md-3 border-end text-md-end text-start">
                        <h5 class="my-3">{{ @$message->admin->name }}</h5>
                        <p class="lead text-muted">@lang('Staff')</p>
                        <button class="btn btn-danger btn-sm confirmationBtn my-3" data-question="@lang('Are you sure to delete this message?')" data-action="{{ route('admin.ticket.delete', $message->id) }}"><i class="la la-trash"></i> @lang('Delete')</button>
                    </div>

                    <div class="col-md-9">
                        <p class="text-muted fw-bold my-3">
                            @lang('Posted on') {{ showDateTime($message->created_at, 'l, dS F Y @ H:i') }}</p>
                        <p>{{ $message->message }}</p>
                        @if ($message->attachments->count() > 0)
                        <div class="my-3">
                            @foreach ($message->attachments as $k => $image)
                            <a class="me-2" href="{{ route('admin.ticket.download', encrypt($image->id)) }}"><i class="fa fa-file"></i> @lang('Attachment') {{ ++$k }} </a>
                            @endforeach
                        </div>
                        @endif
                    </div>

                </div>
                @endif
                @endforeach
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="DelModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"> @lang('Close Support Ticket!')</h5>
                <button class="close" data-bs-dismiss="modal" type="button" aria-label="Close">
                    <i class="las la-times"></i>
                </button>
            </div>
            <div class="modal-body">
                <p>@lang('Are you want to close this support ticket?')</p>
            </div>
            <div class="modal-footer">
                <form method="post" action="{{ route('admin.ticket.close', $ticket->id) }}">
                    @csrf
                    <input name="replayTicket" type="hidden" value="2">
                    <button class="btn btn--dark" data-bs-dismiss="modal" type="button"> @lang('No') </button>
                    <button class="btn btn--primary" type="submit"> @lang('Yes') </button>
                </form>
            </div>
        </div>
    </div>
</div>
<x-confirmation-modal />
@endsection

@push('breadcrumb-plugins')
    <x-back route="{{ route('admin.ticket.index') }}" />
@endpush

@push('script')
<script>
    "use strict";
        (function($) {
            $('.delete-message').on('click', function(e) {
                $('.message_id').val($(this).data('id'));
            })
            var fileAdded = 0;
            $('.extraTicketAttachment').on('click', function() {
                if (fileAdded >= 4) {
                    notify('error', 'You\'ve added maximum number of file');
                    return false;
                }
                fileAdded++;
                $("#fileUploadsContainer").append(`
                    <div class="row">
                        <div class="col-9 mb-3">
                            <div class="file-upload-wrapper" data-text="@lang('Select your file!')"><input type="file" name="attachments[]" id="inputAttachments" class="file-upload-field"/></div>
                        </div>
                        <div class="col-3">
                            <button type="button" class="btn btn--danger extraTicketAttachmentDelete"><i class="la la-times ms-0"></i></button>
                        </div>
                    </div>
                `)
            });

            $(document).on('click', '.extraTicketAttachmentDelete', function() {
                fileAdded--;
                $(this).closest('.row').remove();
            });
        })(jQuery);
</script>
@endpush
