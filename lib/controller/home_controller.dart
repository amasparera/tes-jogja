import 'package:flutter/cupertino.dart';
import 'package:uites/models/new_model.dart';

import '../remote/api_google_news.dart';

class HomeController extends ChangeNotifier {
  List<NewsModel> data = [];

  bool loading = true;

  Future getapi() async {
    loading = true;
    await RemoteApi().getApi().then((value) {
      return data = value;
    });
    loading = false;
    notifyListeners();
  }
}
