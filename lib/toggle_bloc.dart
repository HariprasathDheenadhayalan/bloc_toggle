import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ToggleEvent {}

class ToggleSwitchEvent extends ToggleEvent {}

class ToggleBloc extends Bloc<ToggleEvent, bool> {
  ToggleBloc() : super(false) {
    on<ToggleSwitchEvent>((event, emit) {
      emit(!state);
    });
  }
}
