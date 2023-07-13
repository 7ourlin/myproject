// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i19;
import 'package:flutter/material.dart' as _i20;

import '../Core/auth_flow_page.dart' as _i11;
import '../ForgotPW/forgotpw.dart' as _i2;
import '../ForgotPW/otp.dart' as _i4;
import '../Home/about.dart' as _i5;
import '../Home/dashboard.dart' as _i12;
import '../Home/home.dart' as _i14;
import '../Home/testing.dart' as _i10;
import '../LoginPage/login_page.dart' as _i13;
import '../Navigation%20Bar/cart.dart' as _i17;
import '../Navigation%20Bar/notification.dart' as _i15;
import '../Navigation%20Bar/profilepage.dart' as _i18;
import '../Navigation%20Bar/test.dart' as _i3;
import '../Navigation%20Bar/wishlist.dart' as _i16;
import '../Recommendation/architecture.dart' as _i8;
import '../Recommendation/building_material.dart' as _i7;
import '../Recommendation/Engineer.dart' as _i6;
import '../Recommendation/Machinery/machineryhire.dart' as _i9;
import '../Signin/sign_in.dart' as _i1;

class AppRouter extends _i19.RootStackRouter {
  AppRouter([_i20.GlobalKey<_i20.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i19.PageFactory> pagesMap = {
    SigninRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SigninPage(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.ForgotPasswordPage(),
      );
    },
    UserInformationRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.UserInformationPage(),
      );
    },
    OtpRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.OtpPage(),
      );
    },
    AboutRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.AboutPage(),
      );
    },
    EngineerRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.EngineerPage(),
      );
    },
    BuildingMaterialRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.BuildingMaterialPage(),
      );
    },
    ArchitectureRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.ArchitecturePage(),
      );
    },
    DetailRoute.name: (routeData) {
      final args = routeData.argsAs<DetailRouteArgs>();
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.DetailPage(
          key: args.key,
          data: args.data,
        ),
      );
    },
    TestingRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.TestingPage(),
      );
    },
    AuthflowRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.AuthflowPage(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.DashboardPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.LoginPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.HomePage(),
      );
    },
    NotificationRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i15.NotificationPage(),
      );
    },
    WishlistRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i16.WishlistPage(),
      );
    },
    CartRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i17.CartPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i18.ProfilePage(),
      );
    },
  };

  @override
  List<_i19.RouteConfig> get routes => [
        _i19.RouteConfig(
          SigninRoute.name,
          path: '/signin-page',
        ),
        _i19.RouteConfig(
          ForgotPasswordRoute.name,
          path: '/forgot-password-page',
        ),
        _i19.RouteConfig(
          UserInformationRoute.name,
          path: '/user-information-page',
        ),
        _i19.RouteConfig(
          OtpRoute.name,
          path: '/otp-page',
        ),
        _i19.RouteConfig(
          AboutRoute.name,
          path: '/about-page',
        ),
        _i19.RouteConfig(
          EngineerRoute.name,
          path: '/engineer-page',
        ),
        _i19.RouteConfig(
          BuildingMaterialRoute.name,
          path: '/building-material-page',
        ),
        _i19.RouteConfig(
          ArchitectureRoute.name,
          path: '/architecture-page',
        ),
        _i19.RouteConfig(
          DetailRoute.name,
          path: '/detail-page',
        ),
        _i19.RouteConfig(
          TestingRoute.name,
          path: '/testing-page',
        ),
        _i19.RouteConfig(
          AuthflowRoute.name,
          path: '/',
          children: [
            _i19.RouteConfig(
              DashboardRoute.name,
              path: 'dashboard-page',
              parent: AuthflowRoute.name,
              children: [
                _i19.RouteConfig(
                  HomeRoute.name,
                  path: 'home-page',
                  parent: DashboardRoute.name,
                ),
                _i19.RouteConfig(
                  NotificationRoute.name,
                  path: 'notification-page',
                  parent: DashboardRoute.name,
                ),
                _i19.RouteConfig(
                  WishlistRoute.name,
                  path: 'wishlist-page',
                  parent: DashboardRoute.name,
                ),
                _i19.RouteConfig(
                  CartRoute.name,
                  path: 'cart-page',
                  parent: DashboardRoute.name,
                ),
                _i19.RouteConfig(
                  ProfileRoute.name,
                  path: 'profile-page',
                  parent: DashboardRoute.name,
                ),
              ],
            ),
            _i19.RouteConfig(
              LoginRoute.name,
              path: 'login-page',
              parent: AuthflowRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.SigninPage]
class SigninRoute extends _i19.PageRouteInfo<void> {
  const SigninRoute()
      : super(
          SigninRoute.name,
          path: '/signin-page',
        );

  static const String name = 'SigninRoute';
}

/// generated route for
/// [_i2.ForgotPasswordPage]
class ForgotPasswordRoute extends _i19.PageRouteInfo<void> {
  const ForgotPasswordRoute()
      : super(
          ForgotPasswordRoute.name,
          path: '/forgot-password-page',
        );

  static const String name = 'ForgotPasswordRoute';
}

/// generated route for
/// [_i3.UserInformationPage]
class UserInformationRoute extends _i19.PageRouteInfo<void> {
  const UserInformationRoute()
      : super(
          UserInformationRoute.name,
          path: '/user-information-page',
        );

  static const String name = 'UserInformationRoute';
}

/// generated route for
/// [_i4.OtpPage]
class OtpRoute extends _i19.PageRouteInfo<void> {
  const OtpRoute()
      : super(
          OtpRoute.name,
          path: '/otp-page',
        );

  static const String name = 'OtpRoute';
}

/// generated route for
/// [_i5.AboutPage]
class AboutRoute extends _i19.PageRouteInfo<void> {
  const AboutRoute()
      : super(
          AboutRoute.name,
          path: '/about-page',
        );

  static const String name = 'AboutRoute';
}

/// generated route for
/// [_i6.EngineerPage]
class EngineerRoute extends _i19.PageRouteInfo<void> {
  const EngineerRoute()
      : super(
          EngineerRoute.name,
          path: '/engineer-page',
        );

  static const String name = 'EngineerRoute';
}

/// generated route for
/// [_i7.BuildingMaterialPage]
class BuildingMaterialRoute extends _i19.PageRouteInfo<void> {
  const BuildingMaterialRoute()
      : super(
          BuildingMaterialRoute.name,
          path: '/building-material-page',
        );

  static const String name = 'BuildingMaterialRoute';
}

/// generated route for
/// [_i8.ArchitecturePage]
class ArchitectureRoute extends _i19.PageRouteInfo<void> {
  const ArchitectureRoute()
      : super(
          ArchitectureRoute.name,
          path: '/architecture-page',
        );

  static const String name = 'ArchitectureRoute';
}

/// generated route for
/// [_i9.DetailPage]
class DetailRoute extends _i19.PageRouteInfo<DetailRouteArgs> {
  DetailRoute({
    _i20.Key? key,
    required Map<String, dynamic> data,
  }) : super(
          DetailRoute.name,
          path: '/detail-page',
          args: DetailRouteArgs(
            key: key,
            data: data,
          ),
        );

  static const String name = 'DetailRoute';
}

class DetailRouteArgs {
  const DetailRouteArgs({
    this.key,
    required this.data,
  });

  final _i20.Key? key;

  final Map<String, dynamic> data;

  @override
  String toString() {
    return 'DetailRouteArgs{key: $key, data: $data}';
  }
}

/// generated route for
/// [_i10.TestingPage]
class TestingRoute extends _i19.PageRouteInfo<void> {
  const TestingRoute()
      : super(
          TestingRoute.name,
          path: '/testing-page',
        );

  static const String name = 'TestingRoute';
}

/// generated route for
/// [_i11.AuthflowPage]
class AuthflowRoute extends _i19.PageRouteInfo<void> {
  const AuthflowRoute({List<_i19.PageRouteInfo>? children})
      : super(
          AuthflowRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'AuthflowRoute';
}

/// generated route for
/// [_i12.DashboardPage]
class DashboardRoute extends _i19.PageRouteInfo<void> {
  const DashboardRoute({List<_i19.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          path: 'dashboard-page',
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i13.LoginPage]
class LoginRoute extends _i19.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: 'login-page',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i14.HomePage]
class HomeRoute extends _i19.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home-page',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i15.NotificationPage]
class NotificationRoute extends _i19.PageRouteInfo<void> {
  const NotificationRoute()
      : super(
          NotificationRoute.name,
          path: 'notification-page',
        );

  static const String name = 'NotificationRoute';
}

/// generated route for
/// [_i16.WishlistPage]
class WishlistRoute extends _i19.PageRouteInfo<void> {
  const WishlistRoute()
      : super(
          WishlistRoute.name,
          path: 'wishlist-page',
        );

  static const String name = 'WishlistRoute';
}

/// generated route for
/// [_i17.CartPage]
class CartRoute extends _i19.PageRouteInfo<void> {
  const CartRoute()
      : super(
          CartRoute.name,
          path: 'cart-page',
        );

  static const String name = 'CartRoute';
}

/// generated route for
/// [_i18.ProfilePage]
class ProfileRoute extends _i19.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: 'profile-page',
        );

  static const String name = 'ProfileRoute';
}
