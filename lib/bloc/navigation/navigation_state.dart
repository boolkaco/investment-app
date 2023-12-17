part of 'navigation_bloc.dart';

class NavigationState extends Equatable {
  final bool? isNestedRoute;
  final bool? isEditProfile;

  const NavigationState({
    this.isNestedRoute = false,
    this.isEditProfile = false,
  });

  @override
  List<Object?> get props => [
    isNestedRoute,
    isEditProfile,
  ];

  NavigationState copyWith({
    bool? isNestedRoute = false,
    bool? isEditProfile = false,
  }) {
    return NavigationState(
      isNestedRoute: isNestedRoute ?? this.isNestedRoute,
      isEditProfile: isEditProfile ?? this.isEditProfile,
    );
  }
}