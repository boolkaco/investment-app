import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:investment_app/models/hive/profile_model.dart';

part 'profile_state.dart';

class ProfileBloc extends Cubit<ProfileState> {
  ProfileBloc() : super(const ProfileState());

  Future<void> updateData({
    String? name,
    String? surname,
    String? phone,
    String? email,
  }) async {
    var box = await Hive.openBox('myBox');
    var profile = ProfileModel(
      name: name ?? 'Josh',
      surname: surname ?? 'Kameron',
      phone: phone ?? '+380955673411',
      email: email ?? 'joshkameron@gmail.com',
    );
    await box.put('profile', profile);
    await box.close();
    emit(state.copyWith(profileModel: profile));
  }

  Future<void> clear() async {
    var box = await Hive.openBox('myBox');
    await box.clear();
    await box.close();
  }
}
