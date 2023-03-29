import 'package:flutter/cupertino.dart';

import 'question.dart';
import 'quiz_brain.dart';
import 'main.dart';

class CalculatePercentage {
  int totalSuccessCnt = 0;
  int totalQuzzCnt = 0;
  double c = 0.0;

  CalculatePercentage(this.totalQuzzCnt);

  double? calculatePer(bool? userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();
    if (correctAnswer == userPickedAnswer) {
      totalSuccessCnt++;
      print(totalSuccessCnt);
    } else {
      double c = totalSuccessCnt * 100 / totalQuzzCnt;
      print(c);
      return c;
    }
  }
}
