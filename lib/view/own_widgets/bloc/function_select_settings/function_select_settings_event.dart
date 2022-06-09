part of 'function_select_settings_bloc.dart';

abstract class FunctionSelectSettingsEvent extends Equatable {
  const FunctionSelectSettingsEvent();
}

class InputValueChanged extends FunctionSelectSettingsEvent {
  final String key;
  final dynamic value;

  const InputValueChanged(this.key, this.value);

  @override
  List<Object?> get props => [key, value];
}

class FunctionChanged extends FunctionSelectSettingsEvent {
  final int function;

  const FunctionChanged(this.function);

  @override
  List<Object?> get props => [function];
}

class Rebuild extends FunctionSelectSettingsEvent {

  const Rebuild();

  @override
  List<Object?> get props => [];
}




