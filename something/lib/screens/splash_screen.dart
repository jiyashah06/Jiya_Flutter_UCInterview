import 'dart:async';
import 'package:animated_background/animated_background.dart';
import 'package:something/screens/login_screen.dart';
import 'package:flutter/material.dart';
//import 'package:something/main.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:AnimatedBackground( 
        vsync: this, 
        behaviour: RandomParticleBehaviour(
          options: ParticleOptions(
            spawnMinRadius: 15,
            spawnMaxRadius: 40,
            spawnMinSpeed: 15,
            spawnMaxSpeed: 80,
            spawnOpacity: 0.5,
            baseColor: Colors.yellow,
            image:Image(image: AssetImage('assets/images/single_popcorn.webp'))
          )
        ),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                backgroundColor: Color.fromARGB(139, 255, 211, 211),
                backgroundImage: AssetImage('assets/images/popcorn_tub.png'),
                radius: 140,
              ),
            ),
            Text('Welcome!!',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500)),
          ],
        ),
      )
    );
  }
    @override
   void initState(){
    super.initState();
    Timer(Duration(seconds:4), (){
      Navigator.pushReplacement(
        context , 
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }
}