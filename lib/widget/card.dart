import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uites/models/new_model.dart';

import '../page/detail_page.dart';

class CardHome extends StatelessWidget {
  final bool home;
  final NewsModel model;
  const CardHome({Key? key, this.home = true, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 157,
          margin: const EdgeInsets.only(top: 12),
          width: double.infinity,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: Image.network(
            model.urlImage,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xff5A5A5A)),
              ),
              const SizedBox(height: 6),
              Text(
                "Sumber: ${model.author}",
                style: const TextStyle(color: Color(0xffAAAAAA), fontSize: 10),
              ),
              const SizedBox(height: 3),
              Text(
                DateFormat.yMMMMEEEEd()
                    .format(DateTime.parse(model.publishedAt)),
                style: const TextStyle(color: Color(0xffAAAAAA), fontSize: 10),
              ),
              const SizedBox(height: 9),
              if (home)
                Text(
                  model.content,
                  style:
                      const TextStyle(fontSize: 10, color: Color(0xff5A5A5A)),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              if (!home)
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    model.content,
                    style:
                        const TextStyle(fontSize: 10, color: Color(0xff5A5A5A)),
                    // maxLines: if(home)  3 ,
                  ),
                ),
              const SizedBox(height: 4),
              if (home)
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailPage(
                              model: model,
                            )));
                  },
                  child: const Text(
                    "Baca Selengkapnya....",
                    style: TextStyle(color: Color(0xff0093DD), fontSize: 10),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
