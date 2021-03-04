import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:footer/ListItem/listView.dart';
import 'package:footer/NavigationDrawer/navigationDrawer.dart';
import 'package:footer/constants.dart';
import 'package:footer/examList/examJsonList.dart';

class DashBoard extends StatelessWidget {

  List<String> events = [
    "HSSC",
    "SSC",
    "BANK",
    "RAILWAY",
    "POLICE",
    "ENGINEERING",
    "GATE",
    "JEE MAIN"
  ];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
              title: Text("QuizSelf"),
            /*  leading: GestureDetector(
              onTap: (){},
              child: Icon(Icons.menu),
            ),*/
          ),
          drawer: buildDrawer(context),
          body: Container(
            decoration: BoxDecoration(
                /*image: DecorationImage(
              image: AssetImage("assets/images/img.png"), fit: BoxFit.cover),*/
                ),
            child: Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: GridView(
                physics: BouncingScrollPhysics(),
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                children: events.map((title) {
                  return GestureDetector(
                    child: Card(
                      margin: const EdgeInsets.all(20.0),
                      child: getCardTitle(title),
                      color: vCardColor,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ListJson(
                              getCardTitle(title)=="HSSC"?0:
                              getCardTitle(title)=="SSC"?1:
                              getCardTitle(title)=="BANK"?2:
                              getCardTitle(title)=="RAILWAY"?3:
                              getCardTitle(title)=="POLICE"?4:
                              getCardTitle(title)=="JEE MAIN"?5:
                              getCardTitle(title)=="ENGINEERING"?6:
                              getCardTitle(title)=="GATE"?7:8
                              );
                          },
                        ),
                      );
                      Fluttertoast.showToast(
                        msg: title + "",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        textColor: Colors.black,
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          )),
    );
  }

  Column getCardTitle(String title) {
    String img = "";
    if (title == "HSSC")
      img = "assets/images/ic_icon_1.png";
    else if (title == "SSC")
      img = "assets/images/ic_icon_2.png";
    else if (title == "BANK")
      img = "assets/images/ic_icon_3.png";
    else if (title == "RAILWAY")
      img = "assets/images/ic_icon_4.png";
    else if (title == "POLICE")
      img = "assets/images/ic_icon_5.png";
    else if (title == "ENGINEERING")
      img = "assets/images/ic_icon_6.png";
    else if (title == "GATE")
      img = "assets/images/ic_icon_7.png";
    else
      img = "assets/images/ic_icon_8.png";

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Center(
          child: Container(
            child: new Stack(
              children: <Widget>[
                new Image.asset(
                  img,
                  width: 80.0,
                  height: 80.0,
                )
              ],
            ),
          ),
        ),
        Text(
          title,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}