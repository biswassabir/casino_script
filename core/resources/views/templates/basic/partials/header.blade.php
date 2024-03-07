@php
$pages = App\Models\Page::where('tempname',$activeTemplate)->where('is_default',Status::NO)->get();
@endphp
<header class="header">
    <div class="header__bottom">
        <div class="container">
            <nav class="navbar navbar-expand-xl align-items-center p-0">
                <a class="site-logo site-title" href="{{ route('home') }}"><img src="{{ getImage(getFilePath('logoIcon') . '/logo.png') }}" alt="site-logo"></a>
                <button class="navbar-toggler ml-auto" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" type="button" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="menu-toggle"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav main-menu m-auto">
                        <li><a href="{{ route('home') }}">@lang('Home')</a></li>
                        @foreach ($pages as $k => $data)
                        <li><a href="{{ route('pages', [$data->slug]) }}">{{ __($data->name) }}</a></li>
                        @endforeach
                        <li><a href="{{ route('games') }}">@lang('Games')</a></li>
                        <li><a href="{{ route('blog') }}">@lang('Blog')</a></li>
                        <li><a href="{{ route('contact') }}">@lang('Contact')</a></li>
                    </ul>
                    <div class="nav-right">

                        @auth
                        <a href="{{ route('user.home') }}"><i class="las la-tachometer-alt"></i> @lang('Dashboard')</a>
                        <a href="{{ route('user.logout') }}"><i class="las la-sign-out-alt"></i> @lang('Logout')
                        </a>
                        @else
                        <a href="{{ route('user.login') }}"><i class="las la-sign-in-alt"></i> @lang('Login')
                        </a>
                        @if ($general->registration)
                        <a href="{{ route('user.register') }}"><i class="las la-user-plus"></i> @lang('Registration')</a>
                        @endif
                        @endauth

                        @if ($general->language)
                        <select class="langSel">
                            @foreach ($language as $item)
                            <option value="{{ $item->code }}" @if (session('lang')==$item->code) selected @endif>{{ __($item->name) }}</option>
                            @endforeach
                        </select>
                        @endif

                    </div>
                </div>
            </nav>
        </div>
    </div>
</header>

@push('style')
<style>
    .nav-right .langSel {
        padding: 7px 20px;
        height: 37px;
    }
</style>
@endpush
