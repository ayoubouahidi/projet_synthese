import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projet_syn/screane/homePage.dart';
import 'package:projet_syn/screen/signInOutUp/signUp.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  late FirebaseAuth auth;
late Stream<User?> userStream;
// If you are not using GetX, simply use a nullable User variable:
User? _user;



   void initState() {
    super.initState();
    initAuth(); // Initialize auth listener
  }

  void initAuth() async {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user = auth.currentUser;
  userStream = auth.authStateChanges();
  userStream.listen((User? user) {
    _user = user;
    print("user id is: ${user?.uid}");
  });
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [

              // hexStringToColor("F45C00")
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              20,
              MediaQuery.of(context).size.height * 0.2,
              20,
              0,
            ),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/fces_logo.png"),
                SizedBox(height: 30),
                reusableTextField(
                  "Entrer votre email ou username",
                  Icons.person_outline,
                  false,
                  _emailTextController,
                ),
                SizedBox(height: 20),
                reusableTextField(
                  "Entrer votre password ",
                  Icons.lock_outlined,
                  false,
                  _passwordTextController,
                ),
                SizedBox(height: 20),
                SignInButton(context, true, () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text,
                      )
                      .then((value) {
                        // print("User signed in successfully");
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Homepage()),
                        );
                      })
                      .catchError((error) {
                        print("Error signing up: $error");
                        String errorMessage =
                            "Une erreur s'est produite lors de l'inscription.";
                        if (error.code == 'email-already-in-use') {
                          errorMessage =
                              "Cette adresse email est déjà utilisée.";
                        } else if (error.code == 'invalid-email') {
                          errorMessage = "L'adresse email n'est pas valide.";
                        } else if (error.code == 'weak-password') {
                          errorMessage = "Le mot de passe est trop faible.";
                        }
                        showAlertDialog(
                          context,
                          "Erreur d'inscription",
                          errorMessage,
                        );
                      });
                  // Navigator.push(context,MaterialPageRoute(builder: (context) => myHomePage()),);
                }),
                signUpOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have account?",
          style: TextStyle(color: Colors.white70),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUpScreen()),
            );
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}




  Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 240,
    height: 240,
    color: Colors.white,
  );
}


TextFormField reusableTextField(
    String text,
    IconData icon,
    bool isPasswordType,
    TextEditingController controller,
    {String? Function(String?)? validator}) {
  return TextFormField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white70,
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
    validator: validator,
  );
}



Container SignInButton(BuildContext context, bool isLogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) {
              return Colors.black26;
            }
            return Colors.white;
          }),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
      child: Text(
        isLogin ? 'LOG IN' : 'SIGN UP',
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
      ),
    ),
  );
}



//  AletDialog

void showAlertDialog(BuildContext context, String title, String message) {
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(message),
    actions: [
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}