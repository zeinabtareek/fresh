import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fresh_in/widgets/Card_widget.dart';
import 'package:fresh_in/widgets/app_bar.dart';
import 'package:fresh_in/drawer/screen/drawer_widget.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import '../../screens/home_screen.dart';

enum MobileVericitionState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}
class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  AppBarWedget appBarWedget = AppBarWedget(
    title: '',
    actions: [],
    onPressed: () {},
  );
  late String title;
  GlobalKey<ScaffoldState> ScaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController TextConroller =TextEditingController();

  /***phone authontication***/
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool ShowLoading =false;
  MobileVericitionState currentState =MobileVericitionState.SHOW_MOBILE_FORM_STATE;
  final phonController =TextEditingController();
  final otpController =TextEditingController();
  late String verificationId;
  void signInWithPhoneAuthCredential(PhoneAuthCredential phoneAuthCredential)async {
    setState(() {
      ShowLoading=true;
    });
    try {
      final authCredential = await _auth.signInWithCredential(
          phoneAuthCredential);
      setState(() {
        ShowLoading=false;
      });
      if(authCredential.user !=null){
        Get.to(homePage());
      }
    }on FirebaseException catch(e){
      setState(() {
        ShowLoading=false;
      });
      ScaffoldKey.currentState!.showSnackBar(SnackBar(content: Text(e.message.toString())));
    }
  }
  /******/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: appBarWedget.ScaffoldKey,
      drawer: DrawerWedget(),
      appBar: AppBarWedget(
        title: 'Login /Register',
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('data'),
                GestureDetector(
                  onTap: () {},
                  child: IconButton(
                    iconSize: 26.0,
                    color: Colors.black,
                    onPressed: () {
                      // Get.to(Drawer);
                      Get.off(homePage());
                    },
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
        onPressed: () {
          appBarWedget.ScaffoldKey.currentState!.openDrawer();
        },
      ),
      body: ShowLoading ? Center(child: CircularProgressIndicator(),):
          currentState ==MobileVericitionState.SHOW_MOBILE_FORM_STATE?
              getMobileFormWidget(context):
              getOtpFormWidget(context),
     
    );
  }
  getMobileFormWidget(BuildContext context) {
    return Center(
          child: CardWidget( TextConroller: phonController,
            verifyOnPressed: ()async {
                setState(() {
                  ShowLoading=true;
                });
                await _auth.verifyPhoneNumber(
                    phoneNumber: phonController.text,
                    verificationCompleted: (phoneAuthCredential)async{
                      setState(() {
                        ShowLoading=false;
                      });
                      // signInWithPhoneAuthCredential(phoneAuthCredential);

                    },
                    verificationFailed: (verificationFailed)async{
                      ScaffoldKey.currentState!.showSnackBar(SnackBar(content: Text(verificationFailed.message.toString())));
                      setState(() {
                        ShowLoading=false;
                      });

                    },
                    codeSent: (verificationId ,resendingToken)async{
                      setState(() {
                        ShowLoading=false;
                        currentState =MobileVericitionState.SHOW_OTP_FORM_STATE;
                        this.verificationId =verificationId;
                      });
                    },
                    codeAutoRetrievalTimeout: (verificationId)async{
                    }
                );
              },
          ),
        );
      // Column(
      // children: [
      //   Spacer(),
      //   TextField(
      //     controller: phonController,
      //     decoration: InputDecoration(
      //       hintText: 'phone Number',
      //     ),
      //   ),
      //   SizedBox(
      //     height: 20,
      //   ),
      //   FlatButton(onPressed:
      //
      //     child: Text('Send', style: TextStyle(color: Colors.white),),
      //     color: Colors.blueAccent,),
      //   Spacer(),
      // ],
    // );
  }
  getOtpFormWidget(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        TextField(
          controller: otpController,
          decoration: InputDecoration(
            hintText: 'OTP',
          ),
        ),
        SizedBox(
          height: 20,
        ),
        FlatButton(onPressed: () async{
          PhoneAuthCredential phoneAuthCredential =PhoneAuthProvider.credential(verificationId: verificationId, smsCode: otpController.text);
          signInWithPhoneAuthCredential(phoneAuthCredential);
        },
          child: Text('Verify', style: TextStyle(color: Colors.white),),
          color: Colors.blueAccent,),
        Spacer(),
      ],
    );
  }}
