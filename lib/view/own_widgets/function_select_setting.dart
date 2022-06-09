import 'package:data_analyze/data/functions.dart';
import 'package:data_analyze/view/extensions.dart';
import 'package:data_analyze/view/own_widgets/bloc/function_select_settings/function_select_settings_bloc.dart';
import 'package:data_analyze/view/own_widgets/function_drop_input.dart';
import 'package:data_analyze/view/own_widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FunctionSelectSetting extends StatefulWidget {
  final Widget? title;
  final FunctionSelectSettingsBloc bloc;

  const FunctionSelectSetting({
    Key? key,
    required this.bloc,
    this.title,
  }) : super(key: key);

  @override
  State<FunctionSelectSetting> createState() => _FunctionSelectSettingState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _FunctionSelectSettingState extends State<FunctionSelectSetting> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
          // maxHeight: 300,
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (widget.title != null)
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: widget.title!,
            ),
          FunctionSelect(bloc: widget.bloc),
          FunctionWidget(bloc: widget.bloc),
        ],
      ),
    );
  }
}

class FunctionWidget extends StatelessWidget {
  final FunctionSelectSettingsBloc bloc;

  FunctionWidget({
    Key? key,
    required this.bloc,
  }) : super(key: key) {
    funcSettings = [
      TrendWidget(bloc: bloc),
      ExponentWidget(bloc: bloc),
      RandomWidget(bloc: bloc),
      RandomOwnWidget(bloc: bloc),
      HarmonicWidget(bloc: bloc),
      PolyHarmonicWidget(bloc: bloc),
    ];
  }

  late List<Widget> funcSettings;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FunctionSelectSettingsBloc, FunctionSelectSettingsState>(
        bloc: bloc,
        builder: (context, state) {
          return funcSettings[state.function];
        });
  }
}

class TrendWidget extends StatelessWidget {
  final FunctionSelectSettingsBloc bloc;

  const TrendWidget({
    required this.bloc,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
          // maxHeight: 200,
          ),
      child: Column(
        children: <Widget>[
          for (int i = 0; i < TrendDefaultValues().dictValues.values.length; i++)
            SelfTextInput(
              type: i == 0 ? int : double,
              title: Text(
                TrendDefaultValues().dictValues.keys.toList()[i],
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF999999),
                ),
              ),
              onValueChanged: (value) {
                bloc.add(InputValueChanged(TrendDefaultValues().dictValues.keys.toList()[i], value));
              },
              hintText: TrendDefaultValues().dictValues.values.toList()[i].toString(),
            ),
        ].separate(const SizedBox(
          height: 8,
        )),
      ),
    );
  }
}

class ExponentWidget extends StatelessWidget {
  final FunctionSelectSettingsBloc bloc;

  const ExponentWidget({
    required this.bloc,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
          // maxHeight: 200,
          ),
      child: Column(
        children: <Widget>[
          for (int i = 0; i < ExponentDefaultValues().dictValues.values.length; i++)
            SelfTextInput(
              type: i == 0 ? int : double,
              title: Text(
                ExponentDefaultValues().dictValues.keys.toList()[i],
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF999999),
                ),
              ),
              onValueChanged: (value) {
                bloc.add(InputValueChanged(ExponentDefaultValues().dictValues.keys.toList()[i], value));
              },
              hintText: ExponentDefaultValues().dictValues.values.toList()[i].toString(),
            ),
        ].separate(const SizedBox(
          height: 8,
        )),
      ),
    );
  }
}

class RandomWidget extends StatelessWidget {
  final FunctionSelectSettingsBloc bloc;

  const RandomWidget({
    required this.bloc,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
          // maxHeight: 200,
          ),
      child: Column(
        children: <Widget>[
          for (int i = 0; i < RandomDefaultValues().dictValues.values.length; i++)
            SelfTextInput(
              type: i == 0 ? int : double,
              title: Text(
                RandomDefaultValues().dictValues.keys.toList()[i],
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF999999),
                ),
              ),
              onValueChanged: (value) {
                bloc.add(InputValueChanged(RandomDefaultValues().dictValues.keys.toList()[i], value));
              },
              hintText: RandomDefaultValues().dictValues.values.toList()[i].toString(),
            ),
        ].separate(const SizedBox(
          height: 8,
        )),
      ),
    );
  }
}

class RandomOwnWidget extends StatelessWidget {
  final FunctionSelectSettingsBloc bloc;

  const RandomOwnWidget({
    required this.bloc,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
          // maxHeight: 200,
          ),
      child: Column(
        children: <Widget>[
          for (int i = 0; i < RandomOwnDefaultValues().dictValues.values.length; i++)
            SelfTextInput(
              type: i == 0 ? int : double,
              title: Text(
                RandomOwnDefaultValues().dictValues.keys.toList()[i],
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF999999),
                ),
              ),
              onValueChanged: (value) {
                bloc.add(InputValueChanged(RandomOwnDefaultValues().dictValues.keys.toList()[i], value));
              },
              hintText: RandomOwnDefaultValues().dictValues.values.toList()[i].toString(),
            ),
        ].separate(const SizedBox(
          height: 8,
        )),
      ),
    );
  }
}

class HarmonicWidget extends StatelessWidget {
  final FunctionSelectSettingsBloc bloc;

  const HarmonicWidget({
    required this.bloc,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        // maxHeight: 200,
      ),
      child: Column(
        children: <Widget>[
          for (int i = 0; i < HarmonicDefaultValues().dictValues.values.length; i++)
            SelfTextInput(
              type: i == 0 ? int : double,
              title: Text(
                HarmonicDefaultValues().dictValues.keys.toList()[i],
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF999999),
                ),
              ),
              onValueChanged: (value) {
                bloc.add(InputValueChanged(HarmonicDefaultValues().dictValues.keys.toList()[i], value));
              },
              hintText: HarmonicDefaultValues().dictValues.values.toList()[i].toString(),
            ),
        ].separate(const SizedBox(
          height: 8,
        )),
      ),
    );
  }
}

class PolyHarmonicWidget extends StatelessWidget {
  final FunctionSelectSettingsBloc bloc;

  const PolyHarmonicWidget({
    required this.bloc,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        // maxHeight: 200,
      ),
      child: Column(
        children: <Widget>[
          for (int i = 0; i < PolyHarmonicDefaultValues().dictValues.values.length; i++)
            SelfTextInput(
              type: i == 0 ? int : double,
              title: Text(
                PolyHarmonicDefaultValues().dictValues.keys.toList()[i],
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF999999),
                ),
              ),
              onValueChanged: (value) {
                bloc.add(InputValueChanged(PolyHarmonicDefaultValues().dictValues.keys.toList()[i], value));
              },
              hintText: PolyHarmonicDefaultValues().dictValues.values.toList()[i].toString(),
            ),
        ].separate(const SizedBox(
          height: 8,
        )),
      ),
    );
  }
}
