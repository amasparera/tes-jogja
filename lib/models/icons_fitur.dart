import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconsFitur {
  final int id;
  final String image;
  final String name;
  final Color colors;

  IconsFitur(this.id, this.image, this.name, this.colors);
}

List<IconsFitur> iconsFitur =  [
  IconsFitur(
      1, "assest/hospital-buildings.png", "KLINIK TERDEKAT", const Color(0xff0093DD)),
  IconsFitur(2, "assest/list.png", "RIWAYAT", const Color(0xff0093DD)),
  IconsFitur(3, "assest/image-gallery.png", "DATA SCAN", const Color(0xff8445A2)),
  IconsFitur(4, "assest/notification.png", "NOTIFIKASI", const Color(0xff0093DD)),
  IconsFitur(5, "assest/ic_grade_24px.png", "BERI NILAI", const Color(0xff8445A2)),
  IconsFitur(6, "assest/gear-option.png", "PENGATURAN", const Color(0xffDD127B)),
];
