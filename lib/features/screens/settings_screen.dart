import 'package:event_planner/features/widgets/settings_widget.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0xffFFFFFF),
        title: Text("Settings"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15.0),
        child: Column(
          children: [
           SettingsWidget(title: "Notifications", initialChecked: false, iconUrl: "assets/icons/notifications.png",),
           SettingsWidget(title: "Messages", initialChecked: true, iconUrl: "assets/icons/message.png",),
           SettingsWidget(title: "Sound & Vibrate", initialChecked: true, iconUrl: "assets/icons/sound.png",),
           SettingsWidget(title: "Linked Events", initialChecked: false, iconUrl: "assets/icons/linked.png",),
           SettingsWidget(title: "Recommendations", initialChecked: false, iconUrl: "assets/icons/recommended.png",),
           SettingsWidget(title: "Payments", initialChecked: true, iconUrl: "assets/icons/payments.png",),
          ],
        ),
      ),
    );
  }
}
