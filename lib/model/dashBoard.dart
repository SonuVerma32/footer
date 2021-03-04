import 'package:flutter/material.dart';

class Dashboard {
  final String image, title;
  final int size, id;
  final Color color;
  Dashboard({
    this.id,
    this.image,
    this.title,
    this.size,
    this.color,
  });
}

List<Dashboard> products = [
  Dashboard(
      id: 1,
      title: "HSSC",
      size: 12,
      image: "assets/images/ic_icon_1.png",
      color: Color(0xFF03A9F4)
  ),
  Dashboard(
      id: 2,
      title: "SSC",
      size: 12,
      image: "assets/images/ic_icon_2.png",
      color: Color(0xFF78909C)
  ),
  Dashboard(
      id: 3,
      title: "BANK",
      size: 12,
      image: "assets/images/ic_icon_3.png",
      color: Color(0xFF989493)
  ),
  Dashboard(
      id: 4,
      title: "RAILWAY",
      size: 12,
      image: "assets/images/ic_icon_4.png",
      color: Color(0xFFB0BEC5)
  ),
  Dashboard(
      id: 5,
      title: "POLICE",
      size: 12,
      image: "assets/images/ic_icon_5.png",
      color: Color(0xFFBBDEFB)
  ),
  Dashboard(
    id: 6,
    title: "JEE MAIN",
    size: 12,
    image: "assets/images/ic_icon_6.png",
    color: Color(0xFF3D82AE),
  ),
  Dashboard(
      id: 7,
      title: "ENGINEERING",
      size: 12,
      image: "assets/images/ic_icon_7.png",
      color: Color(0xFFE6B398)),
  Dashboard(
    id: 8,
    title: "GATE",
    size: 12,
    image: "assets/images/ic_icon_8.png",
    color: Color(0xFFE0E0E0),
  ),
];