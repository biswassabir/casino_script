@php
$statistics = getContent('statistics.element',false,null,true);
@endphp
<section class="statistics-section  section--bg">
    <div class="shape-1"></div>
    <div class="shape-2"></div>
    <div class="container">
        <div class="row mb-none-30">
            @foreach($statistics as $statistic)
            <div class="col-md-3 col-6 mb-30">
                <div class="stat-card">
                    <div class="stat-card__icon wow fadeInLeft" data-wow-duration="0.5s" data-wow-delay="0.3s">
                        @php echo @$statistic->data_values->icon @endphp
                    </div>
                    <div class="stat-card__content wow fadeInRight" data-wow-duration="0.5s" data-wow-delay="0.5s">
                        <h6 class="title">{{ __(@$statistic->data_values->title) }}</h6>
                        <span class="numbers">{{ __(@$statistic->data_values->amount) }}</span>
                    </div>
                </div>
            </div>
            @endforeach
        </div>
    </div>
</section>