import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:phulkuri/auth/login/login.dart';

import '../../theme/change_button_theme.dart';
import '../init.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final signUpValidationKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final name = TextEditingController();
  final confirmPass = TextEditingController();
  final password = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode confirmFocusNode = FocusNode();

  void signUp() async {
    if (signUpValidationKey.currentState!.validate()) {
      // TO DO : sign in with email and password and store data on firestore
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email.text.trim(), password: password.text);
        await FirebaseDatabase.instance
            .ref(
                '/userData/name/${email.text.replaceAll('.', ",").replaceAll("@", "")}/')
            .set(name.text);
        // ignore: use_build_context_synchronously
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const InIt(),
            ),
            (route) => false);
      } on FirebaseAuthException catch (e) {
        Fluttertoast.showToast(
          msg: e.message!,
          fontSize: 16,
          textColor: Colors.red,
          toastLength: Toast.LENGTH_LONG,
          timeInSecForIosWeb: 5,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 400,
            decoration: BoxDecoration(
              color: const Color.fromARGB(50, 150, 150, 150),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Spacer(),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(40),
                        ),
                      ),
                      height: 70,
                      width: 70,
                      child: const ChangeThemeButtonWidget(value: 1),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 10,
                    left: 10,
                    bottom: 30,
                  ),
                  child: Form(
                    key: signUpValidationKey,
                    child: Column(
                      children: [
                        const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          onEditingComplete: () {
                            FocusScope.of(context).requestFocus(emailFocusNode);
                          },
                          validator: (value) {
                            if (value!.length >= 3) {
                              return null;
                            } else {
                              return "আপনার নামটি সঠিক নয় ...";
                            }
                          },
                          controller: name,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(width: 3),
                            ),
                            labelText: "Name",
                            hintText: "আপনার নামটি এখানে লিখুন ...",
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          onEditingComplete: () {
                            FocusScope.of(context)
                                .requestFocus(passwordFocusNode);
                          },
                          validator: (value) {
                            if (EmailValidator.validate(value!)) {
                              return null;
                            } else {
                              return "আপনার ইমেইলটি সঠিক নয় ...";
                            }
                          },
                          focusNode: emailFocusNode,
                          controller: email,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(width: 3),
                            ),
                            labelText: "Email",
                            hintText: "আপনার ইমেইলটি এখানে লিখুন ...",
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          onEditingComplete: () {
                            FocusScope.of(context)
                                .requestFocus(confirmFocusNode);
                          },
                          validator: (value) {
                            if (value!.length >= 8) {
                              return null;
                            } else {
                              return "পাসওয়ার্ড সর্বনিম্ন ৮ সংখ্যার হতে হবে ...";
                            }
                          },
                          controller: password,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          focusNode: passwordFocusNode,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(width: 3),
                            ),
                            labelText: "Password",
                            hintText: "আপনার পাসওয়ার্ড এখানে লিখুন ...",
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          onEditingComplete: () {
                            signUp();
                          },
                          validator: (value) {
                            if (password.text == confirmPass.text &&
                                password.text != "") {
                              return null;
                            } else {
                              return "পাসওয়ার্ড সর্বনিম্ন ৮ সংখ্যার হতে হবে ...";
                            }
                          },
                          controller: confirmPass,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          focusNode: confirmFocusNode,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(width: 3),
                            ),
                            labelText: "Confirm Password",
                            hintText: "আপনার পাসওয়ার্ড এখানে লিখুন ...",
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            maximumSize: const Size(380, 50),
                            minimumSize: const Size(380, 50),
                            backgroundColor: Colors.green,
                          ),
                          onPressed: () {
                            signUp();
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(fontSize: 26),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text("Have already an account?"),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const LogIn(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
