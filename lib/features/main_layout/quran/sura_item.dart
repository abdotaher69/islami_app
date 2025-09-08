import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/constant_manager.dart';
import 'package:islami_app/core/routes_manger/routes_manager.dart';
import 'package:islami_app/features/models/sura_model.dart';

import '../../../core/resources/assets_manager.dart';

class SuraItem extends StatelessWidget {
  const SuraItem({super.key,required this.sura});
  final SuraModel sura;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, RouteManager.suraDetails,arguments: sura);
      },

      child: Container(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(ImagesAssets.suraNumberBg),
                Text(
                  "${sura.index}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Text(
                  sura.suraNameEn,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                sura.suraVerses,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Spacer(),
            Text(sura.suraNameAr,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white))
          ],
        ),
      ),
    );
  }
}
