part of 'strategy_bloc.dart';

class StrategyState extends Equatable {
  final List<PostModel> allPosts;
  final List<PostModel> favoritePosts;
  final List<PostModel> posts;
  final String searchTarget;

  const StrategyState({
    required this.allPosts,
    this.favoritePosts = const [],
    this.posts = const [],
    this.searchTarget = '',
  });

  @override
  List<Object?> get props => [
    allPosts,
    favoritePosts,
    posts,
    searchTarget,
  ];

  StrategyState copyWith({
    List<PostModel>? allPosts = const [],
    List<PostModel>? favoritePosts = const [],
    List<PostModel>? posts = const [],
    String? searchTarget = '',
  }) {
    return StrategyState(
      allPosts: allPosts ?? this.allPosts,
      favoritePosts: favoritePosts ?? this.favoritePosts,
      posts: posts ?? this.posts,
      searchTarget: searchTarget ?? this.searchTarget,
    );
  }
}