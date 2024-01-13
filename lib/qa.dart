import 'package:flutter/material.dart';

class QA {
  final String question;
  final List<String> answers;

  QA({required this.question, this.answers = const []});
}

class QAScreen extends StatefulWidget {
  @override
  _QAScreenState createState() => _QAScreenState();
}

class _QAScreenState extends State<QAScreen> {
  List<QA> qaList = [
    QA(question: 'How to register a place?'),
    QA(question: 'Best tourist spots in Malaysia?'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Q&A'),
      ),
      body: ListView.builder(
        itemCount: qaList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(qaList[index].question),
            onTap: () {
              _navigateToAnswerScreen(qaList[index]);
            },
          );
        },
      ),
    );
  }

  _navigateToAnswerScreen(QA qa) async {
    final newAnswer = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            AnswerScreen(question: qa.question, answers: qa.answers),
      ),
    );

    if (newAnswer != null && newAnswer.isNotEmpty) {
      setState(() {
        qa.answers.add(newAnswer);
      });
    }
  }
}

class AnswerScreen extends StatefulWidget {
  final String question;
  final List<String> answers;

  AnswerScreen({required this.question, required this.answers});

  @override
  _AnswerScreenState createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<AnswerScreen> {
  TextEditingController _answerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Answer Question'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.question),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: widget.answers.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(widget.answers[index]),
                  );
                },
              ),
            ),
            TextField(
              controller: _answerController,
              decoration: InputDecoration(labelText: 'Your Answer'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, _answerController.text);
              },
              child: Text('Submit Answer'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _answerController.dispose();
    super.dispose();
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Q&A App',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: QAScreen(),
  ));
}
