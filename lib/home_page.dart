import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = new ScrollController();
    _scrollController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverAppBar(
              leading: Icon(Icons.arrow_back),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Icon(Icons.screen_share),
                )
              ],
              expandedHeight: 300.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset("assets/account_pictures/user_3.jpg",
                    fit: BoxFit.cover),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                  List.generate(1, (index) => constructWidget())),
            )
          ],
        ),
        buildPositioned(),
      ],
    ));
  }

  Positioned buildPositioned() {
    //starting fab position
    final double defaultTopMargin = 300.0 - 4.0;
    //pixels from top where scaling should start
    final double scaleStart = 96.0;
    //pixels from top where scaling should end
    final double scaleEnd = scaleStart / 2;

    double top = defaultTopMargin;
    double scale = 1.0;
    if (_scrollController.hasClients) {
      double offset = _scrollController.offset;
      top -= offset;
      if (offset < defaultTopMargin - scaleStart) {
        //offset small => don't scale down
        scale = 1.0;
      } else if (offset < defaultTopMargin - scaleEnd) {
        //offset between scaleStart and scaleEnd => scale down
        scale = (defaultTopMargin - scaleEnd - offset) / scaleEnd;
      } else {
        //offset passed scaleEnd => hide fab
        scale = 0.0;
      }
    }
    
    return Positioned(
      top: top,
      right: 16.0,
      child: Transform(
        transform: new Matrix4.identity()..scale(scale),
              child: new FloatingActionButton(
          onPressed: () {},
          child: new Icon(Icons.shopping_cart),
        ),
      ),
    );
  }
}

Widget constructWidget() {
  String strData =
      "To help redue this morning's fuzz, make yourself this juice that includes natural sugar, vitamin C, antioxidants, electrolytes and supports the natural detoxification pathways in the liver and reduces inflammation. Recieve a crate with 30 Cactus Juices every month and hangovers will be history";
  return new Column(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50.0,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "The Cactus Hangover Cure",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
                Text("\u20B9 299",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87))
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                strData,
                style: TextStyle(fontSize: 16.0, color: Colors.black87),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 24.0),
                  child: Icon(
                    Icons.loyalty,
                    size: 28.0,
                    color: Colors.grey.shade500,
                  ),
                ),
                Text(
                  "See all products by",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey.shade500),
                ),
                Text(
                  "  Dose Organic",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade500),
                )
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Divider(),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 24.0),
                      child: Icon(
                        Icons.filter_vintage,
                        size: 28.0,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    Text(
                      "4.8",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade500),
                    ),
                    Text(
                      "  out of 5",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey.shade500),
                    ),
                  ],
                ),
                Text(
                  "Show Reviews",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.redAccent),
                )
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Divider(),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: <Widget>[
                Text("More hangover cures",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(
              height: 36.0,
            ),
            SizedBox(
              height: 120.0,
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, position) {
                  String imgUrl = "assets/account_pictures/user_" +
                      (position + 1).toString() +
                      ".jpg";
                  return Padding(
                    padding: const EdgeInsets.only(right: 36.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Material(
                        elevation: 8.0,
                        child: Container(
                          width: 120.0,
                          child: Image.asset(imgUrl),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
           SizedBox(height: 500.0,)
          ],
        ),
      )
    ],
  );
}
