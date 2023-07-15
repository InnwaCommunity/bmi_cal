part of 'weight_calculate_bloc.dart';

abstract class WeightCalculateEvent extends Equatable {
  const WeightCalculateEvent();

  @override
  List<Object> get props => [];
}

class ChangeWidgetEvent extends WeightCalculateEvent{
  final bool toggle;
  const ChangeWidgetEvent({required this.toggle});
}
