import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:footer/ListItem/tabBar.dart';
import 'package:footer/listItemDetail/detailListItem.dart';
import 'package:footer/apis.dart';
import 'package:http/http.dart' as http;

class ListJson extends StatefulWidget {
  var index;
  ListJson(this.index);
  @override
  _ListJsonState createState() => _ListJsonState();
}

class _ListJsonState extends State<ListJson> {
  List jsonData=[];
  _getListmodel() async{
    // var listData=await http.get("http://www.json-generator.com/api/json/get/cgrwPFpbsi?indent=2");
    // var jsonData=json.decode(listData.body);
    // List<ListModel> listModel=[];
    // for(var model in jsonData)
    // {
    //   ListModel listModels=ListModel(model["id"], model["exam"], model["department"], model["image"]);
    //   listModel.add(listModels);
    // }
    // return listModel;
    mainCategoryApi().then((value){
      var jsonData1=json.decode(value.body);
      List jsonData2 =  jsonData1["data"];
      for (var item in jsonData2) {
          print(widget.index);
        if(item["parent_id"] == widget.index.toString()){
          setState(() {
        print(item);
          jsonData.add(item);
          });
       }
      }
  
    } );
  }
  @override
  void initState() {
    // TODO: implement initState
    _getListmodel();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          /*leading: GestureDetector(
            onTap: (){},
            child: Icon(Icons.arrow_back),
          ),*/
          title: Text("Exam List"),
        ),
        body: Container(
          child: jsonData == null? 
          new Center(child: Text("Loading..."),)
          : new ListView.builder(
                  itemCount: jsonData.length,
                  itemBuilder: (BuildContext context, int index){
                    return Card(
                      color: Color(0xFFB3E5FC),
                      margin: const EdgeInsets.all(20.0),
                      child: ListTile(
                        onTap: (){
                          List<dynamic> subCat;
                          if (jsonData[index]["is_last"] == "0") {
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TabbedBarView(jsonData[index]["id"]),
                            ),
                          );
                          }else{
                            print("is Last is 1");  
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailListItem(jsonData[index]["id"]),
                            ),
                          );
                                                      
                          }
                        },
                        //leading: CircleAvatar(backgroundImage: NetworkImage(snapshot.data[index].image),),
                        title: Text(jsonData[index]["cat_name"]),
                        subtitle: Text(jsonData[index]["status"]),
                        
                      ),
                    );
                  },
                )
        ),
      );
  }
}
