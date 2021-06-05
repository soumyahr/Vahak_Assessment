import 'package:flutter/material.dart';

import '../screen/quizVideo.dart';

class GridItem extends StatelessWidget{
  final String id;
  final String url;
  final String description;
  final String title;
  final Color colors;

  GridItem(this.id, this.url, this.description, this.title, this.colors);

  @override
  Widget build(BuildContext context) {
    return GridTile(
        child: RaisedButton(
          color: colors,
          child: Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 25),),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return QuizVideo(id: id, url: url, description: description,);
            }));
          },
        )
    );
  }
}