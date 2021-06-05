import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pie_chart/pie_chart.dart';

import '../model/quiz_question.dart';

class Result extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _ResultState();
  }
}

class _ResultState extends State<Result> {
  Map<String, double> resultMap = {
    "Correct Answer": QuizQuestion.correct_answers.toDouble(),
    "Wrong Answer": QuizQuestion.wrong_answers.toDouble(),
    "Not Answered": QuizQuestion.not_answered.toDouble(),
  };
  List<Color> colorList = [
    Colors.green,
    Colors.red,
    Colors.blueGrey,
  ];

  @override
  void initState() {
    super.initState();
    print('this is marks card : ${QuizQuestion.marks_details_list}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: QuizQuestion.background,
        appBar:  AppBar(
          backgroundColor: QuizQuestion.appBar,
          title: Text('Quiz Assessment',style: TextStyle(
              fontSize: 18,color: Colors.white
          ),),
        ),
        body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: totalScore(),
                  ),
                  SizedBox(height: 5,),
                  Text('Summary of your Report',style: TextStyle(
                      fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black
                  ),),
                  SizedBox(height: 10,),
                  pieChartWidget(),
                  SizedBox(height: 10,),
                  MarksList(),
                ],
              ),
            )
        )
    );
  }

  Widget totalScore() {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 10,),
          Text('${QuizQuestion.correct_answers}',style: TextStyle(
              fontSize: 28,fontWeight: FontWeight.bold,color: Colors.black
          ),),
          SizedBox(height: 10,),
          Text('Maximum marks can be scored is 10',style: TextStyle(
              fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey[500]
          ),),
        ],
      ),
    );
  }

  Widget pieChartWidget() {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical:18.0,horizontal: 10.0),
          child: PieChart(
            dataMap: resultMap,
            animationDuration: Duration(seconds: 3),
            chartLegendSpacing: 32,
            chartRadius: MediaQuery.of(context).size.width / 3.2,
            colorList: colorList,
            initialAngleInDegree: 0,
            chartType: ChartType.ring,
            ringStrokeWidth: 32,
            centerText: '${QuizQuestion.correct_answers}',
            legendOptions: LegendOptions(
              showLegendsInRow: false,
              legendPosition: LegendPosition.right,
              showLegends: true,
              // legendShape: _BoxShape.circle,
              legendTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            chartValuesOptions: ChartValuesOptions(
              showChartValueBackground: true,
              showChartValues: true,
              showChartValuesInPercentage: false,
              showChartValuesOutside: true,
              decimalPlaces: 1,
            ),
          ),
        )
    );
  }

  Widget MarksList(){
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: QuizQuestion.marks_details_list.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context,int index){
          return Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child:Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width-100,
                              child: Text('Question : ${QuizQuestion.marks_details_list[index]['question']}',style: TextStyle(
                                  fontSize: 12,color: Colors.black
                              )),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 4),
                              child: Text('Answered : ${QuizQuestion.marks_details_list[index]['answered']}',style: TextStyle(
                                  fontSize: 12,color: Colors.grey),softWrap: false),
                            ),
                            Text('Correct Answer : ${QuizQuestion.marks_details_list[index]['correct']}',style: TextStyle(
                                fontSize: 12,color: Colors.green),softWrap: false),
                            Text('Answered in ${QuizQuestion.end_time[index]} seconds',style: TextStyle(
                                fontSize: 12,color: Colors.green),softWrap: false),
                          ],
                        ),
                        QuizQuestion.marks_details_list[index]['result']=='0'?Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          ),
                        ):QuizQuestion.marks_details_list[index]['result']=='1'?Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          ),
                        ):Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          ),
                        )
                      ],
                    ),
                  )
              ));
        });
  }
}