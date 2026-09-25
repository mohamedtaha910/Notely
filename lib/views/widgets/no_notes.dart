import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NoNotes extends StatelessWidget {
  const NoNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.38),
          Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              // color: Colors.white70.withAlpha(25),
              // borderRadius: BorderRadius.circular(100),
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Colors.white.withAlpha(70),
                  Colors.white.withAlpha(40),
                  Colors.white.withAlpha(20),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              border: Border(
                top: BorderSide(color: Colors.grey.withAlpha(150), width: 1.4),
              ),
            ),
            child: Icon(
              Iconsax.note_remove5,
              size: 65,
              color: Colors.white.withAlpha(220),
            ),
          ),
          SizedBox(height: 22),
          Text(
            'No Notes Yet',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Tap the Add button to create your first note.',
            style: TextStyle(
              color: Colors.white54,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
          // Spacer(),
        ],
      ),
    );
  }
}
