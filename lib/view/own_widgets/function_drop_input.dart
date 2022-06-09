import 'package:data_analyze/view/own_widgets/bloc/function_select_settings/function_select_settings_bloc.dart';
import 'package:data_analyze/view/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class FunctionSelect extends StatefulWidget {
  final FunctionSelectSettingsBloc bloc;

  const FunctionSelect({Key? key, required this.bloc}) : super(key: key);

  @override
  State<FunctionSelect> createState() => _FunctionSelectState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _FunctionSelectState extends State<FunctionSelect> {

  Map<String, int> functions = {'Линия тренда' : 0, 'Экспонента' : 1,
  'Рандом' : 2, 'Мой рандом' : 3,
    'Гармоника' : 4, 'Полигармоника' : 5, };

  String dropdownValue = 'Линия тренда';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      // decoration: BoxDecoration(
      //   // color: Colors.white,
      //   borderRadius: const BorderRadius.all(Radius.circular(10)),
      //   border: Border.all(
      //     width: 1,
      //     color: const Color(0x22555555),
      //   )
      // ),
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
        underline: Container(
          height: 1,
          color: buttonColorAct,
        ),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
          widget.bloc.add(FunctionChanged(functions[newValue]!));
        },
        items: functions.keys.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Container(
              height: 20,
              child: Text(value),
            ),
          );
        }).toList(),
      ),
    );
  }
}
