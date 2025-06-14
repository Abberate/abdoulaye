import 'package:abdoulaye/components.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Blog extends StatefulWidget {
  const Blog({super.key});

  @override
  State<Blog> createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  @override
  Widget build(BuildContext context) {
    bool isWeb = MediaQuery.of(context).size.width > 800;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        endDrawer: DrawersMobile(),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                elevation: 0.0,
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(size: 35.0, color: Colors.black),
                expandedHeight: isWeb ? 500.0 : 400.0,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: isWeb ? false : true,
                  title: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: isWeb ? 7.0 : 4.0,
                    ),
                    child: AbelCustom(
                      text: "Wellcome to my Blog",
                      size: isWeb ? 30.0 : 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  background: Image.asset(
                    "assets/blog.jpg",
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ];
          },
          body: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('articles').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, index) {
                    var article = snapshot.data!.docs[index];
                    return BlogPost(
                      title: article['title'],
                      body: article['body'],
                      isWeb: isWeb,
                    );
                  },
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}

class BlogPost extends StatefulWidget {
  final String title;
  final String body;
  final bool isWeb;
  const BlogPost({
    super.key,
    required this.title,
    required this.body,
    required this.isWeb,
  });

  @override
  State<BlogPost> createState() => _BlogPostState();
}

class _BlogPostState extends State<BlogPost> {
  bool expand = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          widget.isWeb
              ? EdgeInsets.only(left: 70.0, right: 70.0, top: 40.0)
              : EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.0),
          border: Border.all(
            color: Colors.black,
            style: BorderStyle.solid,
            width: 1.0,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.0),
                    color: Colors.black,
                  ),
                  child: AbelCustom(
                    text: widget.title,
                    size: 25.0,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      expand = !expand;
                    });
                  },
                  icon: Icon(
                    Icons.arrow_drop_down_circle_rounded,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 7.0),
            Text(
              widget.body,
              style: GoogleFonts.openSans(fontSize: 15.0, color: Colors.black),
              maxLines: expand ? null : 3,
              overflow: expand ? TextOverflow.visible : TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
