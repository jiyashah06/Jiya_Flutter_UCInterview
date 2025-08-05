import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:something/authenication_services.dart';
import 'package:something/screens/home_screen.dart';

final _formKey = GlobalKey<FormState>();
String errorMessage = '';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  var emailText = TextEditingController();
  var passwordText = TextEditingController();

  bool _obscureText = true;
  bool _obscureText2 = true;

  String? validateEmail(String? email){
    RegExp emailExp = RegExp(r'^[\w\.-]+@[\w-]+\.\w{2,3}(\.\w{2,3})?$');
    final isEmailValid = emailExp.hasMatch(email ?? '');
    if(!isEmailValid){
      return 'Incorrect format.Please enter a valid Email.';
    }
    return null;
  }

  @override
  void dispose(){
    emailText.dispose();
    passwordText.dispose();
    super.dispose();
  }

    register(){}
  // register() async{
  //   try {
  //     await authService.value.createAccount(
  //       email: emailText.text, 
  //       password: passwordText.text);
  //   } on FirebaseAuthException catch (e) {
  //       setState(() {
  //         errorMessage= e.message ?? 'There is an error';
  //       });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:Color(0xff191B15),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Find My Movie',style: TextStyle(fontSize: 50,color: Color(0xff829966),),),
                  Text('Create New Account',style:TextStyle(color: Color(0xff829966),fontStyle: FontStyle.italic, fontSize: 30),),
                  SizedBox(
                    height: 20,
                    width: double.infinity,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(14),),
                      color: Color.fromARGB(255, 49, 52, 45),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                          width: double.infinity,
                       ),
                        Form(
                          key: _formKey,
                          child: Padding(
                            padding: const EdgeInsets.only(left:12, right: 12),
                            child: TextFormField(
                              style: TextStyle(color: Colors.white),
                              cursorColor: Colors.white30,
                              controller: emailText,
                              validator: validateEmail,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.green.shade800),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white),
                                ),
                                prefixIcon:Icon(Icons.email,color:Colors.white70),
                                border: OutlineInputBorder(),
                                label: Text('Email',style:TextStyle(color: Colors.white70),),      
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12, right:12,),
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            cursorColor: Colors.white30,
                            controller: passwordText,
                            validator: (pass) {
                              if (pass!.length < 6) {
                                return 'Password should be atleast 6 characters';
                              }
                              return null;
                            },
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText:_obscureText,
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.green.shade800),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white),
                              ),
                              prefixIcon:Icon(Icons.lock, color:Colors.white70),
                              border: OutlineInputBorder(),
                              label: Text('Password',style: TextStyle(color:Colors.white70),),
                              suffixIcon:IconButton(
                                onPressed: (){
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                icon: Icon(_obscureText?Icons.visibility:Icons.visibility_off , color:Colors.white70),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12, right:12,),
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            cursorColor: Colors.white30,
                            validator: (value) {
                              if (value != passwordText.toString() ) {
                                return 'Password doesn\'t match.';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.visiblePassword,
                            obscureText:_obscureText2,
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.green.shade800),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white),
                              ),
                              prefixIcon:Icon(Icons.lock, color:Colors.white70),
                              border: OutlineInputBorder(),
                              label: Text('Confirm Password',style: TextStyle(color:Colors.white70),),
                              suffixIcon:IconButton(
                                onPressed: (){
                                  setState(() {
                                    _obscureText2 = !_obscureText2;
                                  });
                                },
                                icon: Icon(_obscureText2?Icons.visibility:Icons.visibility_off , color:Colors.white70),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 37,
                          child: Text(errorMessage, style: TextStyle(color: Colors.red),),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Builder(
                    builder: (context) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffB0D089),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14),),
                          padding: EdgeInsets.only(top: 10, bottom: 10, left: 150.5, right: 150.5,),
                        ),
                        child: Text('Sign Up',style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600, )),
                        onPressed: (){
                          if(_formKey.currentState!.validate()){
                            {
                              try {
                                authService.value.createAccount(
                                  email: emailText.text, 
                                  password: passwordText.text
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                   content: Text("Registered Successfully!!",textAlign: TextAlign.center,),
                                   shape: StadiumBorder(),
                                   behavior: SnackBarBehavior.floating,
                                   margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                                  ),
                                );
                                Navigator.pop(context);
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
                              } on FirebaseAuthException catch (e) {
                                  setState(() {
                                    errorMessage= e.message ?? 'There is an error';
                                  });
                              }
                            }
                            
                          }
                        }, 
                      );
                    }
                  ),
                ],
              ),
            ),
        ),
    );
  }
}