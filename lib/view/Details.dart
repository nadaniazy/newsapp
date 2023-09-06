import 'package:flutter/material.dart';
import 'package:newsapp/models/newsmodel.dart';

class DetailsCharacter extends StatelessWidget {
  DetailsCharacter({this.articleModel});

  ArticleModel? articleModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Image(
                  image: NetworkImage("${articleModel?.urlToImage}"),
                  width: double.infinity,
                  fit: BoxFit.cover,
                  height: 450,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("${articleModel?.author}",style: TextStyle(color: Colors.white,fontSize: 17),),
                ),
              ],
            ),
            SizedBox(height: 10,),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text.rich(
                   TextSpan(
                       text: "title ",
                       style:
                       TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
                       children: [
                         TextSpan(
                             text: "${articleModel?.title}",
                             style: TextStyle(
                                 color: Colors.white.withOpacity(0.5),
                                 fontWeight: FontWeight.w600))
                       ]),
                 ),
                 SizedBox(height: 10,),
                 Text.rich(
                   TextSpan(
                       text: "description ",
                       style:
                       TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
                       children: [
                         TextSpan(
                             text: "${articleModel?.description}",
                             style: TextStyle(
                                 color: Colors.white.withOpacity(0.5),
                                 fontWeight: FontWeight.w600))
                       ]),
                 ),
                 SizedBox(height: 10,),
                 Text.rich(
                   TextSpan(
                       text: "content ",
                       style:
                       TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
                       children: [
                         TextSpan(
                             text: "${articleModel?.content}",
                             style: TextStyle(
                                 color: Colors.white.withOpacity(0.5),
                                 fontWeight: FontWeight.w600))
                       ]),
                 ),
                 SizedBox(height: 10,),
                 Text.rich(
                   TextSpan(
                       text: "publishedAt ",
                       style:
                       TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
                       children: [
                         TextSpan(
                             text: "${articleModel?.publishedAt}",
                             style: TextStyle(
                                 color: Colors.white.withOpacity(0.5),
                                 fontWeight: FontWeight.w600))
                       ]),
                 ),
               ],
             ),
           )
         ],),
      )


    );
  }
}
