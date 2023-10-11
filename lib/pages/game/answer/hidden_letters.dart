import 'package:fishdroid/pages/game/const/const.dart';
import 'package:flutter/material.dart';

Widget hiddenLetter(String char, bool visible) {
  return Container(
    alignment: Alignment.center,
    height: 50,
    width: 50,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(
        12.0,
      ),
      color: Colors.white,
    ),
    child: Visibility(
      visible: !visible,
      child: Text(
        char,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
          color: AppColors.bgColor,
        ),
      ),
    ),
  );
}
