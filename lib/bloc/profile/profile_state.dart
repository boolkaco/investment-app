part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final ProfileModel? profileModel;

  const ProfileState({
    this.profileModel,
  });

  @override
  List<Object?> get props => [
    profileModel,
  ];

  ProfileState copyWith({
    ProfileModel? profileModel,
  }) {
    return ProfileState(
      profileModel: profileModel ?? this.profileModel,
    );
  }
}