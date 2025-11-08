part of 'logic_bloc_bloc.dart';

sealed class LogicBlocState extends Equatable {
  const LogicBlocState();
  
  @override
  List<Object> get props => [];
}

final class LogicBlocInitial extends LogicBlocState {}
