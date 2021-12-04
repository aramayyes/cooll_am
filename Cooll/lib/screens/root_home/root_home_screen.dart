import 'package:cooll/constants/asset_constants.dart';
import 'package:cooll/localization/app_localization.dart';
import 'package:cooll/theme/app_dimens.dart';
import 'package:cooll/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RootHomeScreen extends StatelessWidget {
  const RootHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
