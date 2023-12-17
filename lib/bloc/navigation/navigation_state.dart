part of 'navigation_bloc.dart';

class NavigationState extends Equatable {
  final bool? isNestedRoute;

  const NavigationState({this.isNestedRoute = false});

  @override
  List<Object?> get props => [
    isNestedRoute,
  ];

  NavigationState copyWith({
    bool? isNestedRoute = false,
  }) {
    return NavigationState(
      isNestedRoute: isNestedRoute ?? this.isNestedRoute,
    );
  }
}