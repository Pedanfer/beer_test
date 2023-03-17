import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test/models/item_view_model.dart';

class Api {
  static Future<List<BeerViewModel>> getBeerList() async {
    final url = Uri.parse(
        'https://api.punkapi.com/v2/beers?brewed_before=11-2012&abv_gt=6');
    final response = await http.get(url);
    final List<dynamic> responseList = json.decode(response.body);
    final viewModels = responseList.map(
      (e) {
        return BeerViewModel(
          name: e["name"],
          description: e["description"],
          photoUrl: e["image_url"],
        );
      },
    ).toList();
    return viewModels;
  }
}
