@extends('admin.layouts.app')
@section('panel')
    <div id="app">
        <div class="row">

            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">

                        <div class="row justify-content-between mt-3">
                            <div class="col-md-7">
                                <ul>
                                    <li>
                                        <h5>@lang('Language Keywords of') {{ __($lang->name) }}</h5>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-5 mt-md-0 mt-3">
                                <button class="btn btn-sm btn-outline--primary float-end" data-bs-toggle="modal" data-bs-target="#addModal" type="button"><i class="fa fa-plus"></i> @lang('Add New Key') </button>
                            </div>
                        </div>
                        <hr>
                        <div class="table-responsive--sm table-responsive">
                            <table class="table--light tabstyle--two custom-data-table white-space-wrap table" id="myTable">
                                <thead>
                                    <tr>
                                        <th>
                                            @lang('Key')
                                        </th>
                                        <th>
                                            {{ __($lang->name) }}
                                        </th>

                                        <th class="w-85">@lang('Action')</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    @forelse($json as $k => $language)
                                        <tr>
                                            <td class="white-space-wrap">{{ $k }}</td>
                                            <td class="white-space-wrap text-left">{{ $language }}</td>

                                            <td>
                                                <a class="editModal btn btn-sm btn-outline--primary" data-bs-target="#editModal" data-bs-toggle="modal" data-title="{{ $k }}" data-key="{{ $k }}" data-value="{{ $language }}" href="javascript:void(0)">
                                                    <i class="la la-pencil"></i> @lang('Edit')
                                                </a>

                                                <a class="btn btn-sm btn-outline--danger deleteKey" data-key="{{ $k }}" data-value="{{ $language }}" data-bs-toggle="modal" data-bs-target="#DelModal" href="javascript:void(0)">
                                                    <i class="la la-trash"></i> @lang('Remove')
                                                </a>
                                            </td>
                                        </tr>
                                    @empty
                                        <tr>
                                            <td class="text-center" colspan="100%">{{ __($emptyMessage) }}</td>
                                        </tr>
                                    @endforelse
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="addModal" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true" tabindex="-1">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="addModalLabel"> @lang('Add New')</h4>
                        <button class="close" data-bs-dismiss="modal" type="button" aria-label="Close">
                            <i class="las la-times"></i>
                        </button>
                    </div>

                    <form action="{{ route('admin.language.store.key', $lang->id) }}" method="post">
                        @csrf
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="key">@lang('Key')</label>
                                <input class="form-control" id="key" name="key" type="text" value="{{ old('key') }}" required>

                            </div>
                            <div class="form-group">
                                <label for="value">@lang('Value')</label>
                                <input class="form-control" id="value" name="value" type="text" value="{{ old('value') }}" required>

                            </div>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn--primary w-100 h-45" type="submit"> @lang('Submit')</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>

        <div class="modal fade" id="editModal" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true" tabindex="-1">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="editModalLabel">@lang('Edit')</h4>
                        <button class="close" data-bs-dismiss="modal" type="button" aria-label="Close"><i class="las la-times"></i></button>
                    </div>

                    <form action="{{ route('admin.language.update.key', $lang->id) }}" method="post">
                        @csrf
                        <div class="modal-body">
                            <div class="form-group">
                                <label class="form-title" for="inputName"></label>
                                <input class="form-control" name="value" type="text" required>
                            </div>
                            <input name="key" type="hidden">
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn--primary w-100 h-45" type="submit">@lang('Submit')</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>

        <!-- Modal for DELETE -->
        <div class="modal fade" id="DelModal" role="dialog" aria-labelledby="DelModalLabel" aria-hidden="true" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="DelModalLabel"> @lang('Confirmation Alert!')</h5>
                        <button class="close" data-bs-dismiss="modal" type="button" aria-label="Close"><i class="las la-times"></i></button>
                    </div>
                    <div class="modal-body">
                        <p>@lang('Are you sure to delete this key from this language?')</p>
                    </div>
                    <form action="{{ route('admin.language.delete.key', $lang->id) }}" method="post">
                        @csrf
                        <input name="key" type="hidden">
                        <input name="value" type="hidden">
                        <div class="modal-footer">
                            <button class="btn btn--dark" data-bs-dismiss="modal" type="button">@lang('No')</button>
                            <button class="btn btn--primary" type="submit">@lang('Yes')</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    {{-- Import Modal --}}
    <div class="modal fade" id="importModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">@lang('Import Language')</h4>
                    <button class="close" data-bs-dismiss="modal" type="button" aria-label="Close"><i class="las la-times"></i></button>
                </div>
                <div class="modal-body">
                    <p class="text--danger text-center">@lang('If you import keywords, Your current keywords will be removed and replaced by imported keyword')</p>
                    <div class="form-group">
                        <select class="form-control select_lang" required>
                            <option value="">@lang('Select One')</option>
                            @foreach ($list_lang as $data)
                                <option value="{{ $data->id }}" @if ($data->id == $lang->id) class="d-none" @endif>{{ __($data->name) }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn--dark" data-bs-dismiss="modal" type="button">@lang('Close')</button>
                    <button class="btn btn--primary import_lang" type="button"> @lang('Import Now')</button>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('breadcrumb-plugins')
    <button class="btn btn-sm btn--primary box--shadow1 importBtn" type="button"><i class="la la-download"></i>@lang('Import Keywords')</button>
@endpush

@push('script')
    <script>
        (function($) {
            "use strict";
            $(document).on('click', '.deleteKey', function() {
                var modal = $('#DelModal');
                modal.find('input[name=key]').val($(this).data('key'));
                modal.find('input[name=value]').val($(this).data('value'));
            });
            $(document).on('click', '.editModal', function() {
                var modal = $('#editModal');
                modal.find('.form-title').text($(this).data('title'));
                modal.find('input[name=key]').val($(this).data('key'));
                modal.find('input[name=value]').val($(this).data('value'));
            });


            $(document).on('click', '.importBtn', function() {
                $('#importModal').modal('show');
            });
            $(document).on('click', '.import_lang', function(e) {
                var id = $('.select_lang').val();

                if (id == '') {
                    notify('error', 'Invalide selection');

                    return 0;
                } else {
                    $.ajax({
                        type: "post",
                        url: "{{ route('admin.language.import.lang') }}",
                        data: {
                            id: id,
                            toLangid: "{{ $lang->id }}",
                            _token: "{{ csrf_token() }}"
                        },
                        success: function(data) {
                            if (data == 'success') {
                                notify('success', 'Import Data Successfully');
                                window.location.href = "{{ url()->current() }}"
                            }
                        }
                    });
                }

            });
        })(jQuery);
    </script>
@endpush
