import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/features/main_layout/hades/hadith_item.dart';

class Hades extends StatelessWidget {
  const Hades({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImagesAssets.hadeathTapBackGround),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(ImagesAssets.islamiLogo),
          Expanded(
            child: CarouselSlider(
              options: CarouselOptions(height: double.infinity, enlargeCenterPage: true,enlargeFactor: 0.1,viewportFraction:.7 ),
            
              items: List.generate(50, (index) => HadithItem(index: index+1,))
            
            ),
          ),
        ],
      ),
    );
  }
}
