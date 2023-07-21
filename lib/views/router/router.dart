import 'package:get/get.dart';
import 'package:sezon_app/views/router/route_name.dart';
import 'package:sezon_app/views/screens/auth/register/register_binding.dart';
import 'package:sezon_app/views/screens/home/product_details.dart';
import 'package:sezon_app/views/screens/mainApp/main_screen.dart';

import '../screens/auth/login/login_binding.dart';
import '../screens/auth/login/login_screen.dart';
import '../screens/auth/otp/otp_binding.dart';
import '../screens/auth/otp/otp_screen.dart';
import '../screens/auth/register/register_screen.dart';
import '../screens/mainApp/main_binding.dart';
import '../screens/profile/profile_binding.dart';
import '../screens/profile/profile_screen.dart';

class AppRoute {
  static final routes = <GetPage>[
    GetPage(
        name: RouteName.loginRoute,
        page: () => const LoginScreen(),
        binding: LoginBinding()),
    GetPage(
        name: RouteName.registerRoute,
        page: () => const RegisterScreen(),
        binding: RegisterBinding()),
    GetPage(
        name: RouteName.otpRoute,
        page: () => const OtpScreen(),
        binding: OtpBinding()),
    GetPage(
        name: RouteName.mainRoute,
        page: () => const MainScreen(),
        binding: MainBinding()),
    GetPage(
        name: RouteName.productDetailsRoute,
        page: () => const ProductDetailScreen(),
        binding: MainBinding()),

        GetPage(
        name: RouteName.profileRoute,
        page: () => const ProfileScreen(),
        binding: ProfileBinding()),
  ];
}
