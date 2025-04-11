import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({Key? key, required this.text, required this.onSelect, required this.isSelected}) : super(key: key);

  final String text;
  final Function(String) onSelect;
  final bool isSelected;

  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  void _onTap() {
    widget.onSelect(widget.text);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: widget.isSelected ? Color(0xff848B95) : Color(0xff25223C),
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: Color(0xff3D3D3F), width: 2.0),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Text(
                widget.text,
                style: TextStyle(
                  color: widget.isSelected ? Color(0xff25223C) : Color(0xffdddddd),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
