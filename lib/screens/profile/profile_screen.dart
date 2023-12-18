import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investment_app/bloc/navigation/navigation_bloc.dart';
import 'package:investment_app/bloc/profile/profile_bloc.dart';
import 'package:investment_app/screens/profile/edit_profile_screen.dart';
import 'package:investment_app/screens/settings/settings_screen.dart';
import 'package:investment_app/widgets/profile/profile_entry.dart';

class ProfileScreen extends StatefulWidget {
  final Function() callback;

  const ProfileScreen({super.key, required this.callback});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          if (state.isNestedRoute!) {
            return EditProfileScreen();
          } else {
            return Column(
              children: [
                BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, profileState) {
                    if (profileState.profileModel != null) {
                      return ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        leading: const SizedBox(
                          width: 50,
                          height: 50,
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                              'assets/images/person.png',
                            ),
                          ),
                        ),
                        title: Text(
                          '${profileState.profileModel!.name} ${profileState.profileModel!.surname}',
                          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          profileState.profileModel!.phone,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.edit,
                            size: 22,
                          ),
                          onPressed: () {
                            NavigationBloc navigationBloc =
                            BlocProvider.of<NavigationBloc>(context);
                            navigationBloc.updateIsNestedRoute(
                              true,
                              isEditProfile: true,
                            );
                          },
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
                const SizedBox(height: 32),
                Expanded(
                  child: ListView(
                    children: [
                      ProfileEntry(
                        icon: Icons.person,
                        title: tr('user_profile'),
                        callback: () {},
                      ),
                      ProfileEntry(
                        icon: Icons.settings,
                        title: tr('settings'),
                        callback: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SettingsScreen(
                                callback: () {
                                  setState(() {});
                                  widget.callback();
                                },
                              ),
                            ),
                          );
                        },
                      ),
                      ProfileEntry(
                        icon: Icons.notifications,
                        title: tr('notifications'),
                        callback: () {},
                      ),
                      ProfileEntry(
                        icon: Icons.help,
                        title: tr('help'),
                        callback: () {},
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
