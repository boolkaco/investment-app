import 'package:flutter/material.dart';
import 'package:investment_app/widgets/app_card.dart';
import 'package:investment_app/widgets/buttons/app_button.dart';

class InvestmentDetailsScreen extends StatelessWidget {
  final String title;
  final String image;

  const InvestmentDetailsScreen({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Text(
            title,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          const SizedBox(height: 12),
          AppCard(image: image),
          const SizedBox(height: 20),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat  exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 28),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppButton(
                label: 'To list',
                callback: () {},
                isPrimary: false,
              ),
              const SizedBox(width: 8),
              AppButton(
                label: 'Action',
                callback: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
