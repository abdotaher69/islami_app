
import 'package:flutter/material.dart';

import '../../../core/resources/colors_manager.dart';

class VerseItem extends StatelessWidget {
  const VerseItem({super.key,required this.verse});
  final String verse;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorsManager.black,
      child: Text(
        verse,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: ColorsManager.gold,
        ),
      ),
    );;
  }
}
