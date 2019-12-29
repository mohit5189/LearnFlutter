import 'package:flutter/material.dart';

void main() => runApp(LoginScreen());

class LoginScreen extends StatelessWidget {
  // This widget is the root of your application.
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login Page",
      home: LoginView(),
    );
  }
}


class LoginView extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();

}

class _LoginState extends State<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login Page",
      theme: ThemeData(
        primaryColor: Colors.red,
        backgroundColor: Colors.blueGrey[50],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Login page"),
          backgroundColor: Colors.lightGreen,
        ),
        body: Center(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 100.0),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration (
                        labelText: "Enter username",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration (
                        labelText: "Enter password",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            MaterialButton(
                              color: Colors.red,
                              child: Text("Register",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: "Montserrat"
                                ),
                              ),
                              onPressed: () {

                              },
                            )
                          ],
                        ),

                        Column(
                          children: <Widget>[
                            MaterialButton(
                              color: Colors.red,
                              child: Text("Login",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: "Montserrat"
                                ),
                              ),
                              onPressed: () {
                                if (emailController.text == "test" && passwordController.text == "test") {
                                  return showDialog(context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          content: Text("Login success"),
                                        );
                                      });
                                } else {
                                  return showDialog(context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          content: Text("Login failed"),
                                        );
                                      });
                                }

                              },

                            )
                          ],
                        ),

                      ],
                    )
                  ],
                ),
              ),
            )
        ),
      ),
    );
  }
}