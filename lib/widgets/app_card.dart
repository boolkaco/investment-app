import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final String image;

  const AppCard({super.key, required this.image});

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
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          width: 165,
          height: 32,
          margin: const EdgeInsets.only(left: 16, bottom: 8),
          padding: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7)
          ),
          child: Text(
            'Your Text Here',
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
