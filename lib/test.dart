// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/cupertino.dart';
// // import 'package:udharibook/Screens/SignInPage.dart';
// // import 'package:udharibook/Screens/dashboard.dart';
//
// class AuthService  {
//   String UserId ='';
//   final DBRef = FirebaseDatabase.instance.reference().child('Users');
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   handleAuth(){
//     return StreamBuilder(
//       stream: FirebaseAuth.instance.onAuthStateChanged,
//       builder: (BuildContext, snapshot){
//         if(snapshot.hasData){
//           getCurrentUser();
//           //call writeData() from inside the above method
//           return DashboardPage();
//         }
//         else {
//           return SignIn();
//         }
//       },
//     );
//   }
//   getCurrentUser() async{
//     final FirebaseUser user = await _auth.currentUser();
//     final uid = user.uid;
//     // Similarly we can get email as well
//     //final uemail = user.email;
//     UserId = uid;
//     print('User ID:  '+UserId);
//     //print(uemail);
//
//     //Here you add the method calling
//     writeData();
//   }
//
//   void writeData(){
//     DBRef.child(UserId).set({
//       'id':'ID1',
//       'Name':'Mehul Jain',
//       'Phone':'8856061841'
//     });
//   }
//
//   signOut(){
//     FirebaseAuth.instance.signOut();
//   }
//
//   signIn(AuthCredential authCreds){
//     FirebaseAuth.instance.signInWithCredential(authCreds);
//   }
//
//   signInWithOTP(smsCode,verId){
//     AuthCredential authCreds = PhoneAuthProvider.getCredential(
//         verificationId: verId,
//         smsCode: smsCode
//     );
//     signIn(authCreds);
//   }
// }