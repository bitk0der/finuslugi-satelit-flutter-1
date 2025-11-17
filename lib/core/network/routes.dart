/* import 'package:compare_banks/core/network/api_path.dart'; */

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
}
