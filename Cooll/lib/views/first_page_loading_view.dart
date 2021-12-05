import 'package:cooll/theme/app_colors.dart';
import 'package:flutter/material.dart';

class FirstPageLoadingView extends StatelessWidget {
  const FirstPageLoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.secondary,
      ),
    );
  }
}
