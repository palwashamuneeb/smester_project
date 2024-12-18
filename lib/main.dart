// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'package:path_provider/path_provider.dart';
// // import 'package:gallery_saver/gallery_saver.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: CameraScreen(),
//     );
//   }
// }

// class CameraScreen extends StatefulWidget {
//   const CameraScreen({super.key});

//   @override
//   _CameraScreenState createState() => _CameraScreenState();
// }

// class _CameraScreenState extends State<CameraScreen> {
//   CameraController? _controller;
//   List<CameraDescription>? _cameras;
//   bool _isInitialized = false;

//   @override
//   void initState() {
//     super.initState();
//     _initializeCamera();
//   }

//   Future<void> _initializeCamera() async {
//     _cameras = await availableCameras();
//     _controller = CameraController(_cameras![0], ResolutionPreset.high);
//     await _controller!.initialize();
//     setState(() {
//       _isInitialized = true;
//     });
//   }

//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }

//   Future<void> _takePicture() async {
//     if (_controller == null || !_controller!.value.isInitialized) {
//       return;
//     }

//     final Directory extDir = await getApplicationDocumentsDirectory();
//     final String dirPath = '${extDir.path}/Pictures/flutter_test';
//     await Directory(dirPath).create(recursive: true);
//     final String filePath =
//         '$dirPath/${DateTime.now().millisecondsSinceEpoch}.jpg';

//     if (_controller!.value.isTakingPicture) {
//       return;
//     }

//     // try {
//     //   await GallerySaver.saveImage(filePath);
//     //   await _controller!.takePicture();
//     //   ScaffoldMessenger.of(context).showSnackBar(
//     //       const SnackBar(content: Text('Picture saved to gallery!')));
//     // } catch (e) {
//     //   print(e);
//     // }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Camera App'),
//       ),
//       body: mycamra
//           ? Column(
//               children: [
//                 AspectRatio(
//                   aspectRatio: _controller!.value.aspectRatio,
//                   child: CameraPreview(_controller!),
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: _takePicture,
//                   child: const Text('Capture Image'),
//                 ),
//               ],
//             )
//           : Center(
//               child: CircularProgressIndicator(),
//             ),
//     );
//   }

//   bool get mycamra => _isInitialized;
// }

import 'package:flutter/material.dart';
import 'package:test_project/camra_screen.dart';

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CamraScreen(),
    );
  }
}
