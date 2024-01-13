import 'package:flutter/material.dart';

class FeedbackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback by Categories'),
        backgroundColor: const Color.fromARGB(255, 183, 109, 196),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTile(
              title: Text('General Feedback'),
              subtitle: Text('Provide general feedback about the app'),
              onTap: () {
                _navigateToFeedbackDetail(context, 'General Feedback');
              },
            ),
            Divider(),
            ListTile(
              title: Text('Location Feedback'),
              subtitle: Text('Feedback related to location features'),
              onTap: () {
                _navigateToFeedbackDetail(context, 'Location Feedback');
              },
            ),
            Divider(),
            ListTile(
              title: Text('UI/UX Feedback'),
              subtitle:
                  Text('Provide feedback about user interface and experience'),
              onTap: () {
                _navigateToFeedbackDetail(context, 'UI/UX Feedback');
              },
            ),
            Divider(),
            // Add more feedback categories as needed
          ],
        ),
      ),
    );
  }

  void _navigateToFeedbackDetail(BuildContext context, String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FeedbackDetailScreen(category: category),
      ),
    );
  }
}

class FeedbackDetailScreen extends StatelessWidget {
  final String category;

  const FeedbackDetailScreen({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$category Feedback'),
        backgroundColor: const Color.fromARGB(255, 183, 109, 196),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Provide your feedback for $category:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            // You can add a form field or text field to capture feedback here
            const TextField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Enter your feedback here...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Logic to submit feedback
                Navigator.pop(
                    context); // Navigate back to previous screen after submitting feedback
              },
              child: Text('Submit Feedback'),
            ),
          ],
        ),
      ),
    );
  }
}
