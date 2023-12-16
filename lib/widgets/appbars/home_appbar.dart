import 'package:flutter/material.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 20,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/person.png'),
                radius: 15,
              ),
              const SizedBox(width: 8),
              Text(
                'Josh Kameron',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
              )
            ],
          ),
          const Row(
            children: [
              Icon(
                Icons.search,
                size: 20,
              ),
              SizedBox(width: 15),
              Icon(
                Icons.info_outline_rounded,
                size: 20,
              ),
            ],
          )
        ],
      ),
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
