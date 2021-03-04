import 'package:flutter/material.dart';

class SearchBar extends SearchDelegate<String> {
  final exams = [
    "exam #1",
    "exam #2",
    "exam #3",
    "exam #4",
    "exam #5",
    "exam #6",
    "exam #7",
    "exam #8",
    "exam #9",
    "exam #10",
    "exam #11",
    "exam #12",
    "exam #13",
    "exam #14",
    "exam #15",
    "exam #16",
    "exam #17",
    "exam #18",
    "exam #19",
    "exam #20"
  ];

  final recentExam = ["exam #1", "exam #2", "exam #3", "exam #4"];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(
        icon: Icon(Icons.clear), onPressed: () {
          query = "";
    })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: 100,
        child: Card(
          color: Colors.lightBlueAccent,
          child: Center(
            child: Text(query),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ? recentExam : exams.where((element) => element.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: (){
          showResults(context);
        },
        leading: Icon(Icons.assignment_outlined),
        title: RichText(
          text: TextSpan(
            text: suggestionList[index].substring(0,query.length),
            style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold,
            ),
            children:[
              TextSpan(
                text: suggestionList[index].substring(query.length),
                style: TextStyle(color: Colors.grey))
            ]),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}
