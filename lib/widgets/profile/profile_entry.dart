import 'package:flutter/material.dart';
import 'package:investment_app/theme/app_colors.dart';

class ProfileEntry extends StatelessWidget {
  final IconData icon;
  final String title;

  const ProfileEntry({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(fontWeight: FontWeight.w500),
      ),
      leading: Icon(
        icon,
        color: AppColors.black,
        size: 20,
      ),
      trailing: const Icon(
        Icons.keyboard_arrow_right,
        size: 20,
        color: AppColors.black,
      ),
    );
  }
}
