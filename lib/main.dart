import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_news/bloc/language_bloc.dart';
import 'package:the_news/bloc/mode_bloc.dart';
import 'package:the_news/screen/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ModeBloc>(
          create: (context) => ModeBloc(),
        ),
        ChangeNotifierProvider<LanguageBloc>(
          create: (context) => LanguageBloc(),
        )
      ],
      child: MaterialApp(
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
