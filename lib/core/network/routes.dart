/* import 'package:fin_uslugi/core/network/api_path.dart'; */

class Routes {
/*   https://xn--80ajroeecv.xn--p1ai/api/bk/searchproducts.php?type= */
  static String creditSearch(String bankingProduct, String query, int page) =>
      "https://xn--80ajroeecv.xn--p1ai/api/bk/searchproducts.php?type=$bankingProduct$query&page=$page";
/*   static String searchProgramms(String searchText, int page) =>
      '${ApiPath.domain}/ipotekasearch.php?text=$searchText&page=$page';
 */
  static String searchBanks(String searchText, int page) =>
      'https://xn--80ajroeecv.xn--p1ai/api/bk/searchbanki.php?search=$searchText&page=$page';

  static String searchBank(int id) =>
      'https://xn--80ajroeecv.xn--p1ai/api/bk/searchbanki.php?id=$id';

  static String domain = 'https://xn--80a2acagecfl.xn--p1acf';

  static String getConfig() => "$domain/configiosv2.php";

  static String searchCoupons(
          String searchString, String? nextPage, String? category) =>
      "$domain/searchiosv2.php?search=$searchString${nextPage != null ? '&page=$nextPage' : ''}${category != null ? '&category=$category' : ''}";

  static String getMarketCoupons(String website) =>
      "$domain/searchdetailsiosv2.php?store=$website";
}
