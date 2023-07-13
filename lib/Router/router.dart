// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:auto_route/annotations.dart';
import 'package:myproject/ForgotPW/otp.dart';
import 'package:myproject/Home/dashboard.dart';
import 'package:myproject/Home/home.dart';
import 'package:myproject/Navigation%20Bar/cart.dart';
import 'package:myproject/Navigation%20Bar/profilepage.dart';
import 'package:myproject/Navigation%20Bar/wishlist.dart';
import 'package:myproject/Recommendation/Engineer.dart';
import 'package:myproject/Recommendation/building_material.dart';

import '../Core/auth_flow_page.dart';
import '../ForgotPW/forgotpw.dart';
import '../Home/about.dart';
import '../Home/testing.dart';
import '../LoginPage/login_page.dart';
import '../Navigation Bar/notification.dart';
import '../Navigation Bar/test.dart';
import '../Recommendation/Machinery/machineryhire.dart';
import '../Recommendation/architecture.dart';
import '../Signin/sign_in.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: SigninPage,
    ),
    AutoRoute(page: ForgotPasswordPage),
    AutoRoute(page: UserInformationPage),
    AutoRoute(page: OtpPage),
    AutoRoute(page: AboutPage),
    AutoRoute(page: EngineerPage),
    AutoRoute(page: BuildingMaterialPage),
    AutoRoute(page: ArchitecturePage),
    AutoRoute(page: DetailPage),
    AutoRoute(page: TestingPage),
    AutoRoute(
      page: AuthflowPage,
      path: '/',
      initial: true,
      children: [
        AutoRoute(
          page: DashboardPage,
          children: [
            AutoRoute(page: HomePage),
            AutoRoute(page: NotificationPage),
            AutoRoute(page: WishlistPage),
            AutoRoute(page: CartPage),
            AutoRoute(page: ProfilePage),
          ],
        ),
        AutoRoute(page: LoginPage),
      ],
    ),
  ],
)
class $AppRouter {}
