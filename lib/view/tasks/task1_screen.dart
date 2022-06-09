import 'package:data_analyze/control/graphic.dart';
import 'package:data_analyze/data/functions.dart';
import 'package:data_analyze/view/extensions.dart';
import 'package:data_analyze/view/own_widgets/bloc/function_select_settings/function_select_settings_bloc.dart';
import 'package:data_analyze/view/own_widgets/function_drop_input.dart';
import 'package:data_analyze/view/own_widgets/function_select_setting.dart';
import 'package:data_analyze/view/own_widgets/self_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Task1Screen extends StatefulWidget {
  const Task1Screen({Key? key}) : super(key: key);

  @override
  State<Task1Screen> createState() => _Task1ScreenState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _Task1ScreenState extends State<Task1Screen> {
  late FunctionSelectSettingsBloc _funcBloc1;
  late FunctionSelectSettingsBloc _funcBloc2;
  late FunctionSelectSettingsBloc _funcBloc3;
  late FunctionSelectSettingsBloc _funcBloc4;

  late ScrollController _scrollController;

  @override
  void initState() {
    _funcBloc1 = FunctionSelectSettingsBloc(ind: 1);
    _funcBloc2 = FunctionSelectSettingsBloc(ind: 2);
    _funcBloc3 = FunctionSelectSettingsBloc(ind: 3);
    _funcBloc4 = FunctionSelectSettingsBloc(ind: 4);
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FunctionSelectSettingsBloc>.value(value: _funcBloc1),
        BlocProvider<FunctionSelectSettingsBloc>.value(value: _funcBloc2),
        BlocProvider<FunctionSelectSettingsBloc>.value(value: _funcBloc3),
        BlocProvider<FunctionSelectSettingsBloc>.value(value: _funcBloc4),
      ],
      child: Row(
        children: [
          Flexible(
            flex: 0,
            child: Container(
              width: 250,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: const BoxDecoration(
                  // color: Colors.black26,
                  ),
              child: Column(
                children: [
                  Flexible(
                    flex: 0,
                    child: Container(
                      height: 80,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SelfButton(
                        text: 'Построить графики',
                        onTap: () {},
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Scrollbar(
                        controller: _scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            FunctionSelectSetting(
                              title: const Text(
                                "Параметры первого графика",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF999999),
                                ),
                              ),
                              bloc: _funcBloc1,
                            ),
                            FunctionSelectSetting(
                              title: const Text(
                                "Параметры второго графика",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF999999),
                                ),
                              ),
                              bloc: _funcBloc2,
                            ),
                            FunctionSelectSetting(
                              title: const Text(
                                "Параметры третьего графика",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF999999),
                                ),
                              ),
                              bloc: _funcBloc3,
                            ),
                            FunctionSelectSetting(
                              title: const Text(
                                "Параметры четвертого графика",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF999999),
                                ),
                              ),
                              bloc: _funcBloc4,
                            ),
                            const SizedBox(height: 30,),
                          ].separate(
                            const SizedBox(
                              height: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const VerticalDivider(
            width: 2,
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    children: [
                      BlocBuilder<FunctionSelectSettingsBloc, FunctionSelectSettingsState>(
                          bloc: _funcBloc1,
                          buildWhen: (p, n) => p.rebuild != n.rebuild,
                          builder: (context, state) {
                            print("FUNCTION");
                            print(state.function);
                            print("dictValues");
                            print(state.dictValues);
                            return Container(
                              width: 400,
                              height: 300,
                              child: Graphic(Functions().functions[state.function].build(state.dictValues)).chart,
                            );
                          }),
                      BlocBuilder<FunctionSelectSettingsBloc, FunctionSelectSettingsState>(
                          bloc: _funcBloc3,
                          buildWhen: (p, n) => p.rebuild != n.rebuild,
                          builder: (context, state) {
                            print("FUNCTION");
                            print(state.function);
                            print("dictValues");
                            print(state.dictValues);
                            return Container(
                              width: 400,
                              height: 300,
                              child: Graphic(Functions().functions[state.function].build(state.dictValues)).chart,
                            );
                          }),
                    ],
                  ),
                  Column(
                    children: [
                      BlocBuilder<FunctionSelectSettingsBloc, FunctionSelectSettingsState>(
                          bloc: _funcBloc2,
                          buildWhen: (p, n) => p.rebuild != n.rebuild,
                          builder: (context, state) {
                            print("FUNCTION");
                            print(state.function);
                            print("dictValues");
                            print(state.dictValues);
                            return Container(
                              width: 400,
                              height: 300,
                              child: Graphic(Functions().functions[state.function].build(state.dictValues)).chart,
                            );
                          }),
                      BlocBuilder<FunctionSelectSettingsBloc, FunctionSelectSettingsState>(
                          bloc: _funcBloc4,
                          buildWhen: (p, n) => p.rebuild != n.rebuild,
                          builder: (context, state) {
                            print("FUNCTION");
                            print(state.function);
                            print("dictValues");
                            print(state.dictValues);
                            return Container(
                              width: 400,
                              height: 300,
                              child: Graphic(Functions().functions[state.function].build(state.dictValues)).chart,
                            );
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
