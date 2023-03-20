import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/colors.dart';
import '../utils/utils.dart';
import '../widgets/common/buttonWidget.dart';
import '../widgets/common/inputWidget.dart';
import '../widgets/common/scaffold.dart';
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
          icon: Image.asset("assets/ico.png"),
          controller: _clientNameController,
          onChanged: (value) {},
        ),
        const SizedBox(
          height: 8,
        ),
        TextInputField(
          placeholder: 'Nom',
          icon: Image.asset('assets/ico.png'),
          controller: _clientLastNameController,
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

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: primaryGrey));
    return CommonScaffold(
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
                  margin: EdgeInsets.only(bottom: 5.0),
                  alignment: Alignment.center,
                  child: const Text(
                    "S\'inscrire",
                    style: TextStyle(
                        color: materialPrimary,
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(children: [
                    Radio(
                      value: UserType.client,
                      groupValue: _userType,
                      onChanged: (UserType? value) {
                        setState(() {
                          _userType = value!;
                        });
                      },
                    ),
                    const Text('Client'),
                  ]),
                  Row(children: [
                    Radio(
                      value: UserType.vendor,
                      groupValue: _userType,
                      onChanged: (UserType? value) {
                        setState(() {
                          _userType = value!;
                        });
                      },
                    ),
                    const Text('Commercial'),
                  ]),
                ],
              ),
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
                                  style: TextStyle(color: primaryOrange)),
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
                            // Form is valid, do something
                            switch (_userType) {
                              case UserType.client:
                                String name = _clientNameController.text;
                                String lastName =
                                    _clientLastNameController.text;
                                print('Client name: $name');
                                print('client last name: $lastName');
                                break;
                              case UserType.vendor:
                                String name = _clientNameController.text;
                                String lastName =
                                    _clientLastNameController.text;
                                print('commercial name: $name');
                                print('commercial last name: $lastName');
                                break;
                              default:
                                break;
                            }
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
                              Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Ou continuer avec',
                                    style: TextStyle(
                                        color: materialPrimary,
                                        fontWeight: FontWeight.w600),
                                  )),
                              SizedBox(height: 15),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SocialMediaLoginButton(
                                    buttonColor: facebookColor,
                                    buttonText: 'Facebook',
                                    icon: Icons.facebook,
                                  ),
                                  const SizedBox(height: 5),
                                  SocialMediaLoginButton(
                                    buttonColor: googleColor,
                                    buttonText: 'Google',
                                    icon: FontAwesomeIcons.google,
                                  ),
                                ],
                              ),
                              SizedBox(height: 12),
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
    );
  }
}
