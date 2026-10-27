// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// class TakePictureScreen extends StatefulWidget {
//   const TakePictureScreen({super.key});
//
//   @override
//   State<TakePictureScreen> createState() => _TakePictureScreenState();
// }
//
// class _TakePictureScreenState extends State<TakePictureScreen> {
//   File? _imageFile;
//   final ImagePicker _picker = ImagePicker();
//
//   Future<void> _takePicture() async {
//     final XFile? photo = await _picker.pickImage(
//       source: ImageSource.camera,
//       maxWidth: 1000,
//       maxHeight: 1000,
//       imageQuality: 85,
//     );
//
//     if (photo != null) {
//       setState(() {
//         _imageFile = File(photo.path);
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Image Picker Camera')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             _imageFile != null
//                 ? Image.file(_imageFile!, height: 300, width: 300, fit: BoxFit.cover)
//                 : const Text('No image captured yet.'),
//             const SizedBox(height: 20),
//             ElevatedButton.icon(
//               onPressed: _takePicture,
//               icon: const Icon(Icons.camera_alt),
//               label: const Text('Open Camera'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }