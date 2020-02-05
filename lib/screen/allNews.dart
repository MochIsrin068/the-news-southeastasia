import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_news/bloc/language_bloc.dart';
import 'package:the_news/bloc/mode_bloc.dart';
import 'package:the_news/components/list/newsCard.dart';
import 'package:the_news/components/shimmer/shimmerNewsCard.dart';
import 'package:the_news/service/allNewsService.dart';

import 'detail.dart';

class AllNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2<ModeBloc, LanguageBloc>(
      builder: (context, modeBloc, languageBloc, _) {
        return Scaffold(
          backgroundColor: modeBloc.isDark ? Colors.black87 : Colors.white,
          appBar: AppBar(
            leading: Icon(Icons.arrow_back, color: modeBloc.isDark ? Colors.white : Colors.black87,),
            backgroundColor: modeBloc.isDark ? Colors.black87 : Colors.white,
            elevation: 0.0,
            title: Text("The News Southeastasia",
                style: TextStyle(
                    color: modeBloc.isDark ? Colors.white : Colors.black87)),
            centerTitle: true,
          ),
          body: Container(
            padding: EdgeInsets.all(10.0),
            child: ListView(
              children: <Widget>[
                Divider(),
                SizedBox(height: 10.0),
                FutureBuilder(
                  future: allNewsService(languageBloc.api),
                  builder: (context, snap) {
                    if (snap.hasData) {
                      return ListView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 20,
                        itemBuilder: (context, i) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                        desc: snap.data["articles"][i]
                                            ["description"],
                                        img: snap.data["articles"][i]
                                                    ["urlToImage"] ==
                                                null
                                            ? "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQKlCXaJJbpP09Ur-cpRRX0Cb5fRt7y1empst66VRy_zx-5eh5J"
                                            : snap.data["articles"][i]
                                                ["urlToImage"],
                                        published: snap.data["articles"][i]
                                            ["publishedAt"],
                                        title: snap.data["articles"][i]
                                            ["title"],
                                      )));
                            },
                            child: NewsCard(
                              desc: snap.data["articles"][i]["description"],
                              publishedAt: snap.data["articles"][i]
                                  ["publishedAt"],
                              title: snap.data["articles"][i]["title"],
                              urlToImage: snap.data["articles"][i]
                                          ["urlToImage"] ==
                                      null
                                  ? "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQKlCXaJJbpP09Ur-cpRRX0Cb5fRt7y1empst66VRy_zx-5eh5J"
                                  : snap.data["articles"][i]["urlToImage"],
                            ),
                          );
                        },
                      );
                    } else {
                      return ShimmerNewsCard();
                    }
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
