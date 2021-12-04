import 'package:cooll/screens/root_home/root_home_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String rootHome = '/rootHome';

  static final routes = <String, WidgetBuilder>{
    rootHome: (context) => const RootHomeScreen()
  };
}

T? _getScreenArguments<T>(BuildContext context,
    [T Function(BuildContext context)? defaultArgument]) {
  final arguments = ModalRoute.of(context)?.settings.arguments as T?;
  return arguments ??
      (defaultArgument != null ? defaultArgument(context) : null);
}
