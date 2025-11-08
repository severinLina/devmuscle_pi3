import 'package:devmuscle_pi3/pages/cardio/card_list.dart';
import 'package:devmuscle_pi3/pages/cardio/cardio_chart_page.dart';
import 'package:devmuscle_pi3/pages/cardio/register_cardio_page.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
// futuramente:
// import 'pages/edit_goal_page.dart';
// import 'pages/register_weight_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DevMuscle',
      theme: ThemeData(primarySwatch: Colors.blue),

      // Tela inicial do app
      initialRoute: '/home',

      // Registro de rotas nomeadas
      routes: {
        '/home': (context) => const MyWidget(), // sua HomePage
        '/register-cardio': (context) => const RegisterCardioPage(),
        '/cardio-list': (context) => const CardioListPage(),
        '/cardio-chart': (context) => const CardioChartPage(),
        // '/register-weight': (context) => const RegisterWeightPage(),

        // '/edit-goal': (context) => const EditGoalPage(),
        // '/register-weight': (context) => const RegisterWeightPage(),
      },
    );
  }
}
