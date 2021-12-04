import 'package:flutter/material.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
NavigatorState navigator() => navigatorKey.currentState!;
