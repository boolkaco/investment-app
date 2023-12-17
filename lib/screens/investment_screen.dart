import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investment_app/bloc/navigation/navigation_bloc.dart';
import 'package:investment_app/screens/investment_details_screen.dart';
import 'package:investment_app/widgets/app_card.dart';

class InvestmentScreen extends StatefulWidget {
  const InvestmentScreen({super.key});

  @override
  State<InvestmentScreen> createState() => _InvestmentScreenState();
}

class _InvestmentScreenState extends State<InvestmentScreen>
    with AutomaticKeepAliveClientMixin {
  int imageIndex = 1;

  void _toggleDetails(int index) {
    NavigationBloc navigationBloc = BlocProvider.of<NavigationBloc>(context);
    navigationBloc.updateIsNestedRoute(true);

    setState(() {
      imageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: state.isNestedRoute!
              ? InvestmentDetailsScreen(
                  title: 'Header',
                  image: 'assets/images/picture_$imageIndex.png',
                )
              : Column(
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
                          return GestureDetector(
                            onTap: () => _toggleDetails(index + 1),
                            child: AppCard(
                              title: 'Header',
                              image: 'assets/images/picture_${index + 1}.png',
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 12);
                        },
                      ),
                    )
                  ],
                ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
