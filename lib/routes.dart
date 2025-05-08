import 'package:abdoulaye/mobile/landing_page_mobile.dart';
import 'package:abdoulaye/web/landing_page_web.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          settings: settings,
          builder:
              (_) => LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 800) {
                    return LandingPageWeb();
                  } else {
                    return LandingPageMobile();
                  }
                },
              ),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder:
              (_) => LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 800) {
                    return LandingPageWeb();
                  } else {
                    return LandingPageMobile();
                  }
                },
              ),
        );
    }
  }
}
