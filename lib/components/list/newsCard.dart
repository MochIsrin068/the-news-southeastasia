import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_news/bloc/mode_bloc.dart';

class NewsCard extends StatelessWidget {
  final String urlToImage, title, desc, publishedAt;

  NewsCard({this.urlToImage, this.title, this.desc, this.publishedAt});

  @override
  Widget build(BuildContext context) {
    return Consumer<ModeBloc>(
      builder: (context, modeBloc, _) {
        return Container(
          margin: EdgeInsets.only(bottom: 14.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Hero(
                tag: title + desc,
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(urlToImage), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.cyan),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(title,
                          style: TextStyle(
                              color: modeBloc.isDark
                                  ? Colors.white
                                  : Colors.black87,
                              fontWeight: FontWeight.bold),
                          maxLines: 2),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        desc,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 12.0,
                          color:
                              modeBloc.isDark ? Colors.white : Colors.black87,
                        ),
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      Text(publishedAt,
                          style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: modeBloc.isDark
                                  ? Colors.white70
                                  : Colors.black54)),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
