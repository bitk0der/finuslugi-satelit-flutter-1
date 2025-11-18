import 'package:equatable/equatable.dart';

class ConfigItemModel extends Equatable {
  final String title;
  final String image;
  final String category;
  final String? url;

  const ConfigItemModel({
    required this.title,
    required this.image,
    required this.category,
    required this.url,
  });
  ConfigItemModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        image = json['image'],
        category = json['category'] ?? '',
        url = json['url'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'image': image,
        'category': category,
        'url': url,
      };

  @override
  List<Object?> get props => [url];
}
