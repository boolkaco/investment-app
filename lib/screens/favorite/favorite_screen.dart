import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investment_app/bloc/favorite/strategy_bloc.dart';
import 'package:investment_app/bloc/navigation/navigation_bloc.dart';
import 'package:investment_app/models/post_model.dart';
import 'package:investment_app/screens/post_details_screen.dart';
import 'package:investment_app/widgets/app_card.dart';
import 'package:investment_app/consts/posts.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen>
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
    return BlocBuilder<StrategyBloc, StrategyState>(
      builder: (context, strategyState) {
        final posts = strategyState.searchTarget.isEmpty
            ? strategyState.favoritePosts
            : strategyState.posts;
        if (posts.isNotEmpty) {
          return BlocBuilder<NavigationBloc, NavigationState>(
            builder: (context, navState) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: navState.isNestedRoute!
                    ? PostDetailsScreen(
                        post: posts[postIndex],
                        isFavorite: true,
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 12),
                          Text(
                            tr('favorite'),
                            textAlign: TextAlign.left,
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
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
                                    isFavorite: true,
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
        } else {
          return Center(
            child: Text(
              context.tr('empty_favorite'),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          );
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
