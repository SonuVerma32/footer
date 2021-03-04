import 'package:flutter/material.dart';
import 'package:footer/Screens/Home/item_card.dart';
import 'package:footer/Screens/Login/components/background.dart';
import 'package:footer/examList/examJsonList.dart';
import 'package:footer/model/dashBoard.dart';

import '../../constants.dart';

class HomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: size.height * 0.04),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: vDefaultPadding),
              child: GridView.builder(
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                   // mainAxisSpacing: vDefaultPadding,
                    crossAxisSpacing: vDefaultPadding,
                    childAspectRatio: 1.0,
                  ),
                  itemBuilder: (context, index) => ItemCard(
                        dashboard: products[index],
                        press: () =>
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => ListJson(
                                index
                               //products[index]
                               // dashboard : products[index],
                              ),
                            )),
                      )),
            ),
          ),
        ],
      ),
    );
  }
}
