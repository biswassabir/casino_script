@extends('admin.layouts.app')

@section('panel')
    <div class="row gy-4">
        @foreach ($templates as $temp)
            <div class="col-xl-4 col-md-6">
                <div class="card">
                    <div class="card-header bg--primary d-flex justify-content-between flex-wrap">
                        <h4 class="card-title text-white"> {{ __(keyToTitle($temp['name'])) }} </h4>
                        @if ($general->active_template == $temp['name'])
                            <button class="btn btn--info" name="name" type="submit" value="{{ $temp['name'] }}">
                                @lang('SELECTED')
                            </button>
                        @else
                            <form action="" method="post">
                                @csrf
                                <button class="btn btn--success w-100" name="name" type="submit" value="{{ $temp['name'] }}">
                                    @lang('SELECT')
                                </button>
                            </form>
                        @endif
                    </div>
                    <div class="card-body p-0">
                        <img class="w-100" src="{{ $temp['image'] }}" alt="@lang('Template')">
                    </div>
                </div>
            </div>
        @endforeach

        @if ($extra_templates)
            @foreach ($extra_templates as $temp)
                <div class="col-lg-3">
                    <div class="card">
                        <div class="card-header bg--primary">
                            <h4 class="card-title text-white"> {{ __(keyToTitle($temp['name'])) }} </h4>
                        </div>
                        <div class="card-body">
                            <img class="w-100" src="{{ $temp['image'] }}" alt="@lang('Template')">
                        </div>
                        <div class="card-footer">
                            <a class="btn btn--primary w-100" href="{{ $temp['url'] }}" target="_blank">@lang('Get This')</a>
                        </div>
                    </div>
                </div>
            @endforeach
        @endif

    </div>

@endsection
