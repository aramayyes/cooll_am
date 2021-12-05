import 'package:cooll/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class NoDataView extends StatelessWidget {
  final IconData? icon;
  final String? message;

  const NoDataView({
    Key? key,
    this.icon,
    this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Icon(
              icon ?? Icons.broken_image_outlined,
              size: 48,
            ),
          ),
          Text(
            message ?? context.l.noData,
            style: const TextStyle(fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
