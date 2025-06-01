import 'package:abdoulaye/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart' show launchUrl;

class LandingPageWeb extends StatefulWidget {
  const LandingPageWeb({super.key});

  @override
  State<LandingPageWeb> createState() => _LandingPageWebState();
}

class _LandingPageWebState extends State<LandingPageWeb> {
  urlLauncher(String imgPath, String url) {
    return IconButton(
      icon: SvgPicture.asset(imgPath, width: 35.0, color: Colors.black),
      onPressed: () async {
        await launchUrl(Uri.parse(url));
      },
    );
  }

  var logger = Logger();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
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
      appBar: AppBar(
        iconTheme: IconThemeData(size: 25.0, color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          children: [
            Spacer(flex: 3),
            TabsWeb(title: "Accueil", route: '/'),
            Spacer(),
            TabsWeb(title: "Travaux", route: '/works'),
            Spacer(),
            TabsWeb(title: "Blog", route: '/blog'),
            Spacer(),
            TabsWeb(title: "À propos", route: '/about'),
            Spacer(),
            TabsWeb(title: "Contact", route: '/contact'),
            Spacer(),
          ],
        ),
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
                        Container(
                          padding: EdgeInsets.all(7.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.purpleAccent,
                              width: 2.0,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: Sans(text: "Flutter", size: 15.0),
                        ),
                        SizedBox(width: 7.0),
                        Container(
                          padding: EdgeInsets.all(7.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.purpleAccent,
                              width: 2.0,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: Sans(text: "Firebase", size: 15.0),
                        ),
                        SizedBox(width: 7.0),
                        Container(
                          padding: EdgeInsets.all(7.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.purpleAccent,
                              width: 2.0,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Sans(text: "Android", size: 15.0),
                        ),
                        SizedBox(width: 7.0),
                        Container(
                          padding: EdgeInsets.all(7.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.purpleAccent,
                              width: 2.0,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: Sans(text: "IOS", size: 15.0),
                        ),
                        SizedBox(width: 7.0),
                        Container(
                          padding: EdgeInsets.all(7.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.purpleAccent,
                              width: 2.0,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: Sans(text: "Windows", size: 15.0),
                        ),
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
          SizedBox(
            height: heightDevice,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SansBold(text: "Contact Me", size: 40.0),
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
                            controller: _firstNameController,
                            validator: (text) {
                              if (text!.isEmpty) {
                                return "Please type your first name";
                              }
                              return null;
                            },
                          ),
                          TextForm(
                            text: "Email",
                            containerWidth: 350.0,
                            hintText: "Please type your email",
                            controller: _emailController,
                            validator: (text) {
                              if (text!.isEmpty) {
                                return "Please type your email";
                              }
                              return null;
                            },
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
                            controller: _lastNameController,
                            validator: (text) {
                              if (text!.isEmpty) {
                                return "Please type your last name";
                              }
                              return null;
                            },
                          ),
                          TextForm(
                            text: "Phone number",
                            containerWidth: 350.0,
                            hintText: "Please typeyour Phone number",
                            controller: _phoneController,
                            validator: (text) {
                              if (text!.isEmpty) {
                                return "Please type your phone number";
                              }
                              return null;
                            },
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
                    controller: _messageController,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return "Please type your message";
                      }
                      return null;
                    },
                  ),

                  MaterialButton(
                    elevation: 20.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    height: 60.0,
                    minWidth: 200.0,
                    color: Colors.purpleAccent,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final addData = addDataFirestore();
                        var result = await addData.addMessage(
                          _firstNameController.text,
                          _lastNameController.text,
                          _phoneController.text,
                          _emailController.text,
                          _messageController.text,
                        );

                        if (result) {
                          _formKey.currentState!.reset();
                          if (context.mounted) {
                            dialogErreur(context, "Message envoyé");
                          }
                        } else {
                          if (context.mounted) {
                            dialogErreur(context, "Erreur d'envoi");
                          }
                        }
                      }
                    },
                    child: SansBold(text: "Submit", size: 20.0),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
