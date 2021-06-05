import 'package:flutter/material.dart';

class QuizQuestion{
  static List eagle_questions = [
    {'question':'How many feathers adult eagle have ','A':'7200','B':'6590',
      'C':'2528','D':'1245','E':'7000'},
    {'question':'How can eagle see fish under water','A':'they cant','B':'they can',
      'C':'Neither A nor B','D':'both A and B','E':'good eyesight'},
    {'question':'How fast Bald eagles fly',
      'A':'30KMPH','B':'45 KMPH', 'C':'50 KMPH','D':'10 KMPH','E':'12 KMPH'},
    {'question':'How big brain eagles have ','A':'Very big','B':'Small',
      'C':'big','D':'quite small','E':'large'},
    {'question':'How many species eagle are there?','A':'59','B':'90',
      'C':'15','D':'10','E':'500'},
    {'question':'How many feathers adult eagle have ','A':'7200','B':'6590',
      'C':'2528','D':'1245','E':'7000'},
    {'question':'How can eagle see fish under water','A':'they cant','B':'they can',
      'C':'Neither A nor B','D':'both A and B','E':'good eyesight'},
    {'question':'How fast Bald eagles fly',
      'A':'30KMPH','B':'45 KMPH', 'C':'50 KMPH','D':'10 KMPH','E':'12 KMPH'},
    {'question':'How big brain eagles have ','A':'Very big','B':'Small',
      'C':'big','D':'quite small','E':'large'},
    {'question':'How many species eagle are there?','A':'500','B':'90',
      'C':'15','D':'10','E':'500'},
  ];
  static List swam_questions = [
    {'question':'How many egges ducks lay in year',
      'A':'200','B':'1000', 'C':'550','D':'749','E':'656'},
    {'question':'Ducks swim in water?','A':'no','B':'yes',
      'C':'May be','D':'May not be','E':'Non of the above'},
    {'question':'Ducks are noisy',
      'A':'May be','B':'Quite noisy', 'C':'Not at all','D':'yes','E':'no'},
    {'question':'How long ducks live? ','A':'50 years','B':'7 years',
      'C':'10 years','D':'75 years','E':'2 years'},
    {'question':'Can ducklings and chicks can be raised together?','A':'no','B':'may be',
      'C':'yes','D':'all the above','E':'non of the above'},
    {'question':'How many egges ducks lay in year',
      'A':'200','B':'1000', 'C':'550','D':'749','E':'656'},
    {'question':'Ducks swim in water?','A':'no','B':'yes',
      'C':'May be','D':'May not be','E':'Non of the above'},
    {'question':'Ducks are noisy',
      'A':'May be','B':'Quite noisy', 'C':'Not at all','D':'yes','E':'no'},
    {'question':'How long ducks live? ','A':'50 years','B':'7 years',
      'C':'10 years','D':'75 years','E':'2 years'},
    {'question':'Can ducklings and chicks can be raised together?','A':'no','B':'may be',
      'C':'yes','D':'all the above','E':'non of the above'},
  ];
  static List parrot_questions = [
    {'question':'Parrot Can talk?',
      'A':'Yes','B':'No', 'C':'A and B','D':'None','E':'All'},
    {'question':'What parrot eats','A':'Chilly','B':'Grains',
      'C':'A and B','D':'None','E':'All'},
    {'question':'Signs of illness of parrot',
      'A':'happy','B':'sad', 'C':'very sick','D':'all','E':'none'},
    {'question':'Alex born in','A':' Arabian','B':'Africa',
      'C':'India','D':'None','E':'America'},
    {'question':'Alex born in year','A':'1890','B':'2020',
      'C':'1976','D':'1500','E':'1400'},
    {'question':'Parrot Can talk?',
      'A':'Yes','B':'No', 'C':'A and B','D':'None','E':'All'},
    {'question':'What parrot eats','A':'Chilly','B':'Grains',
      'C':'A and B','D':'None','E':'All'},
    {'question':'Signs of illness of parrot',
      'A':'happy','B':'sad', 'C':'very sick','D':'all','E':'none'},
    {'question':'Alex born in','A':' Arabian','B':'Africa',
      'C':'India','D':'None','E':'America'},
    {'question':'Alex born in year','A':'1890','B':'2020',
      'C':'1976','D':'1400','E':'1400'},
  ];
  static List sparrow_questions = [
    {'question':'How many genero of sparrow exist?','A':'9','B':'6',
      'C':'5','D':'10','E':'5'},
    {'question':'how many species of sparrow are there','A':'26','B':'28',
      'C':'40','D':'24','E':'43'},
    {'question':'What is the size of sparrow?',
      'A':'9.4','B':'2.5', 'C':'3.0','D':'12.4','E':'11.4'},
    {'question':'How many species of sparrow are in Passe genera ','A':'30','B':'28',
      'C':'26','D':'Don\'t know','E':'40'},
    {'question':'How many colors of sparrow are there?','A':'2','B':'3',
      'C':'4','D':'5','E':'4'},
    {'question':'How many genero of sparrow exist?','A':'9','B':'6',
      'C':'8','D':'10','E':'5'},
    {'question':'how many species of sparrow are there','A':'26','B':'28',
      'C':'40','D':'24','E':'43'},
    {'question':'What is the size of sparrow?',
      'A':'9.4','B':'2.5', 'C':'3.0','D':'12.4','E':'11.4'},
    {'question':'How many species of sparrow are in Passe genera ','A':'30','B':'28',
      'C':'26','D':'Don\'t know','E':'40'},
    {'question':'How many colors of sparrow are there?','A':'2','B':'3',
      'C':'4','D':'5','E':'4'},
  ];

  static String appBarTitle = 'Quiz Assessment';
  static int correct_answers = 0;
  static int wrong_answers = 0;
  static int not_answered = 0;
  static List marks_details_list =[];
  static List end_time = [];

  static const appBar = Color(0xff008080);
  static const background = Color(0xffFAFAD2);
}