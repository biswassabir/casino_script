@php
$content = getContent('testimonial.content', true);
$testimonials = getContent('testimonial.element');
@endphp
<section class="pt-120 pb-120 overflow-hidden">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div class="section-header text-center">
                    <h2 class="section-title style--two">{{ __(@$content->data_values->heading) }}</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="testimonial-slider">
                    @foreach ($testimonials as $testimonial)
                    <div class="single-slide">
                        <div class="testimonial-card">
                            <div class="testimonial-card__content">
                                <div class="testimonial-card__content-inner">
                                    <p>{{ __(@$testimonial->data_values->quote) }}</p>
                                </div>
                            </div>
                            <div class="testimonial-card__thumb">
                                <img src="{{ getImage('assets/images/frontend/testimonial/' . @$testimonial->data_values->image, '100x100') }}" alt="image">
                            </div>
                            <h6 class="name mt-2">{{ __(@$testimonial->data_values->name) }}</h6>
                        </div>
                    </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
</section>