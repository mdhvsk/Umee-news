import 'dart:io';
import 'package:app/core/services/supabase_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as path;

class StoryFormScreen extends StatefulWidget {
  const StoryFormScreen({super.key});

  @override
  State<StoryFormScreen> createState() => _StoryFormScreenState();
}

class _StoryFormScreenState extends State<StoryFormScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subtitleController = TextEditingController();
  final TextEditingController _storyController = TextEditingController();
  File? _image;
  final ImagePicker _picker = ImagePicker();
  bool _isUploading = false;
  late SupabaseClient _client;
  static String get supabaseBucketName => dotenv.env['SUPABASE_BUCKET_NAME'] ?? "";


  _StoryFormScreenState() {
    _initializeClient();
  }

  Future<void> _initializeClient() async {
    final instance = await SupabaseClientSingleton.instance;
    _client = instance.client;
  }

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _uploadImage() async {
    if (_image == null) return;

    setState(() {
      _isUploading = true;
    });

    try {
      final String fileName = path.basename(_image!.path);
      final fileExtension = path.extension(fileName);
      final String filePath =
          'uploads/${DateTime.now().toIso8601String()}$fileExtension';

      await _client.storage
          .from(supabaseBucketName) // Replace with your bucket name
          .upload(filePath, _image!);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Image uploaded successfully!')),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error uploading image: $error')),
      );
    } finally {
      setState(() {
        _isUploading = false;
      });
    }
  }


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
                ),
                        ElevatedButton(
          onPressed: _pickImage,
          child: const Text('Pick Image'),
        ),
        const SizedBox(height: 20),
        if (_image != null) ...[
          Image.file(_image!, height: 200),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _isUploading ? null : _uploadImage,
            child: _isUploading
                ? const CircularProgressIndicator()
                : const Text('Upload to Supabase'),
          ),
              ],
            ])));
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
