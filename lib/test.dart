import 'package:flutter/material.dart';

void main() {
  runApp(CameraUIApp());
}

class CameraUIApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CameraUIScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CameraUIScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/preview.jpg'), // Add your image in assets
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  CustomPaint(
                    painter: GridLinesPainter(),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildModeText('slo-mo', false),
                      _buildModeText('video', false),
                      _buildModeText('photo', true), // Currently selected
                      _buildModeText('square', false),
                      _buildModeText('pano', false),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 50.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/thumbnail.jpg'), // Add thumbnail image
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey.shade400,
                            width: 4.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModeText(String text, bool isSelected) {
    return Text(
      text,
      style: TextStyle(
        color: isSelected ? Colors.white : Colors.grey,
        fontSize: isSelected ? 18 : 16,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}

class GridLinesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.2)
      ..strokeWidth = 1;

    final double thirdWidth = size.width / 3;
    final double thirdHeight = size.height / 3;

    for (int i = 1; i < 3; i++) {
      canvas.drawLine(
        Offset(i * thirdWidth, 0),
        Offset(i * thirdWidth, size.height),
        paint,
      );
    }

    for (int i = 1; i < 3; i++) {
      canvas.drawLine(
        Offset(0, i * thirdHeight),
        Offset(size.width, i * thirdHeight),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
