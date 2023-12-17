part of 'favorite_bloc.dart';

class FavoriteState extends Equatable {
  final List<PostModel> posts;

  const FavoriteState({this.posts = const []});

  @override
  List<Object?> get props => [
    posts,
  ];

  FavoriteState copyWith({
    List<PostModel>? posts = const [],
  }) {
    return FavoriteState(
      posts: posts ?? this.posts,
    );
  }
}