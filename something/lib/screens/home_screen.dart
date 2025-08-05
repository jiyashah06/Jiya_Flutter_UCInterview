import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'dart:async';
import 'dart:convert';
import 'package:something/post.dart';
import 'dart:developer' as developer;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

Future<Post?>? post;
  
  ///GET Api request
Future<Post> fetchPost() async{
  final uri = Uri.parse("https://flutterucinterviewtask.onrender.com/random");
  final response = await http.get(uri);
  developer.log(response.body);
  developer.log(response.statusCode.toString());
  
  if(response.statusCode==200) {
    developer.log('New');
    developer.log(Post.fromJson(json.decode(response.body)).genre);
    return Post.fromJson(json.decode(response.body));
  }
  else{
    developer.log('Failed');
    throw Exception('Failed to load post');
  }
}



Widget buildDataWidget(context, snapshot){

  List<String> genreArray = snapshot.data.genre.toString().split(', ');

  developer.log(snapshot.data.awards!);

  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      color: Color(0xff1D1F19),
    ),
    margin: EdgeInsets.fromLTRB(10,25,10,10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(snapshot.data.title!,style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.bold), textAlign: TextAlign.left,),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.all(20),
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            image: DecorationImage(image: NetworkImage(snapshot.data.poster),
            fit:BoxFit.fill,
            ),
          ), 
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8,4,4,4),
                  child: Text(snapshot.data.year! ?? 'year', style: TextStyle(color: Color(0xffB0D089),fontSize:20),),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8,4,4,4),
                  child: Text(snapshot.data.runtime! ?? 'runtime', style: TextStyle(color: Color(0xffB0D089),fontSize:20),),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8,4,4,4),
                  child: Text(snapshot.data.rated! ?? 'rated', style: TextStyle(color: Color(0xffB0D089),fontSize:20),),
                ),
              ],
            ),
            Row(
              children: [
                for(int i=0; i< genreArray.length; i++)
                  Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 4,8),
                  child: Container(
                    height: 36,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Color.fromARGB(255, 52, 79, 19),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(12,4,12,4),
                      child: Text(genreArray[i], style: TextStyle(color: Color(0xffB0D089),fontSize:20 ),),
                      ),
                    ),
                  ),
              ],
            ),
            Row(
               children: [
                 Padding(
                   padding: const EdgeInsets.only(left: 8),
                   child: Icon(Icons.star,color: Color(0xffB0D089),size: 26,),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(),
                   child: Text('${snapshot.data.imdbRating! ?? 'imdbRating'}/10\t\t', style:TextStyle(color: Colors.white70 ,fontSize: 18, fontWeight: FontWeight.bold,)),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(),
                   child: Text('(${snapshot.data.imdbVotes!} Votes)' ?? '(imdbVotes)',style: TextStyle(color: Color(0xffB0D089),fontSize: 16)),
                 )
               ],
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(
                 children: [
                   Icon(Icons.person, color: Color.fromARGB(255, 220, 240, 196),size: 24,),
                   Text("Director: ",style: TextStyle(color: Color(0xffB0D089),fontSize:14),),
                   Text(snapshot.data.director! ?? 'director', style: TextStyle(color: Colors.white70,fontSize:18,fontWeight:FontWeight.w500),),
                 ],
               ),
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(
                 children: [
                   Icon(Icons.local_movies, color: Color.fromARGB(255, 220, 240, 196),size: 24,),
                   Text("Writers: ",style: TextStyle(color: Color(0xffB0D089),fontSize:14),),
                   Expanded(
                    child: Text('${snapshot.data.writer! ?? 'writer'} ', style: TextStyle(color: Colors.white70,fontSize:18,fontWeight:FontWeight.w500),)),   
                 ],
               ),
             ),
            Container(
              margin: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color:Color.fromARGB(255, 20, 20, 20),
              ),
              width: double.infinity,
              child:Padding(
                padding: const EdgeInsets.all(12),
                child: Text(snapshot.data.plot! ?? 'plot plot plot plot',style: TextStyle(color: Colors.white70,fontSize:16,fontWeight: FontWeight.w500),),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                child:Row(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.language, color: Color.fromARGB(255, 220, 240, 196),size: 26,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(' Language: ',style: TextStyle(color: Color(0xffB0D089),fontSize:14),),
                            SizedBox(
                              width: 140,
                              height: 50,
                              child: Text(snapshot.data.language! ?? 'language', style: TextStyle(color: Colors.white70,fontSize:18,fontWeight: FontWeight.w500,),)),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Image(image:AssetImage('assets/images/earth.png'), color: Color.fromARGB(255, 220, 240, 196),height: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(' Country: ',style: TextStyle(color: Color(0xffB0D089),fontSize:14),),
                            SizedBox(
                              width: 130,
                              height: 50,
                              child: Text(snapshot.data.country! ?? 'country', style: TextStyle(color: Colors.white70,fontSize:18,fontWeight: FontWeight.w500,),)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(8, 4, 8, 8),
                child:Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(image:AssetImage('assets/images/award.png'), color: Color.fromARGB(255, 220, 240, 196),height: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Awards: ',style: TextStyle(color: Color(0xffB0D089),fontSize:14),),
                            SizedBox(
                              width: 320,
                              height: 50,
                              child: Text(snapshot.data.awards! ?? 'awards', style: TextStyle(color: Colors.white70,fontSize:18,fontWeight: FontWeight.w500,),),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // ElevatedButton(
        //   style: ElevatedButton.styleFrom(
        //     backgroundColor:Color.fromRGBO(176, 208, 137, 1),
        //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),),
        //     padding: EdgeInsets.only(top: 10, bottom: 10, left: 100, right:100),
        //   ),
        //   onPressed: (){
        //     setState((){
        //       // Container(color: Colors.red,);
        //     post = fetchPost();
        //     String? vari = post.toString();
        //      developer.log(vari);
        //      });
        //   }, 
        //   child: Text('Shuffle',style:TextStyle(color:  Color.fromARGB(255, 52, 79, 19),fontWeight: FontWeight.bold, fontSize: 18),)
        //   ),
      ],
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBody: true,
      backgroundColor:Colors.black87,
      body:Center(
        child: SingleChildScrollView(
          child: FutureBuilder<Post?>(
            future: fetchPost(),
            builder:(context, snapshot){
              // if(snapshot.connectionState == ConnectionState.waiting){
              //   return const CircularProgressIndicator();
              // }
              if(snapshot.connectionState == ConnectionState.none){
                return Container(color: Colors.red,);
              }
              else {
                if(snapshot.hasData){
                  return buildDataWidget(context , snapshot); 
                }
                else if(snapshot.hasError){
                  return Text("${snapshot.error}");
                }
                else{
                  return Container(color: Colors.red,);
                }
              }
            }
          ),
        ),
      ),
      bottomNavigationBar:Padding(
        padding: const EdgeInsets.fromLTRB(60, 10, 60, 20),
        child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:Color.fromRGBO(176, 208, 137, 1),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),),
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                ),
                onPressed: (){
                  setState((){
                    // Container(color: Colors.red,);
                  post = fetchPost();
                  String? vari = post.toString();
                   developer.log(vari);
                   });
                }, 
                child: Text('Shuffle',style:TextStyle(color:  Color.fromARGB(255, 52, 79, 19),fontWeight: FontWeight.bold, fontSize: 18),)
                ),
      ),
            
    );
  }
}