import 'package:aries_flutter_challenge/blocs/options/options_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ui/options/home_page.dart';
import 'values/app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.getLightThemeData(Brightness.light),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => OptionsBloc(),
        child: const HomePage(),
      ),
    );
  }
}
