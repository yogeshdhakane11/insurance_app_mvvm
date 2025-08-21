import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    // Sample chat messages for display
    final messages = [
      {'message': 'Hi, how can I help you?', 'isUser': false},
      {'message': 'I need help with my policy.', 'isUser': true},
      {'message': 'Sure, please provide your policy number.', 'isUser': false},
    ];

    // Get screen width and height using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Support'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: EdgeInsets.all(screenWidth * 0.03), // Responsive padding
              itemCount: messages.length,
              itemBuilder: (_, index) {
                final msg = messages.reversed.toList()[index];
                return Align(
                  alignment: msg['isUser'] as bool
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(
                      screenWidth * 0.03,
                    ), // Responsive padding
                    margin: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.01,
                    ), // Responsive margin
                    decoration: BoxDecoration(
                      color: msg['isUser'] as bool
                          ? Colors.blue
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      msg['message'] as String,
                      style: TextStyle(
                        color: msg['isUser'] as bool
                            ? Colors.white
                            : Colors.black87,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.03, // Responsive horizontal padding
              vertical: screenHeight * 0.01, // Responsive vertical padding
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: 'Ask your question...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(11)),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.03,
                      ), // Responsive content padding
                      suffixIcon: Icon(Icons.attach_file),
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.01), // Responsive space
                IconButton(
                  icon: const Icon(Icons.send),
                  color: Colors.blue,
                  onPressed: () {
                    // No actual send logic, as ViewModel is removed
                    controller.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
