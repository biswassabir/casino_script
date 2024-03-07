@php
$content = getContent('about.content',true);
$abouts = getContent('about.element',false,null,true);
@endphp
<section class="pt-120 pb-120">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6 pr-lg-5">
                <div class="about-content">
                    <h2 class="mb-3">{{ __(@$content->data_values->heading) }}</h2>
                    <p class="mb-3">{{ __(@$content->data_values->description) }}</p>
                    <div class="row mt-4">
                        @foreach($abouts as $about)
                        <div class="col-6 mb-15 wow fadeInUp" data-wow-duration="0.5s" data-wow-delay="0.3s">
                            <div class="feature-card ">
                                <div class="feature-card__icon">
                                    @php echo @$about->data_values->icon @endphp
                                </div>
                                <div class="feature-card__content">
                                    <h4 class="title">{{ __(@$about->data_values->title) }}</h4>
                                </div>
                            </div>
                        </div>
                        @endforeach
                    </div>
                    <a href="{{ $content->data_values->button_url }}" class="cmn-btn mt-3">{{ __($content->data_values->button) }}</a>
                </div>
            </div>
            <div class="col-lg-6 mt-lg-0 mt-5 d-lg-block d-none">
                <div class="about-thumb wow fadeInUp" data-wow-duration="0.5s" data-wow-delay="0.5s">
                    <img src="{{ getImage('assets/images/frontend/about/'.@$content->data_values->image,'590x565') }}" alt="about image">
                </div>
            </div>
        </div>
    </div>
</section>