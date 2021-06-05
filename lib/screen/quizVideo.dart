import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

import '../model/data.dart';
import '../widget/new_note.dart';
import '../widget/noteList.dart';
import '../model/quiz_question.dart';
import '../screen/quiz.dart';

class QuizVideo extends StatefulWidget{
  String id;
  String url;
  String description;

  QuizVideo({this.id, this.url, this.description});

  @override
  State<StatefulWidget> createState() {
    return _QuizVideoState();
  }
}

class _QuizVideoState extends State<QuizVideo>{
  VideoPlayerController videoPlayerController;
  String _videoURL = '';
  String desc_text = '';
  TextEditingController textNoteController = new TextEditingController();
  final List<Data> _notes = [];
  ChewieController chewieController;
  String queTime = '';

  @override
  void initState() {
    getVideo(widget.id);
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  void _startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (_) {
      return GestureDetector(
        onTap: () {},
        child: NewNote(_addNewNote),
        behavior: HitTestBehavior.opaque,
      );
    });
  }

  void _addNewNote(String note){
    final newNote = Data(
        id: DateTime.now().toString(),
        queTime: queTime
    );

    setState(() {
      _notes.add(newNote);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: QuizQuestion.background,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: QuizQuestion.appBar,
        title:  Text('${QuizQuestion.appBarTitle}',style: TextStyle(
            fontSize: 18,color: Colors.white
        ),),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                child: Chewie(
                    controller: chewieController
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(widget.description, style: TextStyle(fontSize: 20),),
              ),
              Center(
                child: InkWell(
                  onTap: () => Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => Quiz(id: widget.id,))),
                  child: Text('Click here to start Quiz..', style: TextStyle(fontSize: 20),),
                ),
              ),
              Container(
                height: 200,
                child: NoteList(_notes),
              ),
            ],
          ),
        ],
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal,
          onPressed: () {
            _startAddNewTransaction(context);
            if(videoPlayerController.value.isPlaying){
              setState(() {
                videoPlayerController.pause();
                queTime = '00.${videoPlayerController.value.position.inSeconds.toString()}s';
              });
            }
          },
          child: Icon(Icons.add),
        )
    );
  }

  void getVideo(String id) {
    setState(() {
      _videoURL = widget.url;
      videoPlayerController = VideoPlayerController.network(_videoURL);
      chewieController = ChewieController(
          videoPlayerController: videoPlayerController,
          aspectRatio: 16 / 9,
          autoPlay: true,
          looping: false,
          showControls: true,

          materialProgressColors: ChewieProgressColors(
            playedColor: Colors.red,
            handleColor: Colors.blue,
            backgroundColor: Colors.blueGrey,
            bufferedColor: Colors.lightGreen,
          ),
          placeholder: Container(
            color: Colors.grey,
          ),
          autoInitialize: true,
          allowFullScreen: false,
          allowMuting: true,
          allowedScreenSleep: false,
          fullScreenByDefault: false,
          cupertinoProgressColors: ChewieProgressColors(
            playedColor: Colors.red,
            handleColor: Colors.teal,
            backgroundColor: Colors.blueGrey,
            bufferedColor: Colors.lightGreen,
          ),
          showControlsOnInitialize: true
      );
    });
  }
}