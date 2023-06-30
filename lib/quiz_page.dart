import 'package:flutter/material.dart';
import 'package:general_quiz/questions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audiofileplayer/audiofileplayer.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int questionNumber = 0;
  List<Icon> scoreKeeper = [];
  Icon right = const Icon(Icons.check, color: Colors.green);
  Icon wrong = const Icon(Icons.close, color: Colors.red);
  Audio rightAudio = Audio.load('assets/correct.mp3');
  Audio wrongAudio = Audio.load('assets/wrong.mp3');
  int rightButtonOpacity = 164;
  int wrongButtonOpacity = 180;
  void updatePage(bool answer) {
    if (questionBank[questionNumber].answer == answer) {
      scoreKeeper.add(right);
      rightAudio.play();
      rightButtonOpacity += 10;
      wrongButtonOpacity -= 10;
    } else {
      scoreKeeper.add(wrong);
      wrongAudio.play();
      wrongButtonOpacity += 10;
      rightButtonOpacity -= 10;
    }
    ++questionNumber;
  }

  @override
  Widget build(BuildContext context) {
    int correctAnswer = scoreKeeper.where((icon) => icon == right).length;
    int totalQuestions = questionBank.length;
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
                questionNumber < totalQuestions
                    ? questionBank[questionNumber].question
                    : 'You answered $correctAnswer/$totalQuestions question correctly',
                textAlign: TextAlign.center,
                style: GoogleFonts.acme(
                  fontSize: 25.0,
                  color: Colors.white,
                  backgroundColor: Colors.black,
                ),
              ),
            ),
          ),
        ),
        questionNumber < totalQuestions
            ? Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor:
                            Color.fromARGB(rightButtonOpacity, 0, 104, 3),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: Text(
                        'True',
                        style: GoogleFonts.bebasNeue(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 5,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          updatePage(true);
                        });
                      },
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor:
                            Color.fromARGB(wrongButtonOpacity, 244, 67, 54),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: Text(
                        'False',
                        style: GoogleFonts.bebasNeue(
                          color: Colors.white,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          updatePage(false);
                        });
                      },
                    ),
                  ),
                ],
              )
            : Container(
                width: double.maxFinite,
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.teal[900],
                      padding: const EdgeInsets.symmetric(vertical: 30)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.restart_alt,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Restart Quiz',
                        style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      questionNumber = 0;
                      scoreKeeper.clear();
                      questionBank.shuffle();
                      wrongButtonOpacity = 180;
                      rightButtonOpacity = 164;
                    });
                  },
                ),
              ),
        Container(
          margin: const EdgeInsets.only(left: 15),
          child: Center(
            child: Wrap(
              children: scoreKeeper,
            ),
          ),
        )
      ],
    );
  }
}
