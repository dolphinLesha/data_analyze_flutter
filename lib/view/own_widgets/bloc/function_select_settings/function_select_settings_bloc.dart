import 'dart:async';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:data_analyze/data/functions.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

part 'function_select_settings_event.dart';
part 'function_select_settings_state.dart';

class FunctionSelectSettingsBloc extends Bloc<FunctionSelectSettingsEvent, FunctionSelectSettingsState> {

  final int ind;

  FunctionSelectSettingsBloc({
    FunctionSelectSettingsState? initialState,
    required this.ind,
  }) : super(initialState ?? FunctionSelectSettingsState(dictValues: FunctionDefaultValues().defaults[0].dictValues))
  {
  }

  @override
  Stream<FunctionSelectSettingsState> mapEventToState(FunctionSelectSettingsEvent event) async* {
    if (event is InputValueChanged) {
      yield* _inputValueChanged(event);
    } else if (event is FunctionChanged) {
      yield* _functionChanged(event);
    } else if (event is Rebuild) {
      yield* _rebuild(event);
    }
  }

  Stream<FunctionSelectSettingsState> _inputValueChanged(InputValueChanged event) async* {
    Map<String, dynamic> temp = state.dictValues ?? {};
    // if (!temp.containsKey(event.key)){
    temp[event.key] = event.value;
    // }
    yield state.copyWith(dictValues: temp, rebuild: !state.rebuild);
  }

  Stream<FunctionSelectSettingsState> _rebuild(Rebuild event) async* {
    yield state.copyWith(rebuild: !state.rebuild);
  }

  Stream<FunctionSelectSettingsState> _functionChanged(FunctionChanged event) async* {
    print("fun change" + ind.toString());
    yield state.copyWith(dictValues: FunctionDefaultValues().defaults[event.function].dictValues, function: event.function);
  }

}
