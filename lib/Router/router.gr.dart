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
import 'package:auto_route/auto_route.dart' as _i17;
import 'package:flutter/material.dart' as _i18;

import '../Core/auth_flow_page.dart' as _i9;
import '../ForgotPW/forgotpw.dart' as _i2;
import '../ForgotPW/otp.dart' as _i3;
import '../Home/about.dart' as _i4;
import '../Home/dashboard.dart' as _i10;
import '../Home/home.dart' as _i12;
import '../LoginPage/login_page.dart' as _i11;
import '../Navigation%20Bar/cart.dart' as _i15;
import '../Navigation%20Bar/notification.dart' as _i13;
import '../Navigation%20Bar/profilepage.dart' as _i16;
import '../Navigation%20Bar/wishlist.dart' as _i14;
import '../Recommendation/architecture.dart' as _i7;
import '../Recommendation/building_material.dart' as _i6;
import '../Recommendation/Engineer.dart' as _i5;
import '../Recommendation/Machinery/machineryhire.dart' as _i8;
import '../Signin/sign_in.dart' as _i1;

class AppRouter extends _i17.RootStackRouter {
  AppRouter([_i18.GlobalKey<_i18.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i17.PageFactory> pagesMap = {
    SigninRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SigninPage(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.ForgotPasswordPage(),
      );
    },
    OtpRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.OtpPage(),
      );
    },
    AboutRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.AboutPage(),
      );
    },
    EngineerRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.EngineerPage(),
      );
    },
    BuildingMaterialRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.BuildingMaterialPage(),
      );
    },
    ArchitectureRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.ArchitecturePage(),
      );
    },
    MachineryHireRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.MachineryHirePage(),
      );
    },
    AuthflowRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.AuthflowPage(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.DashboardPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.LoginPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.HomePage(),
      );
    },
    NotificationRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.NotificationPage(),
      );
    },
    WishlistRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.WishlistPage(),
      );
    },
    CartRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i15.CartPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i16.ProfilePage(),
      );
    },
  };

  @override
  List<_i17.RouteConfig> get routes => [
        _i17.RouteConfig(
          SigninRoute.name,
          path: '/signin-page',
        ),
        _i17.RouteConfig(
          ForgotPasswordRoute.name,
          path: '/forgot-password-page',
        ),
        _i17.RouteConfig(
          OtpRoute.name,
          path: '/otp-page',
        ),
        _i17.RouteConfig(
          AboutRoute.name,
          path: '/about-page',
        ),
        _i17.RouteConfig(
          EngineerRoute.name,
          path: '/engineer-page',
        ),
        _i17.RouteConfig(
          BuildingMaterialRoute.name,
          path: '/building-material-page',
        ),
        _i17.RouteConfig(
          ArchitectureRoute.name,
          path: '/architecture-page',
        ),
        _i17.RouteConfig(
          MachineryHireRoute.name,
          path: '/machinery-hire-page',
        ),
        _i17.RouteConfig(
          AuthflowRoute.name,
          path: '/',
          children: [
            _i17.RouteConfig(
              DashboardRoute.name,
              path: 'dashboard-page',
              parent: AuthflowRoute.name,
              children: [
                _i17.RouteConfig(
                  HomeRoute.name,
                  path: 'home-page',
                  parent: DashboardRoute.name,
                ),
                _i17.RouteConfig(
                  NotificationRoute.name,
                  path: 'notification-page',
                  parent: DashboardRoute.name,
                ),
                _i17.RouteConfig(
                  WishlistRoute.name,
                  path: 'wishlist-page',
                  parent: DashboardRoute.name,
                ),
                _i17.RouteConfig(
                  CartRoute.name,
                  path: 'cart-page',
                  parent: DashboardRoute.name,
                ),
                _i17.RouteConfig(
                  ProfileRoute.name,
                  path: 'profile-page',
                  parent: DashboardRoute.name,
                ),
              ],
            ),
            _i17.RouteConfig(
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
class SigninRoute extends _i17.PageRouteInfo<void> {
  const SigninRoute()
      : super(
          SigninRoute.name,
          path: '/signin-page',
        );

  static const String name = 'SigninRoute';
}

/// generated route for
/// [_i2.ForgotPasswordPage]
class ForgotPasswordRoute extends _i17.PageRouteInfo<void> {
  const ForgotPasswordRoute()
      : super(
          ForgotPasswordRoute.name,
          path: '/forgot-password-page',
        );

  static const String name = 'ForgotPasswordRoute';
}

/// generated route for
/// [_i3.OtpPage]
class OtpRoute extends _i17.PageRouteInfo<void> {
  const OtpRoute()
      : super(
          OtpRoute.name,
          path: '/otp-page',
        );

  static const String name = 'OtpRoute';
}

/// generated route for
/// [_i4.AboutPage]
class AboutRoute extends _i17.PageRouteInfo<void> {
  const AboutRoute()
      : super(
          AboutRoute.name,
          path: '/about-page',
        );

  static const String name = 'AboutRoute';
}

/// generated route for
/// [_i5.EngineerPage]
class EngineerRoute extends _i17.PageRouteInfo<void> {
  const EngineerRoute()
      : super(
          EngineerRoute.name,
          path: '/engineer-page',
        );

  static const String name = 'EngineerRoute';
}

/// generated route for
/// [_i6.BuildingMaterialPage]
class BuildingMaterialRoute extends _i17.PageRouteInfo<void> {
  const BuildingMaterialRoute()
      : super(
          BuildingMaterialRoute.name,
          path: '/building-material-page',
        );

  static const String name = 'BuildingMaterialRoute';
}

/// generated route for
/// [_i7.ArchitecturePage]
class ArchitectureRoute extends _i17.PageRouteInfo<void> {
  const ArchitectureRoute()
      : super(
          ArchitectureRoute.name,
          path: '/architecture-page',
        );

  static const String name = 'ArchitectureRoute';
}

/// generated route for
/// [_i8.MachineryHirePage]
class MachineryHireRoute extends _i17.PageRouteInfo<void> {
  const MachineryHireRoute()
      : super(
          MachineryHireRoute.name,
          path: '/machinery-hire-page',
        );

  static const String name = 'MachineryHireRoute';
}

/// generated route for
/// [_i9.AuthflowPage]
class AuthflowRoute extends _i17.PageRouteInfo<void> {
  const AuthflowRoute({List<_i17.PageRouteInfo>? children})
      : super(
          AuthflowRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'AuthflowRoute';
}

/// generated route for
/// [_i10.DashboardPage]
class DashboardRoute extends _i17.PageRouteInfo<void> {
  const DashboardRoute({List<_i17.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          path: 'dashboard-page',
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i11.LoginPage]
class LoginRoute extends _i17.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: 'login-page',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i12.HomePage]
class HomeRoute extends _i17.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home-page',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i13.NotificationPage]
class NotificationRoute extends _i17.PageRouteInfo<void> {
  const NotificationRoute()
      : super(
          NotificationRoute.name,
          path: 'notification-page',
        );

  static const String name = 'NotificationRoute';
}

/// generated route for
/// [_i14.WishlistPage]
class WishlistRoute extends _i17.PageRouteInfo<void> {
  const WishlistRoute()
      : super(
          WishlistRoute.name,
          path: 'wishlist-page',
        );

  static const String name = 'WishlistRoute';
}

/// generated route for
/// [_i15.CartPage]
class CartRoute extends _i17.PageRouteInfo<void> {
  const CartRoute()
      : super(
          CartRoute.name,
          path: 'cart-page',
        );

  static const String name = 'CartRoute';
}

/// generated route for
/// [_i16.ProfilePage]
class ProfileRoute extends _i17.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: 'profile-page',
        );

  static const String name = 'ProfileRoute';
}
