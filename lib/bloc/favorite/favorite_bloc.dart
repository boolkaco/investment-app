import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:investment_app/models/post_model.dart';

part 'favorite_state.dart';

class FavoriteBloc extends Cubit<FavoriteState> {
  FavoriteBloc() : super(const FavoriteState());

  void addToFavorite(PostModel post) {
    final posts = [...state.posts, post];
    emit(state.copyWith(
      posts: posts,
    ));
  }
}