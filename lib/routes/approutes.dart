import 'package:cricket_dls/views/format_of_match.dart';
import 'package:cricket_dls/views/team_one_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/final_result.dart';
import '../views/suspension.dart';
import '../views/team_two_details.dart';
import '../views/userDashboard.dart';

appRoutes() => [
      GetPage(
        name: '/userDashboard',
        page: () => const UserDashboard(),
        transition: Transition.rightToLeft,
        transitionDuration: Durations.extralong2,
      ),
      GetPage(
        name: '/format',
        page: () => const FormatOfMatch(),
        transition: Transition.rightToLeft,
        transitionDuration: Durations.extralong2,
      ),
      GetPage(
        name: '/teamOne',
        page: () => const DetailsTeamOne(),
        transition: Transition.rightToLeft,
        transitionDuration: Durations.extralong2,
      ),
      GetPage(
        name: '/teamTwo',
        page: () => const DetailsTeamTwo(),
        transition: Transition.rightToLeft,
        transitionDuration: Durations.extralong2,
      ),
      GetPage(
        name: '/suspension',
        page: () => const Suspension(),
        transition: Transition.rightToLeft,
        transitionDuration: Durations.extralong2,
      ),
      GetPage(
        name: '/finalResult',
        page: () => const FinalResult(),
        transition: Transition.rightToLeft,
        transitionDuration: Durations.extralong2,
      ),
    ];
