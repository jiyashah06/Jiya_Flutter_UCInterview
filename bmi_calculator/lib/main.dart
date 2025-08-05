import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";
  var bgColor= Colors.white;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
       
        title: Center(
          child: Text('BMI Calculator'),
          )
      ),
      body: Container(
        color:bgColor,
        child: Center(
          child: SizedBox(
            width :300,
            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            
                Text('BMI', style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700)),
            
                SizedBox(height: 21,),
            
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text('Enter your weight in Kgs'),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
            
                SizedBox(height: 11,),
            
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text('Enter your height (in feet)'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
            
                SizedBox(height: 11,),
            
                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                    label: Text('Enter your height (in inches)'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
        
                SizedBox(height: 16,),
        
                ElevatedButton(onPressed: (){
                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inController.text.toString();
                  
        
                  if(wt!="" && ft!="" && inch!="")
                  {
                    var iWt = int.parse(wt);
                    var iFt = int.parse(ft);
                    var iInch = int.parse(inch);
        
                    var tInch = (iFt*12) + iInch;
                    var tcm = tInch*2.54;
                    var tM = tcm/100;
                    var bmi = iWt/(tM*tM);
                    
                    var msg = "";

                    if(bmi>25)
                    {
                      msg = "You are Overweight";
                      bgColor = Colors.red;
                    }
                    else if(bmi<18)
                    {
                      msg = "You are Underweight";
                      bgColor = const Color.fromARGB(255, 225, 74, 64);
                    }
                    else
                    {
                      msg = "You are Healthy";
                      bgColor = const Color.fromARGB(255, 98, 181, 101);
                    }
                    setState(() {
                      
                      result = "Your BMI is ${bmi.toStringAsFixed(3)}\n$msg";
                    });
                  }
                  else
                  {
                    setState(() {
                      bgColor=Colors.white;
                      result = "Please fill all the required blanks!";
                    });
                  }
                },
                child: Text('Calculate')),
        
                SizedBox(height: 11,),
        
                Text(result, style: TextStyle(fontSize: 20),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
