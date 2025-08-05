import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:something/authenication_services.dart';
import 'package:something/screens/change_password_screen.dart';
import 'package:something/screens/home_screen.dart';
import 'package:something/screens/signup_screen.dart';


final _formKey = GlobalKey<FormState>();


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var emailText= TextEditingController();
  var passwordText= TextEditingController();

  bool _obscureText = true;

  String? validateEmail(String? email){
    RegExp emailExp = RegExp(r'^[\w\.-]+@[ \w-]+\.\w{2,3}(\.\w{2,3})?$');
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

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:Color(0xff191B15),
        body: 
        // Padding(
        //   padding: EdgeInsets.all(20),
        //   child: 
          Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SizedBox(
                  //   height: 120,
                  //   width:double.infinity,
                  // ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Find My Movie',style: TextStyle(fontSize: 50,color: Color(0xff829966),),),
                      
                      CircleAvatar(
                        backgroundColor: Color.fromARGB(224, 255, 255, 255),
                        backgroundImage: AssetImage('assets/images/movie_clapper.png'),
                        radius: 70,
                        ),
                        //Text('Welcome!!',style:TextStyle(color: Color(0xff829966),fontStyle: FontStyle.italic, fontSize: 30),),
                    ],
                  ),
                  // SizedBox(
                  //   height: 20,
                  //   width: double.infinity,
                  // ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20,0,20,0),
                        child: Container(
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
                                    onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(), 
                                    style: TextStyle(color: Colors.white),
                                    cursorColor: Colors.white30,
                                    controller: emailText,
                                    validator: validateEmail,
                                    autovalidateMode: AutovalidateMode.onUnfocus,
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
                                width: double.infinity,
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
                                  onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(), 
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
                                width: double.infinity,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 12,),
                                    child: InkWell(
                                      child: Text('Forgot password?',style: TextStyle(color: Colors.blue),),
                                      onTap: () {
                                        Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => ChangePasswordPage()),);
                                      }
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 25,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   height: 25,
                  // ),
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffB0D089),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14),),
                          padding: EdgeInsets.only(top: 10, bottom: 10, left: 160, right: 160,),
                        ),
                        child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600 )),
                        onPressed: (){
                        try{
                          authService.value.signIn(email: emailText.text, password: passwordText.text);
                          Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()),);
                          // setState(() {
                          //   emailText.value= TextEditingValue.empty;
                          //   passwordText.value=TextEditingValue.empty;
                          // });
                        } on FirebaseAuth catch(e){
                          setState(() {
                           errorMessage = e.toString() ?? 'Error occured'; 
                          });
                        }
                        
                        }, 
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text('Don\'t have an account?',style: TextStyle(color: Colors.white70),),
                      InkWell(
                        child: Text('Sign Up',style: TextStyle(color: Colors.blue),),
                        onTap: () {
                          Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),);
                        }
                      ),
                    ],
                  ),
                ],
              ),
            ),
        //),
    );
  }
}
