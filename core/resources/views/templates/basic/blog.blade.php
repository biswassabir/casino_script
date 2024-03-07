@extends($activeTemplate . 'layouts.frontend')
@section('content')
<section class="pt-120 pb-120">
    <div class="container">
        <div class="row mb-none-30 justify-content-center">
            @foreach ($blogs as $blog)
            <div class="col-lg-4 col-md-6 mb-30 wow fadeInUp" data-wow-duration="0.5s" data-wow-delay="0.3s">
                <div class="post-card">
                    <div class="post-card__thumb">
                        <img src="{{ getImage('assets/images/frontend/blog/thumb_' . @$blog->data_values->image, '350x250') }}" alt="image">
                        <span class="post-card__date">{{ @$blog->created_at->format('d M, Y') }}</span>
                    </div>
                    <div class="post-card__content">
                        <h3 class="post-card__title mt-2 mb-3"><a href="{{ route('blog.details', [slug(@$blog->data_values->title), $blog->id]) }}">{{ __(@$blog->data_values->title) }}</a>
                        </h3>
                        <a class="cmn-btn btn-sm mt-3" href="{{ route('blog.details', [slug(@$blog->data_values->title), $blog->id]) }}">@lang('Read More')</a>
                    </div>
                </div>
            </div>
            @endforeach
            {{ paginateLinks($blogs) }}
        </div>
    </div>
</section>
@if ($sections->secs != null)
@foreach (json_decode($sections->secs) as $sec)
@include($activeTemplate . 'sections.' . $sec)
@endforeach
@endif
@endsection