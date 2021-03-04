import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:footer/Screens/Home/homeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
 String Name1 = "";
 String Email1 = "";
 String Image1 = "";
 getSpf() async{
   SharedPreferences spf = await SharedPreferences.getInstance();
   setState(() {
   Name1 = spf.getString("name");
   Email1 = spf.getString("email");
   Image1 = spf.getString("profile_pic");
   });
 }
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSpf();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("QuizSelf"),
        ),
        body: HomeScreen(),
        drawer: Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              //backgroundImage: ExactAssetImage("assets/images/pp.png"),
              backgroundImage: NetworkImage(Image1),
              //child: new Image.network("Image1"),
            ),
            accountName: Text(Name1),
            accountEmail: Text (Email1),
        ),
        ListTile(
          leading: Icon(Icons.refresh),
          title: Text("Refresh"),
          onTap: (){
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.feedback),
          title: Text("Feedback"),
          onTap: (){
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.language),
          title: Text("Select Language"),
          onTap: (){
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.live_help),
          title: Text("Help and Support"),
          onTap: (){
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.help_outline),
          title: Text("About Us"),
          onTap: (){
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text("Logout"),
          onTap: (){
            Navigator.pop(context);
            logOut();
          },
        )
      ],
    ),
  ),
      );
  }
  logOut()async{
    SharedPreferences spf = await SharedPreferences.getInstance();
    spf.remove("name");
    spf.remove("email");
    spf.remove("profile_pic");
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }
}