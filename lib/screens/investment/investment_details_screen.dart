import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investment_app/bloc/favorite/favorite_bloc.dart';
import 'package:investment_app/models/post_model.dart';
import 'package:investment_app/widgets/app_card.dart';
import 'package:investment_app/widgets/buttons/app_button.dart';

class InvestmentDetailsScreen extends StatefulWidget {
  final PostModel post;

  const InvestmentDetailsScreen({
    super.key,
    required this.post,
  });

  @override
  State<InvestmentDetailsScreen> createState() => _InvestmentDetailsScreenState();
}

class _InvestmentDetailsScreenState extends State<InvestmentDetailsScreen> {
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
