import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final String title;
  final String image;

  const AppCard({
    super.key,
    this.title = '',
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 131,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: title.isEmpty
          ? null
          : Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                width: 165,
                height: 32,
                margin: const EdgeInsets.only(left: 16, bottom: 8),
                padding: const EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
    );
  }
}
