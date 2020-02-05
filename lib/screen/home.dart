import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:the_news/bloc/language_bloc.dart';
import 'package:the_news/bloc/mode_bloc.dart';
import 'package:the_news/components/list/newsCard.dart';
import 'package:the_news/components/shimmer/shimmerNewsCard.dart';
import 'package:the_news/screen/allNews.dart';
import 'package:the_news/screen/detail.dart';
import 'package:the_news/screen/setting.dart';
import 'package:the_news/service/popularNews.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    return Consumer2<ModeBloc, LanguageBloc>(
      builder: (context, modeBloc, languageBloc, _) {
        return Scaffold(
          backgroundColor: modeBloc.isDark ? Colors.black87 : Colors.white,
          appBar: AppBar(
            leading: languageBloc.languageValue == "id"
                ? Container(
                    margin: EdgeInsets.only(left: 10.0),
                    child: Image.asset(
                      "assets/img/id.png",
                      height: 36.0,
                      width: 36.0,
                    ),
                  )
                : languageBloc.languageValue == "my"
                    ? Container(
                        margin: EdgeInsets.only(left: 10.0),
                        child: Image.asset(
                          "assets/img/my.png",
                          height: 36.0,
                          width: 36.0,
                        ),
                      )
                    : languageBloc.languageValue == "th"
                        ? Container(
                            margin: EdgeInsets.only(left: 10.0),
                            child: Image.asset(
                              "assets/img/th.png",
                              height: 36.0,
                              width: 36.0,
                            ),
                          )
                        : languageBloc.languageValue == "ph"
                            ? Container(
                                margin: EdgeInsets.only(left: 10.0),
                                child: Image.asset(
                                  "assets/img/ph.png",
                                  height: 36.0,
                                  width: 36.0,
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.only(left: 10.0),
                                child: Image.asset(
                                  "assets/img/sg.png",
                                  height: 20.0,
                                  width: 20.0,
                                ),
                              ),
            backgroundColor: modeBloc.isDark ? Colors.black87 : Colors.white,
            elevation: 0.0,
            title: Text("The News Southeastasia",
                style: TextStyle(
                    color: modeBloc.isDark ? Colors.white : Colors.black87)),
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.settings,
                  color: modeBloc.isDark ? Colors.white : Colors.black87,
                ),
                onPressed: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => SettingScreen()));
                },
              )
            ],
          ),
          body: Container(
            padding: EdgeInsets.all(10.0),
            child: ListView(
              children: <Widget>[
                Divider(),
                SizedBox(height: 6.0),
                Text("Breaking News",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color:
                            modeBloc.isDark ? Colors.white : Colors.black87)),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, i) {
                      return FutureBuilder(
                        future: populerNews(languageBloc.api),
                        builder: (context, snap) {
                          if (snap.hasData) {
                            List snapdata =
                                snap.data["articles"].reversed.toList();
                            return InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                            desc: snapdata[i]["description"],
                                            img: snapdata[i]["urlToImage"] ==
                                                    null
                                                ? "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQKlCXaJJbpP09Ur-cpRRX0Cb5fRt7y1empst66VRy_zx-5eh5J"
                                                : snapdata[i]["urlToImage"],
                                            published: snapdata[i]
                                                ["publishedAt"],
                                            title: snapdata[i]["title"],
                                          )));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 10.0),
                                  width:
                                      MediaQuery.of(context).size.width - 100.0,
                                  child: Stack(
                                    children: <Widget>[
                                      Hero(
                                        tag: snapdata[i]["title"] +
                                            snapdata[i]["description"],
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              100.0,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      snapdata[i]
                                                          ["urlToImage"]),
                                                  fit: BoxFit.cover),
                                              color: Colors.amber,
                                              borderRadius:
                                                  BorderRadius.circular(12.0)),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    10 +
                                                2),
                                        decoration: BoxDecoration(
                                            color: Colors.white60,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(12.0),
                                                bottomRight:
                                                    Radius.circular(12.0))),
                                        padding: EdgeInsets.all(20.0),
                                        child: Text(snapdata[i]["title"],
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      )
                                    ],
                                  ),
                                ));
                          } else {
                            return Container(
                              width: MediaQuery.of(context).size.width - 100.0,
                              child: Container(
                                margin: EdgeInsets.only(right: 10.0),
                                child: ShimmerNewsCard(),
                              ),
                            );
                          }
                        },
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                SizedBox(),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Hot News",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: modeBloc.isDark
                                  ? Colors.white
                                  : Colors.black87)),
                      FlatButton(
                        color:
                            modeBloc.isDark ? Colors.black87 : Colors.grey[100],
                        padding: EdgeInsets.all(6.0),
                        onPressed: () {
                          Navigator.of(context).push(CupertinoPageRoute(
                              builder: (context) => AllNews()));
                        },
                        child: Text("All",
                            style: TextStyle(
                                color: modeBloc.isDark
                                    ? Colors.white
                                    : Colors.black87)),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                FutureBuilder(
                  future: populerNews(languageBloc.api),
                  builder: (context, snap) {
                    if (snap.hasData) {
                      return ListView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 5,
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
