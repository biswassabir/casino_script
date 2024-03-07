@extends($activeTemplate.'layouts.app')
@section('app')
    @include($activeTemplate.'partials.header')

        @if (!request()->routeIs('home'))
            @include($activeTemplate.'partials.breadcrumb')
        @endif

        @yield('content')

    @include($activeTemplate.'partials.footer')
@endsection