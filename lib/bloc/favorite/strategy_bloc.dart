import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:investment_app/consts/posts.dart';
import 'package:investment_app/models/post_model.dart';

part 'strategy_state.dart';

class StrategyBloc extends Cubit<StrategyState> {
  StrategyBloc() : super(StrategyState(allPosts: Posts.items));

  void addToFavorite(PostModel post) {
    final posts = [...state.favoritePosts, post];
    emit(state.copyWith(
      favoritePosts: posts,
      allPosts: state.allPosts,
    ));
  }

  void onSearch(String value, {bool isFavorite = false}) {
    final targetList = isFavorite ? state.favoritePosts : state.allPosts;
    final filteredPosts = targetList.where((post) {
      return post.title.toLowerCase().contains(value.toLowerCase());
    }).toList();

    emit(state.copyWith(
      posts: filteredPosts,
      searchTarget: value,
      favoritePosts: state.favoritePosts,
      allPosts: state.allPosts,
    ));
  }

  void clearSearchTarget() {
    emit(state.copyWith(
      posts: [],
      searchTarget: '',
      favoritePosts: state.favoritePosts,
      allPosts: state.allPosts,
    ));
  }
}