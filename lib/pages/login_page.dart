import 'package:flutter/material.dart';
import 'package:flutter_basic_concept/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

  final _fromkey = GlobalKey<FormState>();

  moveTOHome(BuildContext context) async {
    if (_fromkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 2));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _fromkey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/login_image.png",
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Welcome $name",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 30.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter user name",
                          labelText: "Username",
                        ),
                        // below, i gonan add validator for
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "User name can't be empty";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                      ),
                      TextFormField(
                        obscureText: true, //for hide the password
                        decoration: InputDecoration(
                          hintText: "Enter user password",
                          labelText: "password",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password can't be empty ";
                          } else if (value.length < 6) {
                            return "User password should be atleast 6";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 30.0,
                      ),

                      Material(
                        color: Colors.green,
                        borderRadius:
                            BorderRadius.circular(changeButton ? 8 : 10),
                        child: InkWell(
                          splashColor: Colors.green,
                          onTap: () => moveTOHome(context),
                          child: AnimatedContainer(
                            duration: Duration(seconds: 2),
                            height: 40,
                            width: changeButton ? 60 : 100,
                            alignment: Alignment.center,
                            child: changeButton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                            // decoration: BoxDecoration(
                            /// color: Colors.deepPurple,
                            //),
                          ),
                        ),
                      ),
                      //ElevatedButton(
                      //  onPressed: () {
                      //   Navigator.pushNamed(context, MyRoutes.homeRoute);
                      // },
                      //  style: TextButton.styleFrom(minimumSize: Size(100, 40)),
                      //   child: Text("Login"),
                      // )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
