import 'package:flutter/material.dart';
import 'package:vineetgeek_app/views/post.dart';
import 'package:vineetgeek_app/wp-api.dart';
import 'package:html/parser.dart';

// import 'package:flutter_html_view/flutter_html_view.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vineet Geek'),
      ),
      body: Container(
          child: FutureBuilder(
        future: fetchWpPosts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  Map wppost = snapshot.data[index];

                  // return PostTile(
                  //   href: wppost["_links"]["wp:featuredmedia"][0]["href"],
                  //   title: wppost["title"]["rendered"],
                  //   // desc: wppost["excerpt"]["rendered"],
                  //   content: wppost["content"]["rendered"],
                  // );
                });
          }

          return Center(child: CircularProgressIndicator());
        },
      )),
    );
  }
}

class PostTile extends StatefulWidget {
  // final String href, title, desc, content;
  // PostTile({this.content, this.desc, this.href, this.title});

  @override
  _PostTileState createState() => _PostTileState();
}

class _PostTileState extends State<PostTile> {
  var imageUrl = "";

  get wppost => null;
  // Widget shortDescriptionView(){
  //   return HtmlView(
  //     data: widget.desc,
  //           onLaunchFail: (url){
  //       print("Launch $url failed");
  //     },
  //     scrollable: false,
  //   );

  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Post(
                      imageUrl: imageUrl,
                      // title: widget.title,
                      // desc: widget.content,
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(top: 8),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // FutureBuilder(
          //   future: fetchWpPostImageUrl(widget.href),
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       imageUrl = snapshot.data["guid"]["rendered"];
          //       return Image.network(snapshot.data["guid"]["rendered"]);
          //     }
          //     return Center(child: CircularProgressIndicator());
          //   },
          // ),
          SizedBox(height: 8),
          Text(wppost["title"]["rendered"]),
          // Text(
          //   widget.title,
          //   style: TextStyle(fontSize: 20),
          // ),
          SizedBox(height: 5),
          // Text(widget.desc)
          Text(parse((wppost["excerpt"]["rendered"]).toString())
              .documentElement
              .text),

          // shortDescriptionView()
        ]),
      ),
    );
  }
}
