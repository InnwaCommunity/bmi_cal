
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'weight_calculate_event.dart';
part 'weight_calculate_state.dart';

class WeightCalculateBloc extends Bloc<WeightCalculateEvent, WeightCalculateState> {
  WeightCalculateBloc() : super(WeightCalculateInitial()) {
    on<WeightCalculateEvent>((event, emit) {});
    on<ChangeWidgetEvent>((event, emit) {
      bool toggle=event.toggle;
      emit(ChangeWidgetSuccess(toggle: !toggle));
    },);
  }
}
