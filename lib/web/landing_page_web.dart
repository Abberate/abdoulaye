import 'package:abdoulaye/components.dart';
import 'package:flutter/material.dart';

class LandingPageWeb extends StatefulWidget {
  const LandingPageWeb({super.key});

  @override
  State<LandingPageWeb> createState() => _LandingPageWebState();
}

class _LandingPageWebState extends State<LandingPageWeb> {
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
          //first page
          SizedBox(
            height: heightDevice - 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.purpleAccent,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          topLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 10.0,
                      ),

                      child: SansBold(text: "Hello I'm", size: 15.0),
                    ),
                    SizedBox(height: 10.0),
                    Sans(text: "Abdoulaye Boubacar", size: 55.0),
                    SizedBox(height: 10.0),
                    SansBold(text: "Flutter Developer", size: 25.0),
                    SizedBox(height: 15.0),
                    Row(
                      children: [
                        Icon(Icons.email, size: 15.0),
                        Sans(text: "abdoulaye222.ab@gmail.com", size: 15.0),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Icon(Icons.call, size: 15.0),
                        Sans(text: "+227 80 87 71 11", size: 15.0),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 15.0),
                        Sans(text: "Koubia - Niamey Niger", size: 15.0),
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
                      backgroundImage: AssetImage("assets/image-circle.png"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //second section
          SizedBox(
            height: heightDevice / 1.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("web.png", height: widthDevice / 1.5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Sans(text: "About me", size: 40.0),
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
              ],
            ),
          ),
          //third section
          SizedBox(
            height: heightDevice / 1.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SansBold(text: "What I do ?", size: 40.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedCard(
                      imagePath: 'WebBuild.png',
                      text: "Web development",
                    ),
                    AnimatedCard(
                      imagePath: 'app.png',
                      text: "App development",
                      fit: BoxFit.contain,
                      reverse: true,
                    ),
                    AnimatedCard(
                      imagePath: 'firebase.png',
                      text: "Back-end development",
                    ),
                  ],
                ),
              ],
            ),
          ),
          //fourth section
          SizedBox(height: 15.0),
          ContactFormWeb(),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
