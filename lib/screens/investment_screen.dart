import 'package:flutter/material.dart';
import 'package:investment_app/widgets/app_card.dart';

class InvestmentScreen extends StatefulWidget {
  const InvestmentScreen({super.key});

  @override
  State<InvestmentScreen> createState() => _InvestmentScreenState();
}

class _InvestmentScreenState extends State<InvestmentScreen> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Text(
            'Investment',
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.separated(
              itemCount: 4,
              itemBuilder: (context, int index) {
                return AppCard(image: 'assets/images/picture_${index + 1}.png');
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 12);
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
