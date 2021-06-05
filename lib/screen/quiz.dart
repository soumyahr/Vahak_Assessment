import 'dart:async';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../model/quiz_question.dart';
import '../screen/result.dart';

class Quiz extends StatefulWidget {
  final id;

  const Quiz({Key key, this.id}) : super(key: key);
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  Timer _timer;
  int _start = 5;
  var _endTime;
  CountDownController _timercontroller = CountDownController();
  List _questions = [];
  int question_number = 1;
  bool isQuizCompleted = false;
  var marks;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    getQuestionList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: QuizQuestion.background,
        appBar: AppBar(
          backgroundColor: QuizQuestion.appBar,
          title: Text('Quiz Assessment',style: TextStyle(
              fontSize: 18,color: Colors.white
          ),),
        ),
        body:_start!=0?showCountdownTimer():question_number==11?Container(
          color:Colors.black,height: MediaQuery.of(context).size.height,
        ):Column(
          children: <Widget>[
            circleTimer(),
            Text('Question ${question_number}',style: TextStyle(fontSize: 16,color: Colors.black),),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text('${_questions[question_number-1]['question']}',style: TextStyle(fontSize: 16,
                  color: Colors.black,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 20,),
            optionsBlock()
          ],
        )
    );
  }

  Widget showCountdownTimer() {
    startTimer();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          question_number==11?Center(
            child: Text('Completed Quiz successfully Please wait while we generate the Report', style: TextStyle(
                fontSize: 24, color: Colors.black,fontWeight: FontWeight.bold
            ),),
          ):question_number>1?Text('Get ready for your next question', style: TextStyle(
              fontSize: 24, color: Colors.black,fontWeight: FontWeight.bold
          ),):Text('Get ready for your first question', style: TextStyle(
              fontSize: 24, color: Colors.black,fontWeight: FontWeight.bold
          ),),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text('${_start}', style: TextStyle(
                fontSize: 24, color: Colors.black,fontWeight: FontWeight.bold
            ),),
          ),
        ],
      ),
    );
  }

  Widget optionsBlock() {
    return GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 5/2,
            crossAxisSpacing: 28.0,
            mainAxisSpacing: 20.0
        ),
        itemCount: 4,
        itemBuilder:(BuildContext context,int index){
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
              onTap: () =>validateAnswer(index),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: index==0?Colors.cyan[800]:index==1?Colors.orange[600]:
                  index == 2?Colors.green[500]:Colors.blueGrey,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                    child: index==0?Text('${_questions[question_number-1]['A']}',style: TextStyle(
                        fontSize: 20,color: Colors.black,fontWeight: FontWeight.w400
                    ),textAlign: TextAlign.center,):index == 1?Text('${_questions[question_number-1]['B']}',style: TextStyle(
                        fontSize: 20,color: Colors.black,fontWeight: FontWeight.w400
                    ),textAlign: TextAlign.center,):index == 2?Text('${_questions[question_number-1]['C']}',style: TextStyle(
                        fontSize: 20,color: Colors.black,fontWeight: FontWeight.w400
                    ),textAlign: TextAlign.center,):Text('${_questions[question_number-1]['D']}',style: TextStyle(
                        fontSize: 20,color: Colors.black,fontWeight: FontWeight.w400
                    ),textAlign: TextAlign.center,),
                  ),
                ),
              ),
            ),
          );
        });
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            _timer.cancel();
            timer.cancel();
            if(question_number==11){
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Result(),
                ), //MaterialPageRoute
              );
            }
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  Widget circleTimer() {
    return CircularCountDownTimer(
      duration: 5,
      initialDuration: 0,
      controller: _timercontroller,
      width: MediaQuery.of(context).size.width / 4,
      height: MediaQuery.of(context).size.height / 4,
      ringColor: Colors.grey[400],
      ringGradient: null,
      fillColor: Colors.tealAccent,
      fillGradient: null,
      backgroundColor: Colors.teal,
      backgroundGradient: null,
      strokeWidth: 20.0,
      strokeCap: StrokeCap.round,
      textStyle: TextStyle(
          fontSize: 33.0, color: Colors.black, fontWeight: FontWeight.bold),
      textFormat: CountdownTextFormat.S,
      isReverse: false,
      isReverseAnimation: false,
      isTimerTextShown: true,
      autoStart: true,
      onStart: () {
        print('Countdown Started');
      },
      onComplete: () {
        print('Countdown Completed');
        setState(() {
          question_number +=1;
          QuizQuestion.not_answered +=1;
          marks = {'question':'${_questions[question_number-1]['question']}','answered':'Not Answered',
            'correct':'${_questions[question_number-1]['E']}','result':'2'};
          QuizQuestion.marks_details_list.add(marks);
          _start = 5;
        });
      },
    );
  }

  void getQuestionList() {
    List topicList = [];
    switch(widget.id){
      case 't1' :
        topicList = QuizQuestion.eagle_questions;
        break;
      case 't2':
        topicList = QuizQuestion.swam_questions;
        break;
      case 't3' :
        topicList = QuizQuestion.parrot_questions;
        break;
      case 't4':
        topicList = QuizQuestion.sparrow_questions;
        break;
    }
    setState(() {
      _questions = topicList;
    });
  }

  validateAnswer(int option) {
    _timercontroller.pause();
    _endTime = _timercontroller.getTime();
    QuizQuestion.end_time.add(_endTime);
    print(_endTime);

    String selectedAnswer;
    switch(option){
      case 0:selectedAnswer ='A';
      break;
      case 1:selectedAnswer ='B';
      break;
      case 2:selectedAnswer ='C';
      break;
      case 3:selectedAnswer ='D';
      break;
    }
    if((_questions[question_number-1][selectedAnswer])==(_questions[question_number-1]['E'])){
      QuizQuestion.correct_answers += 1;
      marks = {'question':'${_questions[question_number-1]['question']}','answered':'${_questions[question_number-1][selectedAnswer]}',
        'correct':'${_questions[question_number-1]['E']}','result':'0'};
      correctAnswerAlert();

    }
    else{
      QuizQuestion.wrong_answers +=1;
      marks = {'question':'${_questions[question_number-1]['question']}','answered':'${_questions[question_number-1][selectedAnswer]}',
        'correct':'${_questions[question_number-1]['E']}','result':'1'};
      wrongAnswerAlert();
    }

    setState(() {
      QuizQuestion.marks_details_list.add(marks);
    });
    print('Result is Correct Answers : ${QuizQuestion.correct_answers}');
    print('Result is Wrong Answers : ${QuizQuestion.wrong_answers}');
    print('Result is Not Answerd : ${QuizQuestion.not_answered}');
  }

  correctAnswerAlert() {
    // Create button
    Widget btnOk = Container(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: RaisedButton(
            color: Colors.green,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: () {
              setState(() {
                _start = 5;
                question_number +=1;
              });
              Navigator.of(context).pop();
            },
            child: Text('OK',style: TextStyle(
                color: Colors.white,fontSize: 16
            ),),
          ),
        )
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Icon(Icons.check,color: Colors.green,size: 60,),
      content:Text('Correct Answer',style: TextStyle(
          fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold
      ),textAlign: TextAlign.center,),

      actions: [
        btnOk,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  wrongAnswerAlert() {
    // Create button
    Widget btnOk = Container(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: RaisedButton(
            color: Colors.purple,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: () {
              setState(() {
                _start = 5;
                question_number +=1;
              });
              Navigator.of(context).pop();
            },
            child: Text('OK',style: TextStyle(
                color: Colors.white,fontSize: 16
            ),),
          ),
        )
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Icon(Icons.clear,color: Colors.red,size: 60,),
      content: Text('Wrong answer',style: TextStyle(
          fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold
      ),textAlign: TextAlign.center,),
      actions: [
        btnOk,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}