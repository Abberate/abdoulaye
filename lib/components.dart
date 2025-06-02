import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

urlLauncher(String imgPath, String url) {
  return IconButton(
    icon: SvgPicture.asset(imgPath, width: 35.0, color: Colors.black),
    onPressed: () async {
      await launchUrl(Uri.parse(url));
    },
  );
}

Future dialogErreur(context, String title) {
  return showDialog(
    context: context,
    builder:
        (BuildContext context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          title: SansBold(text: title, size: 20.0),
        ),
  );
}

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

//variable

var logger = Logger();

final TextEditingController _firstNameController = TextEditingController();
final TextEditingController _lastNameController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _phoneController = TextEditingController();
final TextEditingController _messageController = TextEditingController();

//classes
class TabsWeb extends StatefulWidget {
  const TabsWeb({required this.title, required this.route, super.key});
  final String title;
  final route;

  @override
  State<TabsWeb> createState() => _TabsWebState();
}

class _TabsWebState extends State<TabsWeb> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(widget.route);
      },
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            isSelected = true;
          });
        },
        onExit: (_) {
          setState(() {
            isSelected = false;
          });
        },
        child: AnimatedDefaultTextStyle(
          curve: Curves.elasticIn,
          duration: Duration(milliseconds: 100),
          style: GoogleFonts.oswald(fontSize: 23.0, color: Colors.black),
          child: Text(
            widget.title,
            style:
                isSelected
                    ? GoogleFonts.poppins(
                      shadows: [
                        Shadow(color: Colors.black, offset: Offset(0, -8)),
                      ],
                      fontSize: 25.0,
                      color: Colors.transparent,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.purpleAccent,
                      decorationThickness: 2.0,
                    )
                    : GoogleFonts.poppins(fontSize: 20.0, color: Colors.black),
          ),
        ),
      ),
    );
  }
}

class TabsMobile extends StatefulWidget {
  final text;
  final route;
  const TabsMobile({super.key, required this.text, required this.route});

  @override
  State<TabsMobile> createState() => _TabsMobileState();
}

class _TabsMobileState extends State<TabsMobile> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 20.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      height: 50.0,
      minWidth: 200.0,
      color: Colors.black,
      child: Text(
        widget.text,
        style: GoogleFonts.openSans(fontSize: 20.0, color: Colors.white),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(widget.route);
      },
    );
  }
}

class TabsWebList extends StatefulWidget {
  const TabsWebList({super.key});

  @override
  State<TabsWebList> createState() => _TabsWebListState();
}

class _TabsWebListState extends State<TabsWebList> {
  @override
  Widget build(BuildContext context) {
    return const Row(
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
    );
  }
}

class DrawersWeb extends StatelessWidget {
  const DrawersWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}

class DrawersMobile extends StatelessWidget {
  const DrawersMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
              urlLauncher("instagram.svg", "https://www.instagram.com"),
              urlLauncher("twitter.svg", "https://www.twitter.com"),
              urlLauncher("github.svg", "https://www.github.com"),
            ],
          ),
        ],
      ),
    );
  }
}

class SansBold extends StatelessWidget {
  final text;
  final size;
  const SansBold({required this.text, required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(fontSize: size, fontWeight: FontWeight.bold),
    );
  }
}

class Sans extends StatelessWidget {
  final text;
  final size;
  const Sans({required this.text, required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(fontSize: size, fontWeight: FontWeight.bold),
    );
  }
}

class AbelCustom extends StatelessWidget {
  final text;
  final size;
  final color;
  final fontWeight;
  const AbelCustom({
    super.key,
    required this.text,
    required this.size,
    this.color,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.abel(
        fontSize: size,
        color: color ?? Colors.black,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    );
  }
}

class TextForm extends StatelessWidget {
  final text;
  final containerWidth;
  final hintText;
  final maxLines;
  final controller;
  final validator;

  const TextForm({
    super.key,
    required this.text,
    required this.containerWidth,
    required this.hintText,
    this.maxLines,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Sans(text: text, size: 15.0),
        SizedBox(height: 5.0),
        SizedBox(
          width: containerWidth,
          child: TextFormField(
            validator: validator,
            controller: controller,
            maxLines: maxLines == null ? null : maxLines,
            decoration: InputDecoration(
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(10.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(8.0),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purpleAccent),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple, width: 2.0),
                borderRadius: BorderRadius.circular(15.0),
              ),
              hintText: hintText,
              hintStyle: GoogleFonts.poppins(fontSize: 15),
            ),
          ),
        ),
      ],
    );
  }
}

class AnimatedCard extends StatefulWidget {
  final imagePath;
  final text;
  final fit;
  final reverse;
  final width;
  final height;

  const AnimatedCard({
    super.key,
    required this.imagePath,
    this.text,
    this.fit,
    this.reverse,
    this.width,
    this.height,
  });

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 4),
  )..repeat(reverse: true);

  late Animation<Offset> _animation = Tween(
    begin: widget.reverse == true ? Offset(0.0, 0.08) : Offset.zero,
    end: widget.reverse == true ? Offset.zero : Offset(0.0, 0.08),
  ).animate(_controller);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: Colors.purpleAccent),
        ),
        elevation: 30.0,
        shadowColor: Colors.purpleAccent,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                widget.imagePath,
                height: widget.height ?? 200.0,
                width: widget.width ?? 200.0,
                fit: widget.fit == null ? null : widget.fit,
              ),
              SizedBox(height: 10.0),
              widget.text == null
                  ? SizedBox()
                  : SansBold(text: widget.text, size: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}

class addDataFirestore {
  CollectionReference messagesCollection = FirebaseFirestore.instance
      .collection('messages');
  Future addMessage(
    final firstname,
    final lastname,
    final phoneNumber,
    final email,
    final message,
  ) {
    return messagesCollection
        .add({
          'firstname': firstname,
          'lastname': lastname,
          'email': email,
          'phoneNumber': phoneNumber,
          'message': message,
        })
        .then((value) {
          logger.d("Success");
          return true;
        })
        .catchError((error) {
          logger.e("Failed to add message: $error");
          return false;
        });
  }
}

class ContactFormWeb extends StatefulWidget {
  const ContactFormWeb({super.key});

  @override
  State<ContactFormWeb> createState() => _ContactFormWebState();
}

class _ContactFormWebState extends State<ContactFormWeb> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Form(
      key: _formKey,
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
                    controller: _firstNameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                  ),
                  TextForm(
                    text: "Email",
                    containerWidth: 350.0,
                    hintText: "Please type your email",
                    controller: _emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your last name';
                      }
                    },
                  ),
                  TextForm(
                    text: "Phone number",
                    containerWidth: 350.0,
                    hintText: "Please typeyour Phone number",
                    controller: _phoneController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your phone number';
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.0),
          TextForm(
            text: "Message",
            containerWidth: widthDevice / 1.5,
            hintText: "Your message  ",
            maxLines: 10,
            controller: _messageController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your message';
              }
            },
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
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}

class ContactFormMobile extends StatefulWidget {
  const ContactFormMobile({super.key});

  @override
  State<ContactFormMobile> createState() => _ContactFormMobileState();
}

class _ContactFormMobileState extends State<ContactFormMobile> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Form(
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
    );
  }
}
