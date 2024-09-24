import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transparent_image/transparent_image.dart';

class RewardScreen extends StatelessWidget {
  const RewardScreen({super.key});
  @override
  Widget build(context) {
    return Scaffold(
      body: Stack(
        children: [
          FadeInImage(
            placeholder: MemoryImage(kTransparentImage),
            image: const NetworkImage(
                "https://wallpaperaccess.com/full/6478814.jpg"),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 80,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 34, 155, 192),
                    Color.fromARGB(255, 85, 169, 172),
                    Color.fromARGB(255, 82, 37, 218),
                    Color.fromARGB(255, 183, 84, 223),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Ahoy there, young pirate! You've answered all the questions with skill and bravery! With your knowledge and courage, you've proven yourself worthy of the title!",
                        style:
                            GoogleFonts.langar(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(height: 10,),
                      Text("Congratulations! You are now the King of the Pirates!",
                          style: GoogleFonts.langar(
                              color: Colors.yellow,
                              fontSize: 26,
                              fontWeight: FontWeight.bold)),
                              const SizedBox(height: 10,),
                      Text(
                          "Set sail on your own adventure, and remember—there's always a new treasure waiting just beyond the horizon!",
                          style:
                              GoogleFonts.langar(color: Colors.white, fontSize: 20))
                    ],
                  ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
