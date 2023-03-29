//import 'dart:js';

import 'question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizBrain {
  int _questionNum = 0;

  final List<Question> _questionBank = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was "Moon".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called "Backrub".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  void nextQuestion() {
    if (_questionNum < _questionBank.length - 1) {
      _questionNum++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNum].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNum].questionAnswer;
  }

  bool isFinished() {
    if (_questionNum >= _questionBank.length - 1) {
      //TODO: Step 3 Part B - Use a print statement to check that isFinished is returning true when you are indeed at the end of the quiz and when a restart should happen.
      print('Now returning true');
      return true;
    } else {
      return false;
    }
  }

  //TODO: Step 4 part B - Create a reset() method here that sets the questionNumber back to 0.
  void reset() {
    _questionNum = 0;
  }
}

// class QuizBrain2 {
//   List<Question> questionBank = [
//     Question(q: '1703년 프랑스어 버전으로 출판된 [아라비안 나이트 (천일야화)]는 중국을 배경으로 했다.', a: true),
//     Question(q: '1부터 7까지 곱한 숫자가 1부터 100까지 더한 숫자보다 높다.', a: false),
//     Question(q: '개구리를 먹던 살모사가 자기 혀를 깨물었을 때 살모사는 죽는다.', a: true),
//     Question(q: '개구리는 이가 있고 두꺼비는 이가 없다.', a: true),
//     Question(q: '가장 강한 독을 가진 개구리 1마리의 독으로 사람을 2000명 이상 죽일 수 있다.', a: true),
//     Question(q: '문어의 다리는 8개이다.', a: true),
//     Question(q: '개의 발에도 땀이 난다.', a: false),
//     Question(q: '낙지는 심장이 3개이다.', a: true),
//   ];
// }
