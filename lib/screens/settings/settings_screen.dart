import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final Function() callback;

  const SettingsScreen({super.key, required this.callback});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkTheme = false;

  void _toggleTheme(bool value) {
    setState(() {
      isDarkTheme = value;
    });
  }

  void _changeLanguage(String languageCode) {
    context.setLocale(Locale(languageCode));
    widget.callback();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tr('settings'),
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(fontSize: 22),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            ListTile(
              title: const Text('dark_theme').tr(),
              trailing: Switch(
                value: isDarkTheme,
                onChanged: _toggleTheme,
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text('eng').tr(),
              trailing: Radio(
                value: 'en',
                groupValue: context.locale.languageCode,
                onChanged: (String? value) => _changeLanguage(value!),
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text('rus').tr(),
              trailing: Radio(
                value: 'ru',
                groupValue: context.locale.languageCode,
                onChanged: (String? value) => _changeLanguage(value!),
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
