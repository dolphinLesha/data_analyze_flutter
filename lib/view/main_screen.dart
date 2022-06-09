import 'dart:ui';

import 'package:data_analyze/view/tasks/task1_screen.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker_cross/file_picker_cross.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:data_analyze/view/extensions.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'own_widgets/function_drop_input.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  late List<Widget> menuButtons;

  @override
  void initState() {
    menuButtons = [];
    for (int i = 0; i < 2; i++) {
      menuButtons.add(MenuButton(
        text: (i+1).toString(),
        onTap: () {},
      ));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 0,
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xff002f45),
            ),
            height: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      // color: Colors.white,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    alignment: Alignment.centerLeft,
                    height: 55,
                    child: const Text(
                      'DataAnalyze',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  ...menuButtons,
                ]
                  //   .separate(
                  // const SizedBox(
                  //   width: 5,
                  // ),
                // ),
              ),
            ),
          ),
        ),
        const Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: Task1Screen(),
        )
      ],
    );
  }
// @override
// Widget build(BuildContext context) {
//   return MaterialApp(
//     onUnknownRoute: (settings) => MaterialPageRoute(
//         builder: (context) {
//           return const Center(
//             child: Text("unknownff"),
//           );
//         }
//     ),
//     onGenerateRoute: (settings) {
//       if (settings.name == 'home') {
//         return MaterialPageRoute(
//           settings: settings,
//           builder: (context) => const Center(
//             child: Text("home"),
//           ),
//         );
//       }
//       // Тут будут описание других роутов
//     },
//   );
// }
}

class MenuButton extends StatefulWidget {
  final String text;
  final VoidCallback? onTap;

  const MenuButton({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MenuButtonState extends State<MenuButton> {
  double _size = 50.0;
  bool _large = true;

  void _updateSize() {
    setState(() {
      _size = _large ? 55.0 : 50.0;
      _large = !_large;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      curve: Curves.easeIn,
      duration: const Duration(milliseconds: 100),
      child: Container(
        height: _size,
        width: _size,
        padding: const EdgeInsets.all(2),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (e) {
            print(widget.text);

            _updateSize();
          },
          onExit: (e){
            _updateSize();
          },
          child: GestureDetector(
            onTap: () {
              if (widget.onTap != null) widget.onTap!();
            },
            child: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Color(0xBBFFFFFF),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Text(
                widget.text,
                style: const TextStyle(
                  color: Color(0xff3b3b3b),
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
