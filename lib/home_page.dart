import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  var title;
  MyHomePage({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.yellow.shade700,
        leading: Icon(Icons.arrow_back),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.screen_share,
                )),
          )
        ],
      ),
      body: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: <Widget>[
          constructWidget(),
          Positioned(
            top: 200.0 -
                56.0 /
                    2, //56.0 is the height of Material FAB, whic places it in the corect position
            right: 24.0,
            child: new FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.shopping_basket, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

Widget constructWidget() {
  String strData = "To help redue this morning's fuzz, make yourself this juice that includes natural sugar, vitamin C, antioxidants, electrolytes and supports the natural detoxification pathways in the liver and reduces inflammation. Recieve a crate with 30 Cactus Juices every month and hangovers will be history";
    return new Column(
      children: <Widget>[
        new Container(
          height: 200.0,
          color: Colors.yellow.shade700,
        ),
        Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 50.0,),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("The Cactus Hangover Cure", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.grey.shade700),),
                  Text("\u20B9 299", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.grey.shade700))
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(strData, style: TextStyle(fontSize: 16.0), textAlign: TextAlign.justify,),
              )
          ],
        ),
      )
    ],
  );
}
