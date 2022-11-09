import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myprogram/homeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

//form_key

final _formKey = GlobalKey<FormState>();

//editing controller

final TextEditingController emailcontroller = new TextEditingController();
final TextEditingController passwordcontroller = new TextEditingController();


 //firebase
 final _auth = FirebaseAuth.instance;

   @override
  Widget build(BuildContext context) {
  
   //email field
   final emailField = TextFormField(
    autofocus: false,
    controller: emailcontroller,
    keyboardType: TextInputType.emailAddress,
    validator: (value)
    {
      if(value!.isEmpty)
      {
        return ("Please Enter Your Email.");
      }
      if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[a-z]").hasMatch(value))
      {
        return ("Enter a valid Email");
      }
      return null;
    },
    onSaved: (value)
    {
      emailcontroller.text = value!;
    },
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      prefixIcon: Icon(Icons.mail),
      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
      hintText: "Enter Your Email",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
   );

   //password field
   final passwordField = TextFormField(
    autofocus: false,
    controller: passwordcontroller,
    obscureText: true,
    validator: (value){
      RegExp regex = new RegExp(r'^.{6}$');
      if(value!.isEmpty)
      {
       return  ("Please Enter the Password!");
      }
      if(!regex.hasMatch(value)){
      ("Please Enter a valid password with min 6 Characters.");
      }

    },
    onSaved: (value)
    {
      passwordcontroller.text = value!;
    },
    textInputAction: TextInputAction.done,
    decoration: InputDecoration(
      prefixIcon: Icon(Icons.vpn_key),
      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
      hintText: "Enter Your Password",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
   );


   final loginButton = Material(
    elevation: 5,
    color: Colors.blueGrey,
    borderRadius: BorderRadius.circular(30),
    child: MaterialButton(
      padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
      minWidth: MediaQuery.of(context).size.width,
      onPressed: () {
        signIn(emailcontroller.text, passwordcontroller.text);
      },
      child: Text("LOGIN",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 20,
      color: Colors.white,
      fontWeight: FontWeight.bold),
      ),
      ),
   );


    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 200,
                      child: Image.asset("assets/logo.png",
                      fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 45,),
                    emailField,
                    SizedBox(height: 25,),
                    passwordField,
                    SizedBox(height: 35,),
                    loginButton,
                    SizedBox(height: 15,),
                    Text("-Powered By",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                     ),
                     Text("Team NoName",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                     ),
                  ],
                ),
                ),
            ),
          ),
        ),
      ),
    );
  }
//login function
void signIn(String email, String password) async
{
  if(_formKey.currentState!.validate())
  {
    await _auth.signInWithEmailAndPassword(email: email, password: password)
    .then((uid) => {
      Fluttertoast.showToast(msg: "Login Successfully!"),
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()))
    }
    ).catchError((e)
    {
      Fluttertoast.showToast(msg: e!.message);
    });
    }
}





}