import 'package:fin_uslugi/features/loans/data/models/credit/search_responses/product.dart';

class Response {
  final List<Product> products;
  final int page;
  final int totalPages;
  final int total;

  Response({
    required this.products,
    required this.page,
    required this.totalPages,
    required this.total,
  });
}
