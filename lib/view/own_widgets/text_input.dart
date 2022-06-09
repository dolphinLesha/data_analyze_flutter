import 'package:flutter/material.dart';

class SelfTextInput extends StatefulWidget {
  final Widget? title;
  final String? initialValue;
  final String? hintText;

  final Type type;

  final void Function(dynamic)? onValueChanged;

  const SelfTextInput({
    Key? key,
    this.title,
    this.initialValue,
    this.hintText,
    this.onValueChanged,
    this.type = String,
  }) : super(key: key);

  @override
  State<SelfTextInput> createState() => _SelfTextInputState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _SelfTextInputState extends State<SelfTextInput> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController(text: widget.initialValue == null ? '' : widget.initialValue!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Padding(
              padding: const EdgeInsets.only(left: 10),
              child: widget.title!),
        Container(
          alignment: Alignment.centerLeft,
          height: 40,
          decoration: BoxDecoration(
              // color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                width: 1,
                color: const Color(0x22555555),
              )),
          child: TextField(
            // textAlign: TextAlign.left,
            onChanged: (value) {
              if(widget.onValueChanged != null) {
                dynamic val = value;
                if (widget.type == int){
                  val = int.tryParse(value) ?? 0;
                } else if(widget.type == double){
                  val = double.tryParse(value) ?? 0;
                }
                widget.onValueChanged!(val);
              }
            },
            textAlignVertical: TextAlignVertical.top,
            controller: _textEditingController,
            decoration: InputDecoration(
              hintStyle: const TextStyle(
                color: Color(0xFFAAAAAA),
              ),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 15),
              hintText: widget.hintText,
            ),
          ),
        ),
      ],
    );
  }
}
