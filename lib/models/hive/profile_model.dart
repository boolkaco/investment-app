import 'package:hive/hive.dart';

part 'profile_model.g.dart';

@HiveType(typeId: 0)
class ProfileModel {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String surname;

  @HiveField(2)
  final String phone;

  @HiveField(3)
  final String email;

  ProfileModel({
    required this.name,
    required this.surname,
    required this.phone,
    required this.email,
  });
}
