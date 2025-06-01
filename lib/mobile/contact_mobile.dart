import 'package:abdoulaye/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMobile extends StatefulWidget {
  const ContactMobile({super.key});

  @override
  State<ContactMobile> createState() => _ContactMobileState();
}

class _ContactMobileState extends State<ContactMobile> {
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
    var widthDevice = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
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
                  child: Image.asset("assets/image-circle.png"),
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
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 400.0,
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(size: 35.0, color: Colors.black),
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    "assets/contact_image.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ];
          },
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 25.0),
            child: Form(
              key: _formKey,
              child: Wrap(
                spacing: 20.0,
                runSpacing: 20.0,
                alignment: WrapAlignment.center,
                children: [
                  SansBold(text: "Contact me", size: 35.0),
                  TextForm(
                    text: "First Name",
                    containerWidth: widthDevice / 1.4,
                    hintText: "Please type your first Name",
                    controller: _firstNameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please type your first name";
                      }
                    },
                  ),
                  TextForm(
                    text: "Last Name",
                    containerWidth: widthDevice / 1.4,
                    hintText: "PLease type your last name",
                    controller: _lastNameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please type your last name";
                      }
                    },
                  ),
                  TextForm(
                    text: "Email",
                    containerWidth: widthDevice / 1.4,
                    hintText: "Please type your email",
                    controller: _emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please type your email";
                      }
                    },
                  ),
                  TextForm(
                    text: "Phone number",
                    containerWidth: widthDevice / 1.4,
                    hintText: "Please typeyour Phone number",
                    controller: _phoneController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please type your phone number";
                      }
                    },
                  ),
                  TextForm(
                    text: "Message",
                    containerWidth: widthDevice / 1.4,
                    hintText: "Your message  ",
                    maxLines: 10,
                    controller: _messageController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please type your message";
                      }
                    },
                  ),

                  MaterialButton(
                    elevation: 20.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    height: 60.0,
                    minWidth: widthDevice / 2.2,
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
        ),
      ),
    );
  }
}
