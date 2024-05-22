import 'package:cricket_dls/views/format_of_match.dart';
import 'package:cricket_dls/views/team_one_details.dart';
import 'package:get/get.dart';

import '../views/final_result.dart';
import '../views/suspension.dart';
import '../views/team_two_details.dart';
import '../views/userDashboard.dart';

appRoutes() => [
      GetPage(
        name: '/userDashboard',
        page: () => const UserDashboard(),
      ),
      GetPage(
        name: '/format',
        page: () => const FormatOfMatch(),
      ),
      GetPage(
        name: '/teamOne',
        page: () => const DetailsTeamOne(),
      ),
      GetPage(
        name: '/teamTwo',
        page: () => const DetailsTeamTwo(),
      ),
      GetPage(
        name: '/suspension',
        page: () => const Suspension(),
      ),
      GetPage(
        name: '/finalResult',
        page: () => const FinalResult(),
      ),
    ];
