import 'package:get/get.dart';
import 'package:phibase_next_level/page/home/view/home_view.dart';
import 'package:phibase_next_level/page/login/view/login_view.dart';
class AppRoutes {
  // route name
  static const String initalRoute = '/';
  static const String login = '/login';
  static const String register = '/register';

  static const String createTimeline = '/createTimeline';
  static const String detailTimeline = '/detailTimeline';

  static const String home = '/home';
  static const String main = '/main';
  static const String item = '/item';
  static const String setting = '/setting';

  static List<GetPage> pages = [
    GetPage(
      name: login,
      page: () => const Login()
    ),
    GetPage(
      name: home,
      page: () => Home()
    ),
  ];
}