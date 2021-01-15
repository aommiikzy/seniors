// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'loginscreen.dart';

void main() {
  runApp(MaterialApp(

    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
class _HomePageState extends State<HomePage> {
  final Color primaryColor = Color(0xff18203d);
  final Color secondaryColor = Color(0xff232c51);

  final Color logoGreen = Color(0xff25bcbb);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.purple,
      //   title: Text('Dental App'),
      // ),
      backgroundColor: Colors.purple,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //We take the image from the assets
          Image.network('https://www.netclipart.com/pp/m/261-2616856_tooth-png-healthy-brush-teeth-clipart.png',width: 300,
            height: 250,),
          // Image.asset(
          //   'assets/splash-image.png',
          //   height: 250,
          // ),
          // SizedBox(
          //   height: 20,
          // ),
          //Texts and Styling of them
          Text(
            'Welcome to Hayha App',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 28),
          ),
          SizedBox(height: 20),
          Text(
            'blur bruh fick',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          SizedBox(
            height: 30,
            width: 100,
          ),
          //Our MaterialButton which when pressed will take us to a new screen named as
          //LoginScreen
           Center(
             child: RaisedButton(
              onPressed: () => {
              Navigator.push(context,
                      MaterialPageRoute(builder: (_) => LoginScreen()))
              },
              color: Colors.pinkAccent,
              child: Text(
                'Let sa gooo??',
                style: TextStyle(color: Colors.white
                ,fontSize: 50),

              ),
          ),
           ),
          // MaterialButton(
          //   elevation: 30,
          //
          //   height: 70,
          //   onPressed: () {
          //     // Navigator.push(context,
          //     //     MaterialPageRoute(builder: (_) => LoginScreen()));
          //   },
          //   minWidth: 70.0,
          //   color: Colors.pink,
          //   child: Padding(
          //     padding: const EdgeInsets.all(10.0),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: <Widget>[
          //         Text('Get Started',
          //             style: TextStyle(color: Colors.white, fontSize: 20)),
          //         // Icon(Icons.arrow_forward)
          //       ],
          //     ),
          //   ),
          //   textColor: Colors.white,
          // )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: (),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  // signInWithGoogle() async {
  //   final GoogleSignInAccount googleUser = await googleSignIn.signIn();
  //   final GoogleSignInAuthentication googleAuth =
  //   await googleUser.authentication;
  //
  //   final AuthCredential credential = GoogleAuthProvider.credential(
  //       idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
  //
  //   final User user = (await firebaseAuth.signInWithCredential(credential)).user;
  //   print("test here = " + user.email);
  // }
}

