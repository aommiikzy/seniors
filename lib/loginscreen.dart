import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'main.dart';


String UserId ='';
final DBRef = FirebaseDatabase.instance.reference();
final FirebaseAuth _auth = FirebaseAuth.instance;



// import 'package:google_sign_in/google_sign_
final databaseReference = Firestore.instance;

class LoginScreen extends StatelessWidget {
  final databaseReferenceRealtime = FirebaseDatabase.instance.reference();
  final Color primaryColor = Color(0xff18203d);
  final Color secondaryColor = Color(0xff232c51);

  final Color logoGreen = Color(0xff25bcbb);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
   FirebaseUser user = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[400],
          elevation: 0,
        ),
        backgroundColor: Colors.grey,
        body: Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Register right now bro',
                  textAlign: TextAlign.center,
                  style:
                  GoogleFonts.openSans(color: Colors.white, fontSize: 28,fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 40),
                Text(
                  'Enter everything quickMARK',
                  textAlign: TextAlign.center,
                  style:
                  GoogleFonts.openSans(color: Colors.white, fontSize: 25),
                ),
                SizedBox(
                  height: 100,
                ),
                _buildTextField(
                    nameController, Icons.account_circle, 'Username'),
                SizedBox(height: 20),
                _buildTextField(passwordController, Icons.lock, 'Password'),
                SizedBox(height: 50),
                MaterialButton(
                  elevation: 0,
                  minWidth: double.maxFinite,
                  height: 50,
                  onPressed: () {

                    updateData();
                  },
                  color: Colors.blueAccent,
                  child: Text('Login',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  textColor: Colors.white,
                ),
                SizedBox(height: 20),
                MaterialButton(
                  elevation: 0,
                  minWidth: double.maxFinite,
                  height: 50,
                  onPressed: () {

                    signInWithGoogle();
                    print("test id = " + user.uid);
                    //Here goes the logic for Google SignIn discussed in the next section
                  },
                  color: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.google),
                      SizedBox(width: 10),
                      Text('Sign-in using Google',
                          style: TextStyle(color: Colors.white, fontSize: 20)),


                    ],

                  ),
                  textColor: Colors.white,
                ),
                // SizedBox(height: 100),
                SizedBox(height: 20),
                MaterialButton(
                  elevation: 0,
                  minWidth: double.maxFinite,
                  height: 50,
                  onPressed: () {

                    createRealtime();
                  },
                  color: Colors.green[400],
                  child: Text('Add appointment',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  textColor: Colors.white,
                ),
                SizedBox(height: 20),
                MaterialButton(
                  elevation: 0,
                  minWidth: double.maxFinite,
                  height: 50,
                  onPressed: () {

                    createRealtimeUpdate();
                  },
                  color: Colors.red[400],
                  child: Text('Postpone appointment',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  textColor: Colors.white,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  // child: _buildFooterLogo(),
                )
              ],
            ),
          ),
        ));
  }

  _buildFooterLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Image.asset(
        //   'assets/tgd_white.png',
        //   height: 40,
        // ),
        // Text('The Growing Developer',
        //     textAlign: TextAlign.center,
        //     style: GoogleFonts.openSans(
        //         color: Colors.white,
        //         fontSize: 20,
        //         fontWeight: FontWeight.bold)),
      ],
    );
  }
  signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
    await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

    user = (await firebaseAuth.signInWithCredential(credential)).user;
    print("test id = " + user.uid);
    createRecord();
    return user;

  }

  _buildTextField(
      TextEditingController controller, IconData icon, String labelText) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.deepPurple[100], border: Border.all(color: Colors.blue)),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.black, fontSize: 20),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.white),
            icon: Icon(
              icon,
              color: Colors.white,
            ),
            // prefix: Icon(icon),
            border: InputBorder.none),
      ),
    );
  }
  void createRecord() async {
    await databaseReference.collection("Dental info")
        .document(user.email)
        .setData({
      'Name': 'Aommiizky',
      'Phone number': '0877022022'
    });



    // DocumentReference ref = await databaseReference.collection("Dental info")
    //     .add({
    //   'Name': 'Aommiizky',
    //   'Phone number': '0877022022'
    // });
    // print("already created record");
    // print(ref.documentID);
  }
  void createRealtime() {
    // databaseReference = FirebaseDatabase.instance.reference();

    // DBRef.child(user.email).set({
    //   'id':'ID1',
    //   'Name':'Mehul Jain',
    //   'Phone':'8856061841'
    // });
    print('user id = '+ user.uid);
    databaseReferenceRealtime.child(user.uid).set({
      'treatment': 'treatment of A',
      'status': 'Normal'
    });

    // databaseReferenceRealtime.child("1").set({
    //   'name': 'Aom',
    //   'time': '20.46'
    // });

  }
  void createRealtimeUpdate() {
    // databaseReference = FirebaseDatabase.instance.reference();

    // DBRef.child(user.email).set({
    //   'id':'ID1',
    //   'Name':'Mehul Jain',
    //   'Phone':'8856061841'
    // });
    print('user id = '+ user.uid);
    databaseReferenceRealtime.child(user.uid).set({
      'treatment': 'treatment of A',
      'status': 'Postpone'
    });
    // databaseReferenceRealtime.child("1").set({
    //   'name': 'Aom',
    //   'time': '20.46'
    // });

  }

  void updateData() {
    try {
      databaseReference
          .collection('Dental info')
          .document(user.email)
          .updateData({'Phone number': '0877021021'});
    } catch (e) {
      print(e.toString());
    }
  }
}



