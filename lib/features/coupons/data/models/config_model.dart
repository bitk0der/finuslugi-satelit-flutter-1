import 'package:equatable/equatable.dart';
import 'package:fin_uslugi/features/coupons/data/models/config_item_model.dart';

class ConfigModel extends Equatable {
  final String type;
  final List<ConfigItemModel> items;

  const ConfigModel({required this.type, required this.items});
  ConfigModel.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        items = List.generate(json['items'].length,
            (index) => ConfigItemModel.fromJson(json['items'][index]));

  Map<String, dynamic> toJson() => {'type': type, 'items': items};

  @override
  List<Object?> get props => [type];
}
