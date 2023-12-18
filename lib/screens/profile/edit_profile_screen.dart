import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investment_app/bloc/profile/profile_bloc.dart';
import 'package:investment_app/theme/app_colors.dart';
import 'package:investment_app/widgets/buttons/app_button.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, profileState) {
        nameController.text = profileState.profileModel!.name;
        surnameController.text = profileState.profileModel!.surname;
        phoneController.text = profileState.profileModel!.phone;
        emailController.text = profileState.profileModel!.email;

        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 46),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/person.png'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.shamrock,
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        color: AppColors.black,
                        size: 14,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 38),
                child: Column(
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: tr('name'),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                      ),
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: surnameController,
                      decoration: InputDecoration(
                        labelText: tr('surname'),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                      ),
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        labelText: tr('phone'),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                      ),
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: tr('email'),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                      ),
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 52),
              AppButton(
                callback: () {
                  ProfileBloc profileBloc = BlocProvider.of<ProfileBloc>(context);
                  profileBloc.updateData(
                    name: nameController.text,
                    surname: surnameController.text,
                    phone: phoneController.text,
                    email: emailController.text,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text('success').tr(),
                  ));
                },
                label: tr('save'),
              ),
            ],
          ),
        );
      },
    );
  }
}
