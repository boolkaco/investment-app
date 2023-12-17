import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_state.dart';

class NavigationBloc extends Cubit<NavigationState> {
  NavigationBloc() : super(const NavigationState());

  Future<void> updateIsNestedRoute(
    value, {
    bool isEditProfile = false,
  }) async {
    emit(state.copyWith(
      isNestedRoute: value,
      isEditProfile: isEditProfile,
    ));
  }
}