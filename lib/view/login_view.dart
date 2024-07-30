import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerprac/res/components/round_button.dart';
import 'package:providerprac/utils/utils.dart';
import 'package:providerprac/view_model/auth_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

// Disposing the controllers & focus nodes
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Login",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(size.width * 0.05),
            child: Column(
              children: [
                //Email TextField
                SizedBox(
                  height: size.height * 0.4,
                ),
                TextFormField(
                  focusNode: emailFocusNode,
                  onFieldSubmitted: (valu) {
                    Utils.fieldFocusChange(
                      context,
                      emailFocusNode,
                      passwordFocusNode,
                    );
                  },
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.blue,
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
                //Password TextField
                ValueListenableBuilder(
                    valueListenable: _obsecurePassword,
                    builder: (context, value, child) {
                      return Padding(
                        padding: EdgeInsets.only(top: size.height * 0.03),
                        child: TextFormField(
                          controller: passwordController,
                          focusNode: passwordFocusNode,
                          onFieldSubmitted: (valu) {
                            Utils.fieldFocusChange(
                              context,
                              passwordFocusNode,
                              emailFocusNode,
                            );
                          },
                          obscureText: _obsecurePassword.value,
                          obscuringCharacter: '*',
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.blue,
                            ),
                            suffixIcon: InkWell(
                              onTap: () {
                                _obsecurePassword.value =
                                    !_obsecurePassword.value;
                              },
                              child: Icon(_obsecurePassword.value
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                            labelText: 'Password',
                          ),
                        ),
                      );
                    }),

                //Login Screen Content
                SizedBox(
                  height: size.height * 0.05,
                ),

                //Login Button
                RoundButton(
                  title: 'Login',
                  loading: authViewModel.loading,
                  onPress: () {
                    if (emailController.text.isEmpty) {
                      Utils.flushBarErrorMessage(
                          context, "Please Enter Email", Colors.red);
                    } else if (passwordController.text.isEmpty) {
                      Utils.flushBarErrorMessage(
                          context, "Please Enter Password", Colors.red);
                    } else if (passwordController.text.length < 6) {
                      Utils.flushBarErrorMessage(
                          context, "Please Enter 6 Digit Password", Colors.red);
                    } else {
                      Map data = {
                        "email": emailController.text,
                        "password": passwordController.text
                      };
                      authViewModel.loginApi(data, context);
                    }
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
