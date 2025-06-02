import 'package:abdoulaye/components.dart';
import 'package:flutter/material.dart';

class AboutWeb extends StatefulWidget {
  const AboutWeb({super.key});

  @override
  State<AboutWeb> createState() => _AboutWebState();
}

class _AboutWebState extends State<AboutWeb> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: DrawersWeb(),
      appBar: AppBar(
        iconTheme: IconThemeData(size: 25.0, color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: TabsWebList(),
      ),
      body: ListView(
        children: [
          //About me first section
          SizedBox(
            height: 500.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SansBold(text: "About me", size: 40.0),
                    SizedBox(height: 15.0),
                    Sans(
                      text:
                          "Hello i'm Abdoulaye Boubacar I spécialize in flutter development",
                      size: 15.0,
                    ),
                    Sans(
                      text:
                          "I strive to ensure astounding performance with state of ",
                      size: 15.0,
                    ),
                    Sans(
                      text:
                          "the art security for Android, ios, web , Mac , Linux and Windows",
                      size: 15.0,
                    ),
                    SizedBox(height: 10.0),
                    Row(
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
                CircleAvatar(
                  radius: 147.0,
                  backgroundColor: Colors.purpleAccent,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 143.0,
                    child: CircleAvatar(
                      radius: 140.0,
                      child: Image.asset(
                        "assets/image-circle.png",
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //web dev second section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedCard(
                imagePath: 'WebBuild.png',
                height: 250.0,
                width: 250.0,
              ),
              SizedBox(
                width: widthDevice / 3,
                child: Column(
                  children: [
                    SansBold(text: "Web development", size: 30.0),
                    SizedBox(height: 15.0),
                    Sans(
                      text:
                          "I'm here to build your presence online with state of the art web apps.",
                      size: 15.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          // App develoment second section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: widthDevice / 3,
                child: Column(
                  children: [
                    SansBold(text: "App development", size: 30.0),
                    SizedBox(height: 15.0),
                    Sans(
                      text:
                          "Do you need a high-performance, responsive and beautiful app? Don't worry, I've got you covered.",
                      size: 15.0,
                    ),
                  ],
                ),
              ),
              AnimatedCard(
                imagePath: 'app.png',
                fit: BoxFit.contain,
                height: 250.0,
                width: 250.0,
                reverse: true,
              ),
            ],
          ),
          SizedBox(height: 20.0),
          // Back-end develoment third section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedCard(
                imagePath: 'firebase.png',
                fit: BoxFit.contain,
                height: 250.0,
                width: 250.0,
              ),
              SizedBox(
                width: widthDevice / 3,
                child: Column(
                  children: [
                    SansBold(text: "Back-end development", size: 30.0),
                    SizedBox(height: 15.0),
                    Sans(
                      text:
                          "Do you want your back-end to be highly scalable and secure ? Let's have a conversation on how I can help you with that ",
                      size: 20.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
