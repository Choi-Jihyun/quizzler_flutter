import 'package:flutter/material.dart';
//import 'question.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'percentage_answer.dart';

QuizBrain quizBrain = QuizBrain();
//CalculatePercentage calculatePercentage = CalculatePercentage();

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  CalculatePercentage c = CalculatePercentage(6);

  // List<String> questions = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.',
  // ];

  //List<bool> answers = [false, true, true];

  // List<Question> questionBank = [
  //   Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
  //   Question(
  //       q: 'Approximately one quartexr of human bones are in the feet.',
  //       a: true),
  //   Question(q: 'A slug\'s blood is green.', a: true),
  //   Question(q: '', a: true)
  // ];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();

        //TODO Step 4 Part C - reset the questionNumber,
        quizBrain.reset();

        //TODO Step 4 Part D - empty out the scoreKeeper.
        scoreKeeper = [];
      } else {
        if (correctAnswer == userPickedAnswer) {
          //Todo c.맞춘개수추가();
          scoreKeeper.add(const Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreKeeper.add(const Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        //Todoc.점수출력();
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
                child: Text(
              quizBrain.getQuestionText(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25.0,
                color: Colors.white,
              ),
            )),
          ),
        ),
        //Todo 퍼센테이지 고쳐야함
        // Expanded(
        //   flex: 2,
        //   child: Padding(
        //     padding: const EdgeInsets.all(10.0),
        //     child: Center(
        //         child: Text(
        //       '${calculatePercentage.calculatePer(userPickedAnswer).toStringAsFixed(2)}%',
        //       textAlign: TextAlign.center,
        //       style: const TextStyle(
        //         fontSize: 25.0,
        //         color: Colors.white,
        //       ),
        //     )),
        //   ),
        // ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(true);
                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //bool correctAnswer = questionBank[questionNum].questionAnswer;
                checkAnswer(false);

                //The user picked false.
              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}

_onBasicAlertPressed(context) async {
  await Alert(
    context: context,
    title: "Finished",
    desc: "You've reached the end of the quiz.",
  ).show();
  debugPrint("Alert closed mow.");
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
