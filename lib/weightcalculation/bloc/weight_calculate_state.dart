part of 'weight_calculate_bloc.dart';

abstract class WeightCalculateState extends Equatable {
  const WeightCalculateState();
  
  @override
  List<Object> get props => [];
}

class WeightCalculateInitial extends WeightCalculateState {}

class ChangeWidgetSuccess extends WeightCalculateState{
  final bool toggle;
  const ChangeWidgetSuccess({required this.toggle});
  @override
  List<Object> get props => [toggle];
}
