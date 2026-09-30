import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          centerTitle: true, // tiêu đề ra giữa
          backgroundColor: Colors.teal,
          title: Text(
            'Xylophone',
            style: GoogleFonts.pacifico(fontSize: 28, color: Colors.white),
          ),
        ),
        body: const SafeArea(child: XylophoneBody()),
      ),
    );
  }
}

class XylophoneBody extends StatelessWidget {
  const XylophoneBody({super.key});

  static final AudioPlayer _player = AudioPlayer();

  Future<void> playSound(int noteNumber) async {
    await _player.stop();
    await _player.play(AssetSource('note$noteNumber.mp3'));
  }

  Expanded buildKey({
    required Color color,
    required int noteNumber,
    required String label,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // bo góc
            ),
          ),
          onPressed: () => playSound(noteNumber),
          child: Text(
            label,
            style: GoogleFonts.nunito(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        // giới hạn chiều rộng để các phím nằm gọn ở giữa màn hình
        constraints: const BoxConstraints(maxWidth: 320),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(color: Colors.red, noteNumber: 1, label: 'Đô'),
              buildKey(color: Colors.orange, noteNumber: 2, label: 'Rê'),
              buildKey(color: Colors.amber, noteNumber: 3, label: 'Mi'),
              buildKey(color: Colors.green, noteNumber: 4, label: 'Fa'),
              buildKey(color: Colors.teal, noteNumber: 5, label: 'Sol'),
              buildKey(color: Colors.blue, noteNumber: 6, label: 'La'),
              buildKey(color: Colors.purple, noteNumber: 7, label: 'Si'),
              buildKey(color: Colors.pink, noteNumber: 8, label: 'Đô'),
            ],
          ),
        ),
      ),
    );
  }
}