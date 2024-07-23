import 'dart:io';

import 'package:flutter/material.dart';

class StoryFormScreen extends StatefulWidget {
  const StoryFormScreen({super.key});

  @override
  State<StoryFormScreen> createState() => _StoryFormScreenState();
}

class _StoryFormScreenState extends State<StoryFormScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subtitleController = TextEditingController();
  final TextEditingController _storyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add News Story"),
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_rounded)),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Default_pfp.svg/2048px-Default_pfp.svg.png'),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInputField(
                    controller: _storyController,
                    label: 'News Story Title',
                    maxLines: 1),
                SizedBox(height: 16),
                _buildInputField(
                    controller: _subtitleController,
                    label: 'News Story Description',
                    maxLines: 1),
                SizedBox(height: 16),
                _buildInputField(
                    controller: _storyController,
                    label: 'Story Text',
                    maxLines: 5),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    // Handle form submission
                  },
                  child: Text('Preview Request'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                )
              ],
            )));
  }
}

Widget _buildInputField(
    {required TextEditingController controller,
    required String label,
    required int maxLines}) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      labelText: label,
              alignLabelWithHint: false,
        floatingLabelBehavior: FloatingLabelBehavior.always,

      // prefixIcon: Icon(icon),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    textAlignVertical: TextAlignVertical.top,
    maxLines: maxLines,
  );
}
