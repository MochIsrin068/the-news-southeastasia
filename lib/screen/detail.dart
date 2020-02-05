import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_news/bloc/mode_bloc.dart';

class DetailScreen extends StatelessWidget {
  final String img, title, desc, published;

  DetailScreen({this.img, this.title, this.desc, this.published});

  @override
  Widget build(BuildContext context) {
    return Consumer<ModeBloc>(builder: (context, modeBloc, _) {
      return Scaffold(
        backgroundColor: modeBloc.isDark ? Colors.black87 : Colors.white,
        body: Container(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Hero(
                    tag: title + desc,
                    child: Container(
                      height: 300.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30.0),
                              bottomRight: Radius.circular(30.0)),
                          image: DecorationImage(
                              image: NetworkImage(img), fit: BoxFit.cover)),
                    ),
                  ),
                  Positioned(
                    left: 10.0,
                    top: 30.0,
                    child: FloatingActionButton(
                      heroTag: 1,
                      backgroundColor: Colors.white,
                      mini: true,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30.0,
                    right: 10.0,
                    child: FloatingActionButton(
                      heroTag: 2,
                      backgroundColor: Colors.white,
                      mini: true,
                      onPressed: () {},
                      child: Icon(
                        Icons.bookmark_border,
                        color: Colors.black87,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: modeBloc.isDark ? Colors.white : Colors.black87,
                    ),
                  )),
              SizedBox(
                height: 4.0,
              ),
              Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    published,
                    style: TextStyle(
                        color:
                            modeBloc.isDark ? Colors.white70 : Colors.black54),
                    textAlign: TextAlign.left,
                  )),
              SizedBox(
                height: 10.0,
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    desc,
                    style: TextStyle(
                      color: modeBloc.isDark ? Colors.white : Colors.black87,
                    ),
                  )),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: MaterialButton(
                  elevation: 0.0,
                  minWidth: MediaQuery.of(context).size.width,
                  color: modeBloc.isDark ? Colors.cyan:  Colors.cyan,
                  onPressed: () {},
                  child: Text(
                    "Read More",
                    style: TextStyle(
                        color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
