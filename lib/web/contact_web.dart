import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components.dart';

class ContactWeb extends StatefulWidget {
  const ContactWeb({super.key});

  @override
  State<ContactWeb> createState() => _ContactWebState();
}

class _ContactWebState extends State<ContactWeb> {
  urlLauncher(String imgPath, String url) {
    return IconButton(
      icon: SvgPicture.asset(imgPath, width: 35.0, color: Colors.black),
      onPressed: () async {
        await launchUrl(Uri.parse(url));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.purpleAccent,
              radius: 73.0,
              child: CircleAvatar(
                radius: 70.0,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('image.jpg'),
              ),
            ),
            SizedBox(height: 15.0),
            SansBold(text: "Abdoulaye B", size: 30.0),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                urlLauncher("instagram.svg", "https://www.instagram.com"),
                urlLauncher("twitter.svg", "https://www.twitter.com"),
                urlLauncher("github.svg", "https://www.github.com"),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 400.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'contact_image.jpg',
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(size: 25.0, color: Colors.black),
              title: Row(
                children: [
                  Spacer(flex: 3),
                  TabsWeb(title: 'Home', route: '/'),
                  Spacer(),
                  TabsWeb(title: 'Works', route: '/works'),
                  Spacer(),
                  TabsWeb(title: 'Blog', route: '/blog'),
                  Spacer(),
                  TabsWeb(title: 'About', route: '/about'),
                  Spacer(),
                  TabsWeb(title: 'Contact', route: '/contact'),
                  Spacer(),
                ],
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30.0),
              SansBold(text: "Contact Me", size: 40.0),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    spacing: 15,
                    children: [
                      TextForm(
                        text: "First Name",
                        containerWidth: 350.0,
                        hintText: "Please type your first Name",
                      ),
                      TextForm(
                        text: "Email",
                        containerWidth: 350.0,
                        hintText: "Please type your email",
                      ),
                    ],
                  ),
                  Column(
                    spacing: 15,
                    children: [
                      TextForm(
                        text: "Last Name",
                        containerWidth: 350.0,
                        hintText: "PLease type your last name",
                      ),
                      TextForm(
                        text: "Phone number",
                        containerWidth: 350.0,
                        hintText: "Please typeyour Phone number",
                      ),
                    ],
                  ),
                ],
              ),
              TextForm(
                text: "Message",
                containerWidth: widthDevice / 1.5,
                hintText: "Your message  ",
                maxLines: 10,
              ),
              SizedBox(height: 20.0),
              MaterialButton(
                elevation: 20.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                height: 60.0,
                minWidth: 200.0,
                color: Colors.purpleAccent,
                onPressed: () {},
                child: SansBold(text: "Submit", size: 20.0),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
