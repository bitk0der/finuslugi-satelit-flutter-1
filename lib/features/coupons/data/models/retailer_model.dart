import 'package:equatable/equatable.dart';
import 'package:hive_ce_flutter/adapters.dart';
part 'retailer_model.g.dart'; // This is for the generated file

@HiveType(typeId: 1)
class RetailerModel extends Equatable {
  @HiveField(0)
  final String uuid;
  @HiveField(1)
  final String slug;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final List<dynamic> nearest;
  @HiveField(4)
  final String website;
  @HiveField(5)
  final String imageUrl;

  const RetailerModel({
    required this.uuid,
    required this.slug,
    required this.name,
    required this.nearest,
    required this.website,
    required this.imageUrl,
  });
  RetailerModel.fromJson(Map<String, dynamic> json)
      : uuid = json['uuid'],
        slug = json['slug'],
        name = json['name'],
        nearest = json['nearest'],
        website = json['website'],
        imageUrl = json['imageUrl']['default'];

  Map<String, dynamic> toJson() => {
        'uuid': uuid,
        'slug': slug,
        'name': name,
        'nearest': nearest,
        'website': website,
        'imageUrl': {'default': imageUrl},
      };

  @override
  List<Object?> get props => [uuid, slug, name, nearest, website, imageUrl];
}
