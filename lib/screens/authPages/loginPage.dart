import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:idwey/screens/authPages/RegisterPage.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/authCalls.dart';
import '../../utils/colors.dart';
import '../../widgets/common/inputWidget.dart';
import '../../widgets/common/scaffold.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool loading = false;

  void callLogin() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      AuthCalls.login(_emailController.text, _passwordController.text).then((value) async{
        setState(() {
          loading = false;
        });
        if (value.body.contains('token')) {
          var body = jsonDecode(value.body);
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString("token", body['token']);
          Navigator.pop(context, 'value');
        } else {
          Fluttertoast.showToast(
              backgroundColor: Colors.black.withOpacity(0.8),
              msg:
              "Une erreur s'est produite. Veuillez réessayer!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              textColor: Colors.white,
              fontSize: 14.0);
        }
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: primaryGrey));
    return ModalProgressHUD(
      inAsyncCall: loading,
      child: CommonScaffold(
        scaffoldKey: _scaffoldKey,
        backtotop: () {},
        showFab: false,
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    margin: EdgeInsets.only(bottom: 25.0),
                    alignment: Alignment.center,
                    child: Text(
                      "Se connecter",
                      style: TextStyle(
                          color: materialPrimary,
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    )),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      InputField(
                        isEmail: true,
                        controller: _emailController,
                        onChanged: (value) {},
                      ),
                      SizedBox(height: 12),
                      InputField(
                        isEmail: false,
                        controller: _passwordController,
                        onChanged: (value) {},
                      ),
                      SizedBox(height: 8),
                      // GestureDetector(
                      //   onTap: () {
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //           builder: (context) => const ForgetPasswordPage(),
                      //         ));
                      //   },
                      //   child: Container(
                      //     alignment: Alignment.topRight,
                      //     child: Text(
                      //       'Mot de passe oublié?',
                      //       style: TextStyle(color: primaryOrange, fontSize: 12),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(height: 15),
                      GestureDetector(
                        onTap: () {
                          callLogin();
                        },
                        child: Container(
                          height: 42,
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: primaryOrange,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40))),
                          child: Text(
                            "Se connecter".toUpperCase(),
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Vous n\'avez pas de compte?',
                      style: TextStyle(color: materialPrimary),
                    ),
                    SizedBox(width: 8),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterPage(),
                            ));
                      },
                      child: Text(
                        'S\'inscrire',
                        style: TextStyle(color: primaryOrange),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
