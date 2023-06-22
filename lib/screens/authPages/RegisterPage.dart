import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:idwey/services/authCalls.dart';
import 'package:idwey/utils/urls.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/colors.dart';
import '../../utils/utils.dart';
import '../../widgets/common/inputWidget.dart';
import '../../widgets/common/scaffold.dart';
import 'loginPage.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final _clientNameController = TextEditingController();
  final _clientLastNameController = TextEditingController();
  final _clientEmailController = TextEditingController();
  final _clientPasswordController = TextEditingController();
  final _vendorCommercialNameController = TextEditingController();
  final _vendorPhoneController = TextEditingController();
  UserType _userType = UserType.client;

  bool isAgree = false;
  bool loading = false;

  @override
  void dispose() {
    _clientNameController.dispose();
    _clientLastNameController.dispose();
    _clientEmailController.dispose();
    _clientPasswordController.dispose();

    _vendorCommercialNameController.dispose();
    _vendorPhoneController.dispose();
    super.dispose();
  }

  Widget _buildClientForm() {
    return Column(
      children: [
        TextInputField(
          placeholder: 'Prénom',
          icon: Icon(Icons.person),
          controller: _clientNameController,
          onChanged: (value) {},
        ),
        const SizedBox(
          height: 12,
        ),
        TextInputField(
          placeholder: 'Nom',
          icon: Icon(Icons.person),
          controller: _clientLastNameController,
          onChanged: (value) {},
        ),
        const SizedBox(
          height: 12,
        ),
        InputField(
          isEmail: true,
          controller: _clientEmailController,
          onChanged: (value) {},
        ),
        const SizedBox(
          height: 12,
        ),
        InputField(
          isEmail: false,
          controller: _clientPasswordController,
          onChanged: (value) {},
        ),
      ],
    );
  }

  Widget _buildVendorForm() {
    return Column(
      children: [
        TextInputField(
          placeholder: 'Nom commercial',
          icon: SizedBox(),
          controller: _vendorCommercialNameController,
          onChanged: (value) {},
        ),
        const SizedBox(
          height: 8,
        ),
        TextInputField(
          placeholder: 'Prénom',
          icon: SizedBox(),
          controller: _clientNameController,
          onChanged: (value) {},
        ),
        const SizedBox(
          height: 8,
        ),
        TextInputField(
          placeholder: 'Nom',
          icon: SizedBox(),
          controller: _clientLastNameController,
          onChanged: (value) {},
        ),
        const SizedBox(
          height: 8,
        ),
        TextInputField(
          placeholder: 'Téléphone',
          icon: SizedBox(),
          controller: _vendorPhoneController,
          onChanged: (value) {},
        ),
        const SizedBox(
          height: 8,
        ),
        InputField(
          isEmail: true,
          controller: _clientEmailController,
          onChanged: (value) {},
        ),
        const SizedBox(
          height: 8,
        ),
        InputField(
          isEmail: false,
          controller: _clientPasswordController,
          onChanged: (value) {},
        ),
      ],
    );
  }

  Widget _buildForm() {
    switch (_userType) {
      case UserType.client:
        return _buildClientForm();
      case UserType.vendor:
        return _buildVendorForm();
      default:
        return Container();
    }
  }

  callRegister() {
    if (isAgree) {
      setState(() {
        loading = true;
      });
      AuthCalls.register(
        _clientLastNameController.text,
        _clientNameController.text,
        _clientEmailController.text,
        _clientPasswordController.text,
      ).then((value) async {
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
                  "Une erreur s'est produite. Veuillez réessayer ultérieurement",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              textColor: Colors.white,
              fontSize: 14.0);
        }
      });
    } else {
      Fluttertoast.showToast(
          backgroundColor: Colors.black.withOpacity(0.8),
          msg:
              "Sélectionnez la case à cocher pour accepter les conditions générales",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 14.0);
    }
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
        body: SingleChildScrollView(
          padding: EdgeInsets.all(23),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    margin: EdgeInsets.only(bottom: 15),
                    alignment: Alignment.center,
                    child: const Text(
                      "S\'inscrire",
                      style: TextStyle(
                          color: materialPrimary,
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    )),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _buildForm(),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 24,
                            width: 24,
                            child: Checkbox(
                                value: isAgree,
                                onChanged: (value) {
                                  setState(() {
                                    isAgree = !isAgree;
                                  });
                                }),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'J\'ai lu et j\'accepte les ',
                              style: TextStyle(color: materialPrimary),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'conditions générales',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      final Uri uri = Uri.parse(Urls.TERMS_URL);
                                      launchUrl(uri);
                                    },
                                  style: TextStyle(
                                    color: primaryOrange,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              callRegister();
                            }
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
                              "S\'inscrire".toUpperCase(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                      _userType == UserType.client
                          ? Column(
                              children: [
                                SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Vous avez déjà un compte?',
                                      style: TextStyle(color: materialPrimary),
                                    ),
                                    SizedBox(width: 8),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginPage(),
                                            ));
                                      },
                                      child: Text(
                                        'Se connecter',
                                        style: TextStyle(color: primaryOrange),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
