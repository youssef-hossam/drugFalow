part of 'slider_cubit.dart';

@immutable
sealed class SliderState {}

final class SliderInitial extends SliderState {}

class SliderLoading extends SliderState{}



class SliderError extends SliderState{
  final String message;

  SliderError({required this.message});
}



class SliderSuccess extends SliderState {
  final SlidersResponse slidersResponse;

  SliderSuccess({required this.slidersResponse});
}

