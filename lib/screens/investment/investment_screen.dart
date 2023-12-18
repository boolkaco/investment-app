import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investment_app/bloc/navigation/navigation_bloc.dart';
import 'package:investment_app/models/post_model.dart';
import 'package:investment_app/screens/post_details_screen.dart';
import 'package:investment_app/widgets/app_card.dart';
import 'package:investment_app/consts/posts.dart';

class InvestmentScreen extends StatefulWidget {
  const InvestmentScreen({super.key});

  @override
  State<InvestmentScreen> createState() => _InvestmentScreenState();
}

class _InvestmentScreenState extends State<InvestmentScreen>
    with AutomaticKeepAliveClientMixin {
  int postIndex = 0;
  List<PostModel> posts = Posts.items;

  void _toggleDetails(int index) {
    NavigationBloc navigationBloc = BlocProvider.of<NavigationBloc>(context);
    navigationBloc.updateIsNestedRoute(true);

    setState(() {
      postIndex = index;
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
              ? PostDetailsScreen(
                  post: posts[postIndex],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    Text(
                      tr('investment'),
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: ListView.separated(
                        itemCount: posts.length,
                        itemBuilder: (context, int index) {
                          return GestureDetector(
                            onTap: () => _toggleDetails(index),
                            child: AppCard(
                              title: posts[index].title,
                              image: posts[index].imageUrl,
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
