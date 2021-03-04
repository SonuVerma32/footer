import 'package:flutter/material.dart';
import 'package:footer/ListItem/listView.dart';
import 'package:footer/ListItem/searchBar.dart';
import 'package:footer/apis.dart';
import 'dart:convert';

class TabbedBarView extends StatefulWidget {
  var id;
  TabbedBarView(this.id);

  @override
  _TabbedBarViewState createState() => _TabbedBarViewState();
}

  List choices1=[];
class _TabbedBarViewState extends State<TabbedBarView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _subcatc();
  }
  void _subcatc(){
    choices1.clear();
    subCategoryApi().then((val){
      var response = json.decode(val.body);
      List res = response["data"];
          print(res);
      for (var item in res) {
        if(item["parent_id"] == widget.id.toString()){
          setState(() {
          choices1.add(item);
          });
          print(choices1);
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: choices.length,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text("Exam"),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.search), onPressed: (){
                showSearch(context: context, delegate: SearchBar());
              })],
            bottom: TabBar(
              indicatorColor: Color(0xFF03A9F4),
              isScrollable: true,
              labelColor: Color(0xFF03A9F4),
              tabs: choices.map<Widget>((Choice choice){
                return Tab(
                  text: choice.title,
                  icon: Icon(choice.icon),
                );
              }).toList(),
            ),
          ),
          body: TabBarView(
            children: choices.map((Choice choice){
              return Padding(padding: const EdgeInsets.all(0),
                child: ChoicePage(
                  choice: choice,
                ),
              );
            }).toList(),
          ),
        ),
      );
  }
}

class Choice{
  final String title;
  final IconData icon;

  const Choice({this.title, this.icon});
}
const List<Choice> choices = <Choice>[
  Choice(title: "Active", icon: Icons.assignment_outlined),
  Choice(title: "Attempted", icon: Icons.assignment)
];

class ChoicePage extends StatelessWidget{
  const ChoicePage({Key key, this.choice}) : super (key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Scaffold(

      body: ListViewItem(choices1),

    );
    /*Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 150.0, color: textStyle.color),
            Text(choice.title, style: textStyle)
          ],
        ),
      ),
    );*/
  }
}
