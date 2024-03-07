@extends('admin.layouts.app')

@section('panel')
<div class="row">
	<div class="col-lg-12">
		<div class="card">
			<form action="{{ route('admin.game.update',$game->id) }}" method="post" enctype="multipart/form-data">
				@csrf
				<div class="card-body">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<div class="image-upload">
									<div class="thumb">
										<div class="avatar-preview">
											<div class="profilePicPreview" style="background-image: url({{ getImage(getFilePath('game').'/'.$game->image,getFileSize('game')) }})">
												<button type="button" class="remove-image"><i class="fa fa-times"></i></button>
											</div>
										</div>
										<div class="avatar-edit">
											<input type="file" class="profilePicUpload" name="image" id="profilePicUpload" accept=".png, .jpg, .jpeg" requierd>
											<label for="profilePicUpload" class="bg--primary">@lang('Post image')</label>
											<small class="mt-2 text-facebook">@lang('Supported files:') <b>@lang('jpeg, jpg')</b>. @lang('Image will be resized into') <b>{{ getFileSize('game') }}@lang('px')</b></small>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<label>@lang('Game Name')</label>
								<input type="text" name="name" class="form-control" placeholder="@lang('Game Name')" value="{{ $game->name }}" required>
							</div>
							<div class="row mt-5">
								<div class="col-md-5 mb-4">
									<div class="card border--primary">
										<h5 class="card-header bg--primary">@lang('Play Amount')</h5>
										<div class="card-body">
											<div class="form-group">
												<label>@lang('Minimum Invest Amount')</label>
												<div class="input-group mb-3">
													<input type="number" step="any" name="min" min="1" class="form-control" placeholder="@lang('Minimum Invest Amount')" value="{{ getAmount($game->min_limit) }}" required>
													<span class="input-group-text" id="basic-addon2">{{ $general->cur_sym }}</span>
												</div>
											</div>
											<div class="form-group">
												<label>@lang('Maximum Invest Amount')</label>
												<div class="input-group mb-3">
													<input type="number" step="any" name="max" min="1" class="form-control" placeholder="@lang('Maximum Invest Amount')" value="{{ getAmount($game->max_limit) }}" required>
													<span class="input-group-text" id="basic-addon2">{{ $general->cur_sym }}</span>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-7 mb-4">
									<div class="card border--primary">
										<h5 class="card-header bg--primary">@lang('Win Chance Setting')</h5>
										<div class="card-body">
											<div class="row">
												<div class="col-md-12">
													<div class="row">
														<div class="col-md-6">
															<div class="form-group">
																<label>@lang('No Win Chance')</label>
																<div class="input-group mb-3">
																	<input type="number" class="form-control" name="chance[]" value="{{ getAmount(@$game->probable_win[0]) }}" placeholder="Triple Win Chance">
																	<span class="input-group-text">@lang('%')</span>
																</div>
															</div>
														</div>
														<div class="col-md-6">
															<div class="form-group">
																<label>@lang('Single Win Chance') </label>
																<div class="input-group mb-3">
																	<input type="number" class="form-control" name="chance[]" value="{{ getAmount(@$game->probable_win[1]) }}" placeholder="Single Win Chance">
																	<span class="input-group-text">%</span>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="col-md-12">
													<div class="row">
														<div class="col-md-6">
															<div class="form-group">
																<label>@lang('Double Win Chance') </label>
																<div class="input-group mb-3">
																	<input type="number" class="form-control" name="chance[]" value="{{ getAmount(@$game->probable_win[2]) }}" placeholder="Double Win Chance">
																	<span class="input-group-text">@lang('%')</span>
																</div>
															</div>
														</div>
														<div class="col-md-6">
															<div class="form-group">
																<label>@lang('Triple Win Chance')</label>
																<div class="input-group mb-3">
																	<input type="number" class="form-control" name="chance[]" value="{{ getAmount(@$game->probable_win[3]) }}" placeholder="Triple Win Chance">
																	<span class="input-group-text">@lang('%')</span>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-12 mb-4">
									<div class="card border--primary">
										<h5 class="card-header bg--primary">@lang('Win Bonus Setting')</h5>
										<div class="card-body">
											<div class="row">
												<div class="col-md-4">
													<div class="form-group">
														<label>@lang('Single Win Bonus')</label>
														<div class="input-group mb-3">
															<input type="number" class="form-control" name="level[]" value="{{ getAmount($game->level[0]) }}" placeholder="Single Win Bonus">
															<span class="input-group-text">@lang('%')</span>
														</div>
													</div>
												</div>
												<div class="col-md-4">
													<div class="form-group">
														<label>@lang('Double Win Bonus')</label>
														<div class="input-group mb-3">
															<input type="number" class="form-control" name="level[]" value="{{ getAmount($game->level[1]) }}" placeholder="Double Win Bonus">
															<span class="input-group-text">@lang('%')</span>
														</div>
													</div>
												</div>
												<div class="col-md-4">
													<div class="form-group">
														<label>@lang('Triple Win Bonus')</label>
														<div class="input-group mb-3">
															<input type="number" class="form-control" name="level[]" value="{{ getAmount($game->level[2]) }}" placeholder="Triple Win Bonus">
															<span class="input-group-text">@lang('%')</span>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-12">
						<div class="card border--primary mt-3">
							<h5 class="card-header bg--primary">@lang('Game Instruction')</h5>
							<div class="card-body">
								<div class="form-group">
									<textarea rows="8" class="form-control border-radius-5 nicEdit" name="instruction">@php echo $game->instruction @endphp</textarea>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-12 mt-3">
						<button type="submit" class="btn btn--primary w-100 h-45">@lang('Submit')</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
@endsection
@push('breadcrumb-plugins')
<x-back route="{{ route('admin.game.index') }}" />
@endpush
