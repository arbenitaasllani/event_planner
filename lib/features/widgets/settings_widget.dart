import 'package:flutter/material.dart';

class SettingsWidget extends StatefulWidget {
  final String iconUrl;
  final String title;
  final bool initialChecked;

  const SettingsWidget({
    super.key,
    required this.title,
    required this.initialChecked,
    required this.iconUrl,
  });

  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  late bool checked;

  @override
  void initState() {
    super.initState();
    checked = widget.initialChecked;
  }

  void toggleChecked() {
    setState(() {
      checked = !checked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleChecked,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        child: Row(
          children: [
            Image.asset(
              widget.iconUrl,
              width: 25,
              height: 25,
              color: Color(0xffF35D43),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 19.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Image.asset(
              width: 50,
              height: 50,
              checked ? "assets/icons/toggle_on.png" : "assets/icons/toggle_off.png",
              // color: const Color(0xffF35D43),
            )
          ],
        ),
      ),
    );
  }
}
