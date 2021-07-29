import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _uid = "username";
  final _password = "Password";
  final _uidController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                tileMode: TileMode.mirror,
                radius: 1.2,
                stops: [0.3, 0.6],
                colors: [
                  Colors.blueAccent,
                  Colors.indigo,
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(20),
              // width: mediaQuery.width * 0.4 > 360
              //     ? mediaQuery.width * 0.4
              //     : mediaQuery.width,
              // height: mediaQuery.height * 0.7 > 360
              //     ? mediaQuery.height * 0.7
              //     : mediaQuery.height,
              width: 500,
              height: 550,
              child: Card(
                elevation: 5,
                color: Color.fromARGB(220, 255, 255, 255),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                        top: 15,
                        bottom: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image(
                            image: AssetImage("assets/images/emblem-dark.png"),
                            height: 50,
                            width: 50,
                          ),
                          Image(
                            image: AssetImage("assets/images/cris-logo.png"),
                            height: 90,
                            width: 90,
                          ),
                          Image(
                            image: AssetImage("assets/images/ir-logo.png"),
                            height: 50,
                            width: 50,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 15,
                        bottom: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "FMM account sign in",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: TextFormField(
                        controller: _uidController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'This field is required';
                          }
                          if (value.length < 5) return "Invalid UID";
                        },
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Login ID",
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: TextFormField(
                        obscureText: true,
                        autovalidateMode: AutovalidateMode.always,
                        controller: _passwordController,
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'This field is required';
                          }
                          if (value.trim().length < 8) {
                            return 'Password must be at least 8 characters in length';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Password",
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(300, 40),
                                primary: Colors.green,
                                textStyle: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                String res = "Invalid ID/Pass";
                                if (_uid == _uidController.text &&
                                    _password == _passwordController.text)
                                  res = "Sign in approved.";
                                final snackBar = SnackBar(
                                  content: Text(
                                    res,
                                    textAlign: TextAlign.center,
                                  ),
                                );

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              child: Text("Sign In"),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: TextButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(300, 40),
                                  onPrimary: Colors.red,
                                ),
                                onPressed: () {},
                                child: Text("Forgot Password"),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
