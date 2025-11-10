import 'package:flutter/material.dart';
import 'package:devmuscle_pi3/pages/home_page.dart';
import 'package:devmuscle_pi3/pages/cardio/register_cardio_page.dart';
import 'package:devmuscle_pi3/pages/cardio/card_list.dart';
import 'package:devmuscle_pi3/pages/cardio/cardio_chart_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DevMuscle',

      // Tema do app
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),

      // Rota inicial
      initialRoute: '/home',

      // Rotas nomeadas
      routes: {
        '/home': (context) => const HomePage(),
        '/register-cardio': (context) => const RegisterCardioPage(),
        '/cardio-list': (context) => const CardioListPage(),
        '/cardio-chart': (context) => const CardioChartPage(),
        //testar novas páginas
        // '/edit-goal': (context) => const EditGoalPage(),
        // '/register-weight': (context) => const RegisterWeightPage(),
      },
    );
  }
}
