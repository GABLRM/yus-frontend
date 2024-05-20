import 'package:flutter/material.dart';
import 'package:yus_dev/widgets/form/settings_form_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Yu's",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.yellow[200],
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: SettingsForm(),
            ),
          ),
        ),
      ),
    );
  }
}
