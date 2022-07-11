import 'package:flutter/material.dart';
import 'package:uites/models/new_model.dart';
import 'package:uites/widget/card.dart';

class DetailPage extends StatelessWidget {
  final NewsModel model;
  const DetailPage({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Berita",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: CardHome(home: false,model: model,),
      ),
    );
  }
}
