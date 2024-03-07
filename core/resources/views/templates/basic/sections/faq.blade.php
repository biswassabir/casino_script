@php
$content = getContent('faq.content', true);
$faqs = getContent('faq.element', false, null, true);
@endphp
<section class="pt-120 pb-120">
    <div class="container">
        <div class="row align-items-center justify-content-center">
            <div class="col-lg-6">
                <div class="section-header text-center">
                    <h2 class="section-title">{{ __(@$content->data_values->heading) }}</h2>
                    <p class="mt-3">{{ __(@$content->data_values->subheading) }}</p>
                </div>
            </div>
            <div class="col-lg-12 order-lg-1 order-2">
                <div class="faq-content">
                    <div class="accordion cmn-accordion" id="faqAccordion-two">
                        <div class="row mb-none-30">
                            <div class="col-lg-6 mb-30">
                                @foreach ($faqs as $faq)
                                    @if ($loop->odd)
                                        <div class="card">
                                            <div class="card-header" id="h-{{ $loop->iteration }}">
                                                <button class="acc-btn collapsed" data-bs-toggle="collapse" data-bs-target="#c-{{ $loop->iteration }}" type="button" aria-expanded="false" aria-controls="c-{{ $loop->iteration }}">
                                                    <span class="text">{{ __(@$faq->data_values->question) }}</span>
                                                    <span class="plus-icon"></span>
                                                </button>
                                            </div>
                                            <div class="collapse" id="c-{{ $loop->iteration }}" data-bs-parent="#faqAccordion-two" aria-labelledby="h-{{ $loop->iteration }}">
                                                <div class="card-body">
                                                    <p>{{ __(@$faq->data_values->answer) }}</p>
                                                </div>
                                            </div>
                                        </div>
                                    @endif
                                @endforeach
                            </div>
                            <div class="col-lg-6 mb-30">
                                @foreach ($faqs as $faq)
                                    @if ($loop->even)
                                        <div class="card">
                                            <div class="card-header" id="h-{{ $loop->iteration }}">
                                                <button class="acc-btn collapsed" data-bs-toggle="collapse" data-bs-target="#c-{{ $loop->iteration }}" type="button" aria-expanded="false" aria-controls="c-{{ $loop->iteration }}">
                                                    <span class="text">{{ __(@$faq->data_values->question) }}</span>
                                                    <span class="plus-icon"></span>
                                                </button>
                                            </div>
                                            <div class="collapse" id="c-{{ $loop->iteration }}" data-bs-parent="#faqAccordion-two" aria-labelledby="h-{{ $loop->iteration }}">
                                                <div class="card-body">
                                                    <p>{{ __(@$faq->data_values->answer) }}</p>
                                                </div>
                                            </div>
                                        </div>
                                    @endif
                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
