import 'package:equatable/equatable.dart';
import 'package:hive_ce_flutter/adapters.dart';
part 'features_model.g.dart'; // This is for the generated file

@HiveType(typeId: 19)
class FeaturesModel extends Equatable {
  @HiveField(0)
  final bool forNewUser;

  const FeaturesModel({required this.forNewUser});

  FeaturesModel.fromJson(Map<String, dynamic> json)
      : forNewUser = json['forNewUser'];

  Map<String, dynamic> toJson() => {
        'forNewUser': forNewUser,
      };

  @override
  List<Object?> get props => [forNewUser];
}
