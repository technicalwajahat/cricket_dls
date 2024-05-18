import '../views/userDashboard.dart';
import 'package:get/get.dart';

appRoutes() => [
      GetPage(
        name: '/userDashboard',
        page: () => const UserDashboard(),
      ),
    ];
