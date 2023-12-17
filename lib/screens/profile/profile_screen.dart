import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investment_app/bloc/navigation/navigation_bloc.dart';
import 'package:investment_app/screens/profile/edit_profile_screen.dart';
import 'package:investment_app/widgets/profile/profile_entry.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  leading: const SizedBox(
                    width: 50,
                    height: 50,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/person.png'),
                    ),
                  ),
                  title: Text(
                    'Josh Kameron',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    '+38095-567-34-11',
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
                ),
                const SizedBox(height: 32),
                Expanded(
                  child: ListView(
                    children: const [
                      ProfileEntry(
                        icon: Icons.person,
                        title: 'User profile',
                      ),
                      ProfileEntry(
                        icon: Icons.settings,
                        title: 'Settings',
                      ),
                      ProfileEntry(
                        icon: Icons.notifications,
                        title: 'Notifications',
                      ),
                      ProfileEntry(
                        icon: Icons.help,
                        title: 'Help and support',
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
