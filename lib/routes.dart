import 'package:abdoulaye/mobile/about_mobile.dart';
import 'package:abdoulaye/mobile/contact_mobile.dart';
import 'package:abdoulaye/mobile/landing_page_mobile.dart';
import 'package:abdoulaye/mobile/works_mobile.dart';
import 'package:abdoulaye/web/about_web.dart';
import 'package:abdoulaye/web/blog_web.dart';
import 'package:abdoulaye/web/contact_web.dart';
import 'package:abdoulaye/web/landing_page_web.dart';
import 'package:abdoulaye/web/works_web.dart';
import 'package:flutter/material.dart';

import 'mobile/blog_mobile.dart';

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
      case '/contact':
        return MaterialPageRoute(
          settings: settings,
          builder:
              (_) => LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 800) {
                    return ContactWeb();
                  } else {
                    return ContactMobile();
                  }
                },
              ),
        );
      case '/about':
        return MaterialPageRoute(
          settings: settings,
          builder:
              (_) => LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 800) {
                    return AboutWeb();
                  } else {
                    return AboutMobile();
                  }
                },
              ),
        );
      case '/blog':
        return MaterialPageRoute(
          settings: settings,
          builder:
              (_) => LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 800) {
                    return BlogWeb();
                  } else {
                    return BlogMobile();
                  }
                },
              ),
        );
      case '/works':
        return MaterialPageRoute(
          settings: settings,
          builder:
              (_) => LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 800) {
                    return WorksWeb();
                  } else {
                    return WorksMobile();
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
