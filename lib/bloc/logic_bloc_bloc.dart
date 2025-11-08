import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'logic_bloc_event.dart';
part 'logic_bloc_state.dart';

class LogicBlocBloc extends Bloc<LogicBlocEvent, LogicBlocState> {
  LogicBlocBloc() : super(LogicBlocInitial()) {
    on<LogicBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
