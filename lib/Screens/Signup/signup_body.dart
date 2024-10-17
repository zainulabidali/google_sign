import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_login/Screens/home/Home_page.dart';
import 'package:google_login/Screens/login/loginScreen.dart';
import 'package:google_login/auth_service.dart';
import 'package:google_login/const/const.dart';

class BodySignup extends StatefulWidget {
  const BodySignup({super.key});

  @override
  State<BodySignup> createState() => _BodySignupState();
}

class _BodySignupState extends State<BodySignup> {
  final AuthService _authService = AuthService(); // Use AuthService

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/main_top.png",
              width: size.width * 0.3,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              "assets/images/main_bottom.png",
              width: size.width * 0.2,
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sign up",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 20),
                SvgPicture.asset(
                  "assets/icons/signup.svg",
                  height: size.height * 0.35,
                ),
                SizedBox(height: 40),
                // Email input
                Container(
                  width: size.width * 0.8,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: KprimaryLightColor,
                      hintText: "Email",
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: size.width * 0.8,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: KprimaryLightColor,
                      hintText: "password",
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: Icon(Icons.visibility_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: size.width * 0.8,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: KprimaryColor),
                    child:
                        Text("SIGN UP", style: TextStyle(color: Colors.white)),
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text(
                    "Don't have an Account? Sign In",
                    style: TextStyle(color: KprimaryColor, fontSize: 10),
                  ),
                ),
                OrDivider(),
                // Google sign-in button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        print("object");
                        try {
                          // Show a loading indicator while signing in
                          // You can add the loading indicator if needed
                          User? user = await _authService.signInWithGoogle();
                          print(user);

                          // If sign-in is successful, navigate to HomePage
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                          print('Google sign-in success');
                        } catch (e) {
                          print(e);
                          // Remove the loading indicator if needed
                          // Navigator.pop(context);

                          // Show error message in Snackbar
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                    'Failed to sign in with Google: ${e.toString()}')),
                          );
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 2, color: KprimaryLightColor),
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/google-plus.svg",
                          height: 40,
                          width: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// OR Divider Widget
class OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.7,
      child: Row(
        children: <Widget>[
          buildDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              textAlign: TextAlign.center,
              "OR",
              style:
                  TextStyle(color: KprimaryColor, fontWeight: FontWeight.bold),
            ),
          ),
          buildDivider(),
        ],
      ),
    );
  }

  Expanded buildDivider() {
    return Expanded(
      child: Divider(
        color: Color.fromARGB(246, 60, 59, 66),
        height: 1.5,
      ),
    );
  }
}
