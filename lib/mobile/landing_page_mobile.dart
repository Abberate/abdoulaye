import 'package:abdoulaye/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPageMobile extends StatefulWidget {
  const LandingPageMobile({super.key});

  @override
  State<LandingPageMobile> createState() => _LandingPageMobileState();
}

class _LandingPageMobileState extends State<LandingPageMobile> {
  purpleContainer({required String text}) {
    return Container(
      padding: EdgeInsets.all(7.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.purpleAccent,
          width: 2.0,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Sans(text: text, size: 15.0),
    );
  }

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
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(size: 35.0, color: Colors.black),
        ),
        endDrawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DrawerHeader(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                    border: Border.all(width: 3.0),
                  ),
                  child: Image.asset(
                    "assets/image-circle.png",
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
              TabsMobile(text: 'Home', route: '/'),
              SizedBox(height: 20.0),
              TabsMobile(text: 'Works', route: '/works'),
              SizedBox(height: 20.0),
              TabsMobile(text: 'Blog', route: '/blog'),
              SizedBox(height: 20.0),
              TabsMobile(text: 'About', route: '/about'),
              SizedBox(height: 20.0),
              TabsMobile(text: 'Contact', route: '/contact'),
              SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed:
                        () async => await urlLauncher(
                          "instagram.svg",
                          "https://www.instagram.com",
                        ),
                    icon: SvgPicture.asset(
                      "assets/instagram.svg",
                      color: Colors.black,
                      width: 35.0,
                    ),
                  ),
                  IconButton(
                    onPressed:
                        () async => await urlLauncher(
                          "instagram.svg",
                          "https://www.x.com",
                        ),
                    icon: SvgPicture.asset(
                      "assets/twitter.svg",
                      color: Colors.black,
                      width: 35.0,
                    ),
                  ),
                  IconButton(
                    onPressed:
                        () async => await urlLauncher(
                          "instagram.svg",
                          "https://www.github.com",
                        ),
                    icon: SvgPicture.asset(
                      "assets/github.svg",
                      color: Colors.black,
                      width: 35.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            //Intro Fisrt Section
            CircleAvatar(
              radius: 117.0,
              backgroundColor: Colors.purpleAccent,
              child: CircleAvatar(
                radius: 110.0,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/image-circle.png'),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 25.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.purpleAccent,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 20.0,
                        ),
                        child: SansBold(text: "Hello I'm", size: 15.0),
                      ),
                      SansBold(text: "Abdoulaye Boubacar", size: 40.0),

                      SansBold(text: "Flutter Developer", size: 20.0),
                    ],
                  ),
                  SizedBox(height: 15.0),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 30.0),
                      Wrap(
                        direction: Axis.vertical,
                        spacing: 3.0,
                        children: [
                          Icon(Icons.email),
                          Icon(Icons.call),
                          Icon(Icons.location_on),
                        ],
                      ),
                      SizedBox(width: 30.0),
                      Wrap(
                        direction: Axis.vertical,
                        spacing: 9.0,
                        children: [
                          Sans(text: "abdoulaye222.ab@gmail.com", size: 15.0),
                          Sans(text: "+227 80 87 71 11", size: 15.0),
                          Sans(text: "Koubia - Niamey Niger", size: 15.0),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 90.0),
            //About me second section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SansBold(text: "About Me", size: 30.0),
                  SizedBox(height: 15.0),
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
                  SizedBox(height: 10.0),
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
            SizedBox(height: 15.0),
            //third session What I do
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Sans(text: "What I Do", size: 35.0),
                SizedBox(height: 35.0),
                AnimatedCard(
                  imagePath: 'WebBuild.png',
                  text: "Web development",
                  width: 300.0,
                ),
                SizedBox(height: 35.0),
                AnimatedCard(
                  imagePath: 'app.png',
                  text: "App development",
                  fit: BoxFit.contain,
                  reverse: true,
                  width: 300.0,
                ),
                SizedBox(height: 35.0),
                AnimatedCard(
                  imagePath: 'firebase.png',
                  text: "Back-end development",
                  width: 300.0,
                ),
                SizedBox(height: 60.0),
                //fourth session Contact Me
                Wrap(
                  runSpacing: 20.0,
                  spacing: 20.0,
                  alignment: WrapAlignment.center,
                  children: [
                    Sans(text: "Contact Me", size: 35.0),
                    TextForm(
                      text: "First Name",
                      containerWidth: widthDevice / 1.4,
                      hintText: "Please type your first Name",
                    ),
                    TextForm(
                      text: "Last Name",
                      containerWidth: widthDevice / 1.4,
                      hintText: "PLease type your last name",
                    ),
                    TextForm(
                      text: "Email",
                      containerWidth: widthDevice / 1.4,
                      hintText: "Please type your email",
                    ),
                    TextForm(
                      text: "Phone number",
                      containerWidth: widthDevice / 1.4,
                      hintText: "Please typeyour Phone number",
                    ),
                    TextForm(
                      text: "Message",
                      containerWidth: widthDevice / 1.4,
                      hintText: "Your message  ",
                      maxLines: 10,
                    ),

                    MaterialButton(
                      elevation: 20.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      height: 60.0,
                      minWidth: widthDevice / 2.2,
                      color: Colors.purpleAccent,
                      onPressed: () {},
                      child: SansBold(text: "Submit", size: 20.0),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
