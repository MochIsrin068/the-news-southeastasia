import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:the_news/bloc/language_bloc.dart';
import 'package:the_news/bloc/mode_bloc.dart';
import 'package:the_news/screen/home.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    return Consumer<ModeBloc>(
      builder: (context, modeBloc, _) {
        return Scaffold(
          backgroundColor: modeBloc.isDark ? Colors.black87 : Colors.white,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  CupertinoPageRoute(
                    builder: (context) => HomeScreen()
                  )
                );
              },
              icon: Icon(Icons.close,
                  color: modeBloc.isDark ? Colors.white : Colors.black87),
            ),
            backgroundColor: modeBloc.isDark ? Colors.black87 : Colors.white,
            elevation: 0.0,
            title: Text("Setting",
                style: TextStyle(
                    color: modeBloc.isDark ? Colors.white : Colors.black87)),
            centerTitle: true,
          ),
          body: Container(
            padding: EdgeInsets.all(10.0),
            child: ListView(
              children: <Widget>[
                Divider(),
                SizedBox(
                  height: 10.0,
                ),
                Card(
                  color: modeBloc.isDark ? Colors.black87 : Colors.white,
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Dark Mode : ",
                            style: TextStyle(
                                color: modeBloc.isDark
                                    ? Colors.white
                                    : Colors.black87)),
                        Switch(
                          onChanged: (newValue) {
                            modeBloc.isDark = newValue;
                          },
                          value: modeBloc.isDark,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Card(
                  color: modeBloc.isDark ? Colors.black87 : Colors.white,
                  child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: Consumer<LanguageBloc>(
                        builder: (context, languageSnap, _) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Language : ",
                                  style: TextStyle(
                                      color: modeBloc.isDark
                                          ? Colors.white
                                          : Colors.black87)),
                              DropdownButton(
                                value: languageSnap.languageValue,
                                items: [
                                  DropdownMenuItem(
                                    value: "id",
                                    child: Text("Indonesia",
                                        style: TextStyle(
                                            color: modeBloc.isDark
                                                ? Colors.blueAccent
                                                : Colors.black87)),
                                  ),
                                  DropdownMenuItem(
                                    value: "ph",
                                    child: Text("Phillipins",
                                        style: TextStyle(
                                            color: modeBloc.isDark
                                                ? Colors.blueAccent
                                                : Colors.black87)),
                                  ),
                                  DropdownMenuItem(
                                    value: "my",
                                    child: Text("Malaysia",
                                        style: TextStyle(
                                            color: modeBloc.isDark
                                                ? Colors.blueAccent
                                                : Colors.black87)),
                                  ),
                                  DropdownMenuItem(
                                    value: "th",
                                    child: Text("Thailand",
                                        style: TextStyle(
                                            color: modeBloc.isDark
                                                ? Colors.blueAccent
                                                : Colors.black87)),
                                  ),
                                  DropdownMenuItem(
                                    value: "sg",
                                    child: Text("Singapore",
                                        style: TextStyle(
                                            color: modeBloc.isDark
                                                ? Colors.blueAccent
                                                : Colors.black87)),
                                  ),
                                ],
                                onChanged: (newValue) {
                                  languageSnap.languageValue = newValue;
                                },
                              )
                            ],
                          );
                        },
                      )),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
