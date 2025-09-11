import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/features/main_layout/quran/quran.dart';
import 'package:islami_app/features/main_layout/radio/radio.dart';
import 'package:islami_app/features/main_layout/sebha/sebha.dart';
import 'package:islami_app/features/main_layout/time/time.dart';

import 'hades/hades.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  List<Widget> tabs = [Quran(), Hades(), Sebha(), RadioTap(), Time()];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.black,
      bottomNavigationBar:_buildBottomNavigationBar(),
      body: tabs[selectedIndex],
    );
  }

  Widget _buildIcon({required String iconPath, required bool isSelected}) {
    return isSelected
        ? Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            decoration: BoxDecoration(
              color: ColorsManager.black.withOpacity(0.6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ImageIcon(AssetImage(iconPath)),
          )
        : ImageIcon(AssetImage(iconPath));
  }
  BottomNavigationBar _buildBottomNavigationBar() {
    return  BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (index) {
        selectedIndex = index;
        setState(() {});
      },
      items: [
        BottomNavigationBarItem(
          icon: _buildIcon(
            iconPath: IconAssets.quran,
            isSelected: selectedIndex == 0,
          ),
          label: "Quran",
        ),
        BottomNavigationBarItem(
          icon: _buildIcon(
            iconPath: IconAssets.hades,
            isSelected: selectedIndex == 1,
          ),
          label: "hades",
        ),
        BottomNavigationBarItem(
          icon: _buildIcon(
            iconPath: IconAssets.sebha,
            isSelected: selectedIndex == 2,
          ),
          label: "sebha",
        ),
        BottomNavigationBarItem(
          icon: _buildIcon(
            iconPath: IconAssets.radio,
            isSelected: selectedIndex == 3,
          ),
          label: "radio",
        ),
        BottomNavigationBarItem(
          icon: _buildIcon(
            iconPath: IconAssets.time,
            isSelected: selectedIndex == 4,
          ),
          label: "time",
        ),
      ],
    );
  }
}
