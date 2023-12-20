import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:investment_app/utils/theme_notifier.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  final Function() callback;

  const SettingsScreen({super.key, required this.callback});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late AppThemeType appThemeType;

  void _toggleTheme(bool value) {
    Provider.of<ThemeNotifier>(context, listen: false).switchTheme();
    setState(() {
      appThemeType =
          Provider.of<ThemeNotifier>(context, listen: false).currentThemeType;
    });
  }

  void _changeLanguage(String languageCode) {
    context.setLocale(Locale(languageCode));
    widget.callback();
  }

  @override
  void initState() {
    super.initState();
    appThemeType = Provider.of<ThemeNotifier>(context, listen: false).currentThemeType;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            size: 20,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
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
              title: Text(
                'dark_theme',
                style: Theme.of(context).textTheme.headlineMedium,
              ).tr(),
              trailing: Switch(
                value: appThemeType == AppThemeType.dark,
                onChanged: _toggleTheme,
              ),
            ),
            Divider(
              color: Theme.of(context).dividerColor,
            ),
            ListTile(
              title: Text(
                'eng',
                style: Theme.of(context).textTheme.headlineMedium,
              ).tr(),
              trailing: Radio(
                value: 'en',
                groupValue: context.locale.languageCode,
                onChanged: (String? value) => _changeLanguage(value!),
              ),
            ),
            Divider(
              color: Theme.of(context).dividerColor,
            ),
            ListTile(
              title: Text(
                'rus',
                style: Theme.of(context).textTheme.headlineMedium,
              ).tr(),
              trailing: Radio(
                value: 'ru',
                groupValue: context.locale.languageCode,
                onChanged: (String? value) => _changeLanguage(value!),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
