import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investment_app/bloc/navigation/navigation_bloc.dart';
import 'package:investment_app/bloc/profile/profile_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:investment_app/router/app_routes.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  final bool isProfile;

  const HomeAppbar({super.key, this.isProfile = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 20,
      title: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          if (state.isNestedRoute!) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    NavigationBloc navigationBloc =
                        BlocProvider.of<NavigationBloc>(context);
                    navigationBloc.updateIsNestedRoute(false);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 20,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
                if (state.isEditProfile!)
                  Text(
                    tr('user_profile'),
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontSize: 22),
                  ),
                if (state.isEditProfile!)
                  GestureDetector(
                    onTap: () {
                      try {
                        if (Platform.isAndroid) {
                          SystemNavigator.pop();
                        } else if (Platform.isIOS) {
                          exit(0);
                        }
                      } catch (err) {
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.onboarding,
                        );
                      }
                    },
                    child: Icon(
                      Icons.exit_to_app,
                      size: 20,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  )
                else
                  Icon(
                    Icons.share,
                    size: 20,
                    color: Theme.of(context).iconTheme.color,
                  ),
              ],
            );
          } else {
            if (isProfile) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    tr('user_profile'),
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              );
            } else {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage('assets/images/person.png'),
                        radius: 15,
                      ),
                      const SizedBox(width: 8),
                      BlocBuilder<ProfileBloc, ProfileState>(
                        builder: (context, profileState) {
                          if (profileState.profileModel != null) {
                            return Text(
                              '${profileState.profileModel!.name} ${profileState.profileModel!.surname}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            );
                          } else {
                            return Container();
                          }
                        },
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.search,
                        size: 20,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      const SizedBox(width: 15),
                      Icon(
                        Icons.info_outline_rounded,
                        size: 20,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ],
                  )
                ],
              );
            }
          }
        },
      ),
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
