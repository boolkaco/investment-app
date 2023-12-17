import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investment_app/bloc/favorite/favorite_bloc.dart';
import 'package:investment_app/models/post_model.dart';
import 'package:investment_app/widgets/app_card.dart';
import 'package:investment_app/widgets/buttons/app_button.dart';

class PostDetailsScreen extends StatefulWidget {
  final PostModel post;
  final bool isFavorite;

  const PostDetailsScreen({
    super.key,
    required this.post,
    this.isFavorite = false,
  });

  @override
  State<PostDetailsScreen> createState() =>
      _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {
  void _addToFavorite() {
    FavoriteBloc favoriteBloc = BlocProvider.of<FavoriteBloc>(context);
    favoriteBloc.addToFavorite(widget.post);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Text(
            widget.post.title,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          AppCard(
            image: widget.post.imageUrl,
            title: widget.post.title,
          ),
          const SizedBox(height: 20),
          Text(
            widget.post.content,
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 28),
          if (!widget.isFavorite)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppButton(
                  label: 'To favorite',
                  callback: _addToFavorite,
                ),
              ],
            )
        ],
      ),
    );
  }
}
