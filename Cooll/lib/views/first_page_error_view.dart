import 'package:cooll/extensions/context_extensions.dart';
import 'package:cooll/theme/app_dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstPageErrorView extends StatelessWidget {
  final String? title;
  final String? message;
  final VoidCallback? onTryAgain;

  const FirstPageErrorView({
    this.title,
    this.message,
    this.onTryAgain,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final message = this.message;
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: Column(
          children: [
            Text(
              title ?? context.l.errorDefaultTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              message ?? context.l.errorDefaultMessage,
              textAlign: TextAlign.center,
            ),
            if (onTryAgain != null)
              const SizedBox(
                height: 48,
              ),
            if (onTryAgain != null)
              SizedBox(
                height: AppDimens.buttonHeight,
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: onTryAgain,
                  icon: const Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ),
                  label: Text(
                    context.l.tryAgainButton,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
