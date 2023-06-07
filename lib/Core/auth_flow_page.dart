import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/Core/cubit/cubit_cubit.dart';
import 'package:myproject/Router/router.gr.dart';

class AuthflowPage extends StatelessWidget {
  const AuthflowPage({super.key});

  @override
  Widget build(BuildContext context) {
    var state = context.watch<AuthflowCubit>().state;

    return AutoRouter.declarative(
      routes: (handler) {
        switch (state.status) {
          case Status.intial:
            return [];
          case Status.loggedin:
            return [const DashboardRoute()];

          case Status.logout:
            return [const LoginRoute()];
        }
      },
    );
  }
}
