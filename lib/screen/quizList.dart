import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../model/quiz_question.dart';
import '../model/data.dart';
import '../widget/grid_item.dart';

class QuizList extends StatelessWidget{
  final List<Data> topicList = [
    Data(
        id: 't1',
        url: 'https://cdn.videvo.net/videvo_files/video/premium/video0305/small_watermarked/601-2_601-6503_preview.webm',
        description: 'Eagle are sharped eyes bird',
        title: 'Eagle',
        colors: Colors.teal,
    ),
    Data(
        id: 't2',
        url: 'https://cdn.videvo.net/videvo_files/video/free/2014-12/small_watermarked/Swan_H264_Videvo_preview.webm',
        description: 'Swam can swim in water',
        title: 'Swam',
        colors: Colors.pink,
    ),
    Data(
        id: 't3',
        url: 'https://cdn.videvo.net/videvo_files/video/free/2019-01/small_watermarked/180116_01_01_preview.webm',
        description: 'Parrot can talk',
        title: 'Parrot',
        colors: Colors.purple,
    ),
    Data(
        id: 't4',
        url: 'https://cdn.videvo.net/videvo_files/video/free/2019-04/small_watermarked/190408_03_American_Birds19Hummingbird_04_preview.webm',
        description: 'Sparrow are beautiful birds',
        title: 'Sparrow',
        colors: Colors.deepOrange,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: QuizQuestion.background,
      appBar: AppBar(
        backgroundColor: QuizQuestion.appBar,
        title:  Text('Quiz Assessment',style: TextStyle(
            fontSize: 18,color: Colors.white
        ),),
      ),
      body: GestureDetector(
        child: Column(
          children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text('Select a topic!', style: TextStyle(fontSize: 25),),
              ),
            ),
            Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(10.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 6/2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10
                  ),
                  itemBuilder: (ctx, i) => GridItem(
                      topicList[i].id,
                      topicList[i].url,
                      topicList[i].description,
                      topicList[i].title,
                      topicList[i].colors,
                  ),
                  itemCount: topicList.length,
                )
            )
          ],
        ),
      )
    );
  }
}