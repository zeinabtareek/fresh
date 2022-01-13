import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fresh_in/authentication/model/register_model.dart';
import 'package:fresh_in/authentication/screens/login_screen.dart';
import 'package:fresh_in/screens/landing_screen.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class FirebaseController extends GetxController{

  final FirebaseAuth _auth = FirebaseAuth.instance;


  Rxn<User> _firebaseUser = Rxn<User>();

  User? get user => this._firebaseUser.value;



  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
  }


  void reset (String email) async{
    try{
    await _auth.sendPasswordResetEmail(email: email).then((value) => Get.offAll(LogInFinal()));
  }catch (e) {
      Get.snackbar("Error in sending the mail", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
  void createUser(String name,String email,String password) async
  {
    CollectionReference reference = FirebaseFirestore.instance.collection("Users");

    Map<String,dynamic> userdata ={
      "Name": name,
      "password": password,
      "Email":email
    };

    await _auth.createUserWithEmailAndPassword(email: email, password: password).
    then((value) {

      reference.add(userdata).then((value) =>  Get.offAll(LandingPage()));
    }).catchError((onError)=>
        Get.snackbar("Error while creating account ", onError.message),
    );
  }

  void login(String email,String password) async
  {
    await _auth.signInWithEmailAndPassword(email: email, password: password).then((value) => Get.offAll(LandingPage())).
    catchError((onError)=>
        Get.snackbar("Error while sign in ", onError.message));
  }



  void signout() async{
    await _auth.signOut().then((value) => Get.offAll(LogInFinal()));
  }
}