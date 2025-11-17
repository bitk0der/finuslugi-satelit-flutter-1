class BannerModel {
  final String type;
  final String imageUrl;
  final String url;

  const BannerModel({
    required this.type,
    required this.imageUrl,
    required this.url,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        type: json['type'],
        imageUrl: json['imageUrl'],
        url: json['url'],
      );
}
