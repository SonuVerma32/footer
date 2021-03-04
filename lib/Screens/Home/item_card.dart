import 'package:flutter/material.dart';
import 'package:footer/model/dashBoard.dart';
import '../../constants.dart';

class ItemCard extends StatelessWidget {
  final Dashboard dashboard;
  final Function press;

  const ItemCard({
    Key key,
    this.dashboard,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(vDefaultPadding),
              // For  demo we use fixed height  and width
              // Now we dont need them
               //height: 200,
             // width: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: dashboard.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${dashboard.id}",
                child: Image.asset(dashboard.image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Text(
              // products is out demo list
              dashboard.title,
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
