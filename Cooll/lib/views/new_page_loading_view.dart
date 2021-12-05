import 'package:cooll/theme/app_colors.dart';
import 'package:flutter/material.dart';

class NewPageLoadingView extends StatelessWidget {
  const NewPageLoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircularProgressIndicator(
          color: AppColors.secondary,
        ),
      ),
    );
  }
}
