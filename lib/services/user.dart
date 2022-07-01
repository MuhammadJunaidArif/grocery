// ignore_for_file: prefer_const_constructors, implementation_imports, unnecessary_import, unused_import, prefer_if_null_operators

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../provider/theme_ dark_provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _addressTextController =
      TextEditingController(text: "");
  @override
  void dispose() {
    _addressTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,

              // ignore: prefer_const_literals_to_create_immutables
              children: [
                RichText(
                  text: TextSpan(
                      text: "Hi,  ",
                      style: TextStyle(
                          color: Colors.cyan,
                          fontSize: 27,
                          fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'MyName',
                          style: TextStyle(
                              color: color,
                              fontSize: 25,
                              fontWeight: FontWeight.w600),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('my name pressed');
                            },
                        )
                      ]),
                ),
                SizedBox(
                  height: 5,
                ),
                TextWidget(
                  text: "Junaidarif1099@gmail.com",
                  color: color,
                  textSize: 17,
                ),
                SizedBox(
                  height: 30,
                ),
                Divider(thickness: 2),
                SizedBox(
                  height: 20,
                ),
                _ListTile(
                  title: "Addresss",
                  icon: IconlyLight.profile,
                  subtitle: 'My Address 1',
                  onpressed: () async {
                    await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Update'),
                          content: TextField(
                            onChanged: (value) {
                              // _addressTextController.text;
                            },
                            controller: _addressTextController,
                            maxLines: 5,
                            decoration:
                                InputDecoration(hintText: 'Your Address'),
                          ),
                        );
                      },
                    );
                  },
                  color: color,
                ),
                _ListTile(
                  title: "Orders",
                  icon: IconlyLight.bag,
                  onpressed: () {},
                  color: color,
                ),
                _ListTile(
                  title: "WishList",
                  icon: IconlyLight.heart,
                  onpressed: () {},
                  color: color,
                ),
                _ListTile(
                  title: "Viewed",
                  icon: IconlyLight.show,
                  onpressed: () {},
                  color: color,
                ),
                _ListTile(
                  title: "Forget Password",
                  icon: IconlyLight.unlock,
                  onpressed: () {},
                  color: color,
                ),
                SwitchListTile(
                  title: TextWidget(
                    text:
                        themeState.getDarkTheme ? 'Dark Theme' : 'Light Theme',
                    color: color,
                    textSize: 20,
                  ),
                  secondary: Icon(themeState.getDarkTheme
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined),
                  onChanged: (bool value) {
                    setState(() {
                      themeState.setDarkTheme = value;
                    });
                  },
                  value: themeState.getDarkTheme,
                ),
                _ListTile(
                  title: "Logout",
                  icon: IconlyLight.login,
                  onpressed: () {},
                  color: color,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _ListTile(
    {required String title,
    String? subtitle,
    required IconData icon,
    required Function onpressed,
    required Color color}) {
  return ListTile(
    title: TextWidget(
      text: title,
      color: color,
      textSize: 20,
    ),
    //  isTitle: true,),
    subtitle: TextWidget(
        text: (subtitle == null ? "" : subtitle), color: color, textSize: 18),
    leading: Icon(icon),
    trailing: Icon(IconlyLight.arrowRight2),
    onTap: () {
      onpressed;
    },
  );
}
