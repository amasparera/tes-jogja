import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:uites/models/new_model.dart';

class RemoteApiService {
  Future<List<NewsModel>> getApi() async {
    const idKey = "3b2b8aee4cfc469c9109693b91298921";
    final Uri apiUrl = Uri.parse(
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=$idKey");

    final result = await http.get(apiUrl);

    final body = jsonDecode(result.body);
    log(body.toString());

    return List<NewsModel>.from(
        (body["articles"] as List<dynamic>).map((x) => NewsModel.fromJson(x)));
  }
}
