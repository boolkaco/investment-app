import 'package:flutter/material.dart';

class ProfileEntry extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function() callback;

  const ProfileEntry({
    super.key,
    required this.icon,
    required this.title,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: callback,
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
        size: 20,
        color: Theme.of(context).iconTheme.color,
      ),
      trailing: Icon(
        Icons.keyboard_arrow_right,
        size: 20,
        color: Theme.of(context).iconTheme.color,
      ),
    );
  }
}
