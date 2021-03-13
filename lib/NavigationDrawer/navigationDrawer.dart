import 'package:flutter/material.dart';
Drawer buildDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: ExactAssetImage("assets/images/pp.png"),
            ),
            accountName: Text(""),
            accountEmail: Text ("vsl@gmail.com"),
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
          },
        )
      ],
    ),
  );
}