part of 'function_select_settings_bloc.dart';

class FunctionSelectSettingsState extends Equatable {
  final Map<String, dynamic>? dictValues;
  final int function;
  final bool rebuild;

  const FunctionSelectSettingsState({
    this.dictValues,
    this.function=0,
    this.rebuild=false,
  });

  FunctionSelectSettingsState copyWith({
    Map<String, dynamic>? dictValues,
    int? function,
    bool? rebuild,
  }) {
    return FunctionSelectSettingsState(
      dictValues: dictValues ?? this.dictValues,
      function: function ?? this.function,
      rebuild: rebuild ?? this.rebuild,
    );
  }

  @override
  List<Object?> get props => [
    dictValues,
    function,
    rebuild,
  ];
}
