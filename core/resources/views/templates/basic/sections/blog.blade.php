@php
$content = getContent('blog.content',true);
$blogs = getContent('blog.element',false,3);
@endphp
<section class="pb-120">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div class="section-header text-center">
                    <h2 class="section-title">{{ __(@$content->data_values->heading) }}</h2>
                    <p class="mt-3">{{ __(@$content->data_values->subheading) }}</p>
                </div>
            </div>
        </div>
        <div class="row mb-none-30 justify-content-center">
            @foreach($blogs as $blog)
            <div class="col-lg-4 col-md-6 mb-30 wow fadeInUp" data-wow-duration="0.5s" data-wow-delay="0.3s">
                <div class="post-card">
                    <div class="post-card__thumb">
                        <img src="{{ getImage('assets/images/frontend/blog/thumb_'.@$blog->data_values->image,'350x250') }}" alt="image">
                        <span class="post-card__date">{{ @$blog->created_at->format('d M, Y') }}</span>
                    </div>
                    <div class="post-card__content">
                        <h3 class="post-card__title mt-2 mb-3"><a href="{{ route('blog.details', [slug(@$blog->data_values->title), $blog->id]) }}">{{ __(@$blog->data_values->title) }}</a>
                        </h3>
                        <a href="{{ route('blog.details', [slug(@$blog->data_values->title), $blog->id]) }}" class="cmn-btn btn-sm mt-3">@lang('Read More')</a>
                    </div>
                </div>
            </div>
            @endforeach
        </div>
    </div>
</section>