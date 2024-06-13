import 'package:flutter/material.dart';

import 'screens/screens.dart';

Map<String, WidgetBuilder> getRoutes(BuildContext context) {
  return {
    Question8Screen.routeName: (context) => const Question8Screen(),
    Question9Screen.routeName: (context) => const Question9Screen(),
    Question10Screen.routeName: (context) => const Question10Screen(),
    Question11Screen.routeName: (context) => const Question11Screen(),
  };
}
