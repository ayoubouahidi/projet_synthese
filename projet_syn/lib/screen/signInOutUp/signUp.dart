// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projet_syn/screane/homePage.dart';
import 'package:projet_syn/screen/signInOutUp/signIn.dart';





class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _userNameTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isEmailValid(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
  
  // Password strength validation (at least 6 characters)
  bool _isPasswordStrong(String password) {
    return password.length >= 6;
  }

  // void _signUp() async {
  //   if (_formKey.currentState!.validate()) {
  //     try {
  //       final userCredential = await FirebaseAuth.instance
  //           .createUserWithEmailAndPassword(
  //             email: _emailTextController.text,
  //             password: _passwordTextController.text,
  //           );
        
  //       // You might want to update the user's display name with the username
  //       await userCredential.user?.updateDisplayName(_userNameTextController.text);
        
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => myHomePage()),
  //       );
  //     } on FirebaseAuthException catch (error) {
  //       String errorMessage = "Sign up failed. Please try again.";
  //       if (error.code == 'weak-password') {
  //         errorMessage = 'The password provided is too weak.';
  //       } else if (error.code == 'email-already-in-use') {
  //         errorMessage = 'The account already exists for that email.';
  //       } else if (error.code == 'invalid-email') {
  //         errorMessage = 'The email address is not valid.';
  //       }
        
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text(errorMessage)),
  //       );
  //     } catch (error) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text("Error signing up: $error")),
  //       );
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child:Form(
              key: _formKey,
              child: Column(
              children: <Widget>[
                const SizedBox(height: 20),
                reusableTextField(
                  "Enter UserName",
                  Icons.person_outline,
                  false,
                  _userNameTextController,
                ),
                const SizedBox(height: 20),
                reusableTextField(
                  "Enter Email Id",
                  Icons.person_outline,
                  false,
                  _emailTextController,
                ),
                const SizedBox(height: 20),
                reusableTextField(
                  "Enter Password",
                  Icons.lock_outlined,
                  true,
                  _passwordTextController,
                ),
                const SizedBox(height: 20),
                SignInButton(context, false, () {
                if (_formKey.currentState!.validate()) {
                 if (!_isPasswordStrong(_passwordTextController.text)) {
                        showAlertDialog(context, "Mot de passe trop faible", 
                           "Votre mot de passe doit contenir au moins 6 caractères.");
                            return;
    }
    
    if (!_isEmailValid(_emailTextController.text)) {
      showAlertDialog(context, "Email invalide", 
                     "Veuillez entrer une adresse email valide.");
      return;
    }
    
    print("test done");
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: _emailTextController.text,
          password: _passwordTextController.text,
        )
        .then((userCredential) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Homepage()),
          );
        })
        .catchError((error) {
                          print("Error signing up: $error");
                          String errorMessage = "Une erreur s'est produite lors de l'inscription.";
                          if (error.code == 'email-already-in-use') {
                            errorMessage = "Cette adresse email est déjà utilisée.";
                          }
                          else if (error.code == 'invalid-email') {
                            errorMessage = "L'adresse email n'est pas valide.";
                          } 
                          else if (error.code == 'weak-password') {
                            errorMessage = "Le mot de passe est trop faible.";
                          }
                          showAlertDialog(context, "Erreur d'inscription", errorMessage);
                        });
                     } else {
                      showAlertDialog(context, "Données invalides", 
                   "Veuillez remplir correctement tous les champs.");
                    }
                },),
              ],
            )
            
            )
            
          ),
        ),
      ),
    );
  }
}

