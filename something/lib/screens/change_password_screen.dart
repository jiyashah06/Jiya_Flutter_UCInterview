import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:something/authenication_services.dart';
class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {

  var emailText = TextEditingController();
  var passwordText = TextEditingController();

  bool _obscureText = true;
    
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
                  SizedBox(
                    height: 120,
                  ),
                  Text('Find My Movie',style: TextStyle(fontSize: 50,color: Color(0xff829966),),),
                  Text('Change Password',style:TextStyle(color: Color(0xff829966),fontStyle: FontStyle.italic, fontSize: 30),),
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
                        Padding(
                          padding: const EdgeInsets.only(left:12, right: 12),
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            cursorColor: Colors.white30,
                            controller: emailText,
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
                        // SizedBox(
                        //   height: 15,
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 12, right:12,),
                        //   child: TextFormField(
                        //     style: TextStyle(color: Colors.white),
                        //     cursorColor: Colors.white30,
                        //     controller: passwordText,
                        //     keyboardType: TextInputType.visiblePassword,
                        //     obscureText:_obscureText,
                        //     decoration: InputDecoration(
                        //       focusedBorder: UnderlineInputBorder(
                        //         borderSide: BorderSide(
                        //           color: Colors.green.shade800),
                        //       ),
                        //       enabledBorder: UnderlineInputBorder(
                        //         borderSide: BorderSide(
                        //           color: Colors.white),
                        //       ),
                        //       prefixIcon:Icon(Icons.lock, color:Colors.white70),
                        //       border: OutlineInputBorder(),
                        //       label: Text('Current Password',style: TextStyle(color:Colors.white70),),
                        //       suffixIcon:IconButton(
                        //         onPressed: (){
                        //           setState(() {
                        //             _obscureText = !_obscureText;
                        //           });
                        //         },
                        //         icon: Icon(_obscureText?Icons.visibility:Icons.visibility_off , color:Colors.white70),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 8,
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 12, right:12,),
                        //   child: TextFormField(
                        //     style: TextStyle(color: Colors.white),
                        //     cursorColor: Colors.white30,
                        //     controller: passwordText,
                        //     keyboardType: TextInputType.visiblePassword,
                        //     obscureText:_obscureText,
                        //     decoration: InputDecoration(
                        //       focusedBorder: UnderlineInputBorder(
                        //         borderSide: BorderSide(
                        //           color: Colors.green.shade800),
                        //       ),
                        //       enabledBorder: UnderlineInputBorder(
                        //         borderSide: BorderSide(
                        //           color: Colors.white),
                        //       ),
                        //       prefixIcon:Icon(Icons.lock, color:Colors.white70),
                        //       border: OutlineInputBorder(),
                        //       label: Text('New Password',style: TextStyle(color:Colors.white70),),
                        //       suffixIcon:IconButton(
                        //         onPressed: (){
                        //           setState(() {
                        //             _obscureText = !_obscureText;
                        //           });
                        //         },
                        //         icon: Icon(_obscureText?Icons.visibility:Icons.visibility_off , color:Colors.white70),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: 20,     //37
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffB0D089),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14),),
                      padding: EdgeInsets.only(top: 10, bottom: 10, left: 104, right: 104,),
                    ),
                    child: Text('Send Email',style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600, )),
                    onPressed: (){
                    try{
                      authService.value.resetPassword(email: emailText.text);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Email sent!",textAlign: TextAlign.center,),
                          shape: StadiumBorder(),
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        ),
                      ); 
                      Navigator.pop(context,this);
                    }on FirebaseAuthException catch(e){
                      // setState(() {
                      //   errorMessage= e.message ?? 'There is an error';
                      // });
                    }
                    }, 
                  ),
                ],
              ),
            ),
        ),
    );
  }
}