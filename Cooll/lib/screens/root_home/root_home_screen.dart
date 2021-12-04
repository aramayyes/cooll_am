import 'package:cooll/constants/asset_constants.dart';
import 'package:cooll/localization/app_localization.dart';
import 'package:cooll/stores/root_home_screen_store.dart';
import 'package:cooll/theme/app_colors.dart';
import 'package:cooll/theme/app_dimens.dart';
import 'package:cooll/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:collection/collection.dart';

class RootHomeScreen extends StatefulWidget {
  const RootHomeScreen({Key? key}) : super(key: key);

  @override
  State<RootHomeScreen> createState() => _RootHomeScreenState();
}

class _RootHomeScreenState extends State<RootHomeScreen> {
  final RootHomeScreenStore store = RootHomeScreenStore();
  final bottomNavigationBarItems = <_BottomNavigationBarItemData>[
    _BottomNavigationBarItemData(
      icon: Icons.home,
      label: () => AL.homeBarItem,
    ),
    _BottomNavigationBarItemData(
      icon: Icons.drive_eta_outlined,
      label: () => AL.shopBarItem,
    ),
    _BottomNavigationBarItemData(
      icon: Icons.add_circle_outlined,
      label: () => AL.sellACarBarItem,
    ),
    _BottomNavigationBarItemData(
      icon: Icons.account_circle_outlined,
      label: () => AL.signInBarItem,
    ),
    _BottomNavigationBarItemData(
      icon: Icons.more_horiz_outlined,
      label: () => AL.moreBarItem,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: SvgPicture.asset(AssetConstants.appLogo),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    AL.signIn,
                    style: const TextStyle(
                      fontSize: AppTypography.buttonTinyText,
                    ),
                  ),
                ),
              ),
            ],
          ),
          titleSpacing: AppDimens.appBarSpacing,
        ),
        body: Container(),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.primary,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0,
          items: bottomNavigationBarItems
              .mapIndexed(
                (index, item) => _buildBottomNavigationBarItem(
                  index: index,
                  icon: item.icon,
                  label: item.label(),
                ),
              )
              .toList(),
          currentIndex: store.activeIndex,
          onTap: store.changeIndex,
        ),
      );
    });
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem({
    required int index,
    required IconData icon,
    required String label,
  }) {
    final midIndex = bottomNavigationBarItems.length ~/ 2;

    return BottomNavigationBarItem(
      label: '',
      tooltip: '',
      icon: Center(
        child: Container(
          height: kBottomNavigationBarHeight,
          width: double.infinity,
          color: index == midIndex ? AppColors.secondary : AppColors.primary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: store.activeIndex == index || index == midIndex
                    ? AppColors.bottomNavigationText
                    : AppColors.inactive,
              ),
              const SizedBox(height: 5),
              Text(
                label,
                style: const TextStyle(
                  color: AppColors.bottomNavigationText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomNavigationBarItemData {
  final IconData icon;
  final String Function() label;

  _BottomNavigationBarItemData({
    required this.icon,
    required this.label,
  });
}
