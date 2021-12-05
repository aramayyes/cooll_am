import 'package:cooll/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class NewPageErrorView extends StatelessWidget {
  final String? message;
  final VoidCallback? onTryAgain;

  const NewPageErrorView({
    Key? key,
    this.message,
    this.onTryAgain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTryAgain,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 16,
            bottom: 16,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  message ?? context.l.errorTapToTryAgain,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 4,
                ),
                const Icon(
                  Icons.refresh,
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      );
}
