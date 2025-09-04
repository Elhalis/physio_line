import 'package:flutter/material.dart';
import 'package:physio_line/src/presentation/widget/text.dart';

class ExercisePage extends StatelessWidget {
  const ExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: const Color(0xCC1F2937),
        title: const FlutterLogo(size: 50),
        centerTitle: true,
        actions: [EndDrawerButton(color: Colors.white, onPressed: () {})],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16.0),

              SimplePathText(title: 'Home'),

              HeadingText(title: 'Exercise Pattern'),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
