import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker_cross/file_picker_cross.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../themes.dart';

class SelfButton extends StatefulWidget {

  final String text;
  final VoidCallback? onTap;
  final bool loading;
  final double? width;
  final double? height;

  const SelfButton({
    Key? key,
    required this.text,
    this.onTap,
    this.width,
    this.height = 36,
    this.loading = false,
  }) : super(key: key);

@override
State<SelfButton> createState() => _SelfButtonState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _SelfButtonState extends State<SelfButton> {

  bool _isOver = false;
  Color _color = widgetColor;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) {
        setState(() {
          _color = widgetColorOver;
          _isOver = true;
        });
      },
      onExit: (e) {
        setState(() {
          _color = widgetColor;
          _isOver = false;
        });
      },
      cursor: SystemMouseCursors.click,
      child: (widget.onTap != null)
          ? _buildActiveButtonContainer(context)
          : _buildDisabledButtonContainer(context),
    );
  }

  Widget _buildButtonContainer(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 7000),
      curve: Curves.linearToEaseOut,
      child: Container(
        width: widget.width,
        height: widget.height,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
          border: Border.all(
            // color: (_isOver) ? widgetBorderColorOver : widgetBorderColor,
            color: Colors.transparent
          ),
          color: _color,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            color: (widget.onTap != null) ? buttonColorAct : buttonColorDis,
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _buildActiveButtonContainer(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: _buildButtonContainer(context),
    );
  }

  Widget _buildDisabledButtonContainer(BuildContext context) {
    return _buildButtonContainer(context);
  }
}