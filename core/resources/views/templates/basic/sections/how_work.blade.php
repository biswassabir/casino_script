@php
$content = getContent('how_work.content',true);
$howWorks = getContent('how_work.element',false,null,true);
@endphp
<section class="pt-120">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div class="section-header text-center">
                    <h2 class="section-title style--two">{{ __(@$content->data_values->heading) }}</h2>
                </div>
            </div>
        </div>
        <div class="row mb-none-50">
            @foreach($howWorks as $work)
            <div class="col-lg-3 col-sm-6 mb-50 wow fadeInUp" data-wow-duration="0.5s" data-wow-delay="0.3s">
                <div class="work-card">
                    <div class="work-card__icon">
                        <span class="step-number">{{ $loop->iteration }}</span>
                        @php echo @$work->data_values->icon @endphp
                    </div>
                    <div class="work-card__content">
                        <h4 class="title mb-3">{{ __(@$work->data_values->title) }}</h4>
                        <p>{{ __(@$work->data_values->description) }}</p>
                    </div>
                </div>
            </div>
            @endforeach
        </div>
    </div>
</section>