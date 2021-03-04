import 'package:flutter/material.dart';
import 'package:footer/ListItem/searchBar.dart';
import 'package:footer/ListItem/tabBar.dart';
import 'package:footer/listItemDetail/detailListItem.dart';

class ListViewItem extends StatelessWidget {
  List choices;
  ListViewItem(this.choices);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     /* appBar: AppBar(
        title: Text("Reasoning"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){
            showSearch(context: context, delegate: SearchBar());
          })
          *//*Padding(padding: EdgeInsets.only(right: 30.0),
            child: GestureDetector(
              onTap: (){

              },
              child: Icon(Icons.search),
            ),
          )*//*
        ],
      ),*/
      body: _buildListView(context),
    );
  }

  ListView _buildListView(BuildContext context) {
    return ListView.builder(
      itemCount: choices.length,
      itemBuilder: (BuildContext context, index) {
        return Card(
          margin: const EdgeInsets.all(15.0),
          child: ListTile(
            tileColor: Color(0xFFB3E5FC),
            title: Text(choices1[index]["cat_name"]+"exam #$index"),
            subtitle: Text("180 Ques - 180 minutes"),
            leading: Icon(Icons.assignment_outlined),
            trailing: IconButton(
                icon: Icon(Icons.arrow_circle_down),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailListItem(index),
                    ),
                  );
                }),
          ),
        );
      },
    );
  }
}
