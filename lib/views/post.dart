// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_html_view/flutter_html_view.dart';

class Post extends StatefulWidget {
  final String imageUrl, title, desc;
  Post({this.title, this.desc, this.imageUrl});
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  Widget postContent(htmlContent) {
    // return HtmlView(
    //   data: htmlContent,
    //   onLaunchFail: (url){
    //     print("Launch $url failed");
    //   },
    //   scrollable: false,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                Image.network(widget.imageUrl),
                SizedBox(height: 8),
                Text(widget.title, style: TextStyle(fontSize: 18)),
                SizedBox(height: 6),
                postContent(widget.desc)
              ],
            )),
      ),
    );
  }
}
