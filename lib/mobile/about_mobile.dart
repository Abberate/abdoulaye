import 'package:abdoulaye/components.dart';
import 'package:flutter/material.dart';

class AboutMobile extends StatefulWidget {
  const AboutMobile({super.key});

  @override
  State<AboutMobile> createState() => _AboutMobileState();
}

class _AboutMobileState extends State<AboutMobile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(size: 35.0, color: Colors.black),
        ),
        endDrawer: DrawersMobile(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              CircleAvatar(
                radius: 117.0,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: 113.0,
                  backgroundColor: Colors.purpleAccent,
                  child: CircleAvatar(
                    radius: 110.0,
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      "assets/image-circle.png",
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SansBold(text: "About Me", size: 30.0),
                    SizedBox(height: 10.0),
                    Sans(
                      text:
                          "Hello i'm Abdoulaye I Specialize in flutter development",
                      size: 15.0,
                    ),
                    Sans(
                      text:
                          "I strive to ensure astounding performence with state of ",
                      size: 15.0,
                    ),
                    Sans(
                      text:
                          "the art security for android , Ios , Web , Mac & Linux",
                      size: 15.0,
                    ),
                    SizedBox(height: 15.0),
                    Wrap(
                      spacing: 7.0,
                      runSpacing: 7.0,
                      children: [
                        purpleContainer(text: "Flutter"),
                        SizedBox(width: 7.0),
                        purpleContainer(text: "Firebase"),
                        SizedBox(width: 7.0),
                        purpleContainer(text: "Android"),
                        SizedBox(width: 7.0),
                        purpleContainer(text: "IOS"),
                        SizedBox(width: 7.0),
                        purpleContainer(text: "Windows"),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.0),

              //webDevelopment, Second section
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedCard(imagePath: "WebBuild.png", width: 200.0),
                  SizedBox(height: 30.0),
                  SansBold(text: "Web development", size: 20.0),
                  SizedBox(height: 10.0),
                ],
              ),
              Sans(
                text:
                    "I'm here to build your presence online with state of the art web apps",
                size: 15.0,
              ),
              //App Development, third section
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedCard(
                    imagePath: "app.png",
                    width: 200.0,
                    reverse: true,
                  ),
                  SizedBox(height: 20.0),
                  SansBold(text: "app development", size: 20.0),
                  SizedBox(height: 10.0),
                ],
              ),
              Sans(
                text:
                    "Do you need a high-performance, responsive and beautiful app? Don't worry, I've got you covered",
                size: 15.0,
              ),
              //Back-end Development, last section
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedCard(imagePath: "firebase.png", width: 200.0),
                  SizedBox(height: 20.0),
                  SansBold(text: "Back-end development", size: 20.0),
                  SizedBox(height: 10.0),
                ],
              ),
              Sans(
                text:
                    "Do you want your back-end to be highly scalable and secure ? Let's have a conversation on how I can help you with that ",
                size: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
