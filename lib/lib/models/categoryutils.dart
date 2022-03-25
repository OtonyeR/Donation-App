import 'package:flutter/cupertino.dart';

import 'category.dart';

class Utils {
  static List<Category> getMockedCategories() {
    return [
      Category(
        color: const Color(0xff3d323e),
        name: "Education",
        imgName: "education",
        selected: false,
      ),
      Category(
        color: const Color(0xff3d323e),
        name: "Healthcare",
        imgName: "medical",
        selected: false,
      ),
      Category(
        color: const Color(0xff3d323e),
        name: "Community Development",
        imgName: "community",
        selected: false,
      ),
      Category(
        color: const Color(0xff3d323e),
        name: "Human Welfare",
        imgName: "social",
        selected: false,
      ),
      Category(
        color: const Color(0xff3d323e),
        name: "Environment",
        imgName: "environment",
        selected: false,
      ),
      Category(
        color: const Color(0xff3d323e),
        name: "Youth Empowerment",
        imgName: "youth",
        selected: false,
      ),
    ];
  }
}
