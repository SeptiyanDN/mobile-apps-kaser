import 'package:kaser/src/model/produk.dart';

import '../base/api_base.dart';

class RepositoryFetchData {
  final String _key = "/items";
  final ApiBase _apiBase = ApiBase();
  Future<List<Produk>> FetchProduk() async {
    final response = await _apiBase.getDataProduk(_key);
    List<Produk> produk =
        (response as List).map((data) => Produk.fromJson(data)).toList();
    return produk;
  }
}
