import 'package:expens_app/color_helper.dart';
import 'package:expens_app/screens/deshboard/add_expens_screen.dart';
import 'package:expens_app/screens/deshboard/home_screen.dart';
import 'package:expens_app/screens/deshboard/notification_screen.dart';
import 'package:expens_app/screens/deshboard/profile_screen.dart';
import 'package:expens_app/screens/deshboard/statistic_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

   int _selectedIndex = 0;

  final List<Widget> _screensList = [
    HomeScreen(),
    StatisticScreen(),
    AddExpensScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  final List<String> svgUrl = [
    "assets/svgs/home.svg",
    "assets/svgs/chart-bar.svg",
    "assets/svgs/add.svg",
    "assets/svgs/bell.svg",
    "assets/svgs/profile.svg",
  ];

  List<Color> colorsList = [
    Colors.amber,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.deepOrange
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _selectedIndex,
        children: _screensList,
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(top: 14),
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          border: BoxBorder.fromLTRB(
            top: BorderSide(
              color: Colors.grey.shade300,
              width: 2
            )
          )
        ),
        child: SafeArea(
          top: false,
          right: false,
          left: false,
          child: Row(
            spacing: 10,
            children: List.generate(svgUrl.length, (index) {
              return Expanded(
                child: InkWell(
                  onTap: (){
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  child: _bottomBarItem(
                      isSelected: _selectedIndex == index,
                      size: 22,
                      svg: svgUrl[index],
                      isAddItem: index == 2
                  ),
                ),
              );
            }),
          ),
        ),
      )
    );
  }


  Widget _bottomBarItem(
      {required bool isSelected, required double size, required String svg, bool isAddItem = false}) {
    return isAddItem ? Center(
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
            decoration: BoxDecoration(
                color: ColorHelper.secondaryColor,
                borderRadius: BorderRadius.circular(8)
            ),
            child: Center(
              child: SvgPicture.asset(
                svg,
                width: size,
                height: size,
                colorFilter: ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn
                ),
              ),
            ),
          ),
      ),
    )
     : SvgPicture.asset(
      svg,
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(
          isAddItem ? Colors.white : isSelected
              ? ColorHelper.secondaryColor
              : ColorHelper.lightGrayColor,
          BlendMode.srcIn
      ),
         );
  }


}
