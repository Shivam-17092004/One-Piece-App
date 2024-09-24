import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget{
  const AnswerButton({required this.buttonTap,required this.answer, super.key});
  final String answer;
  final void Function()buttonTap;
  @override
  Widget build(context){
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 226, 180, 31)), onPressed: buttonTap, child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Text(textAlign:TextAlign.center,answer,style: GoogleFonts.langar(fontSize: 18,color:Colors.white,fontWeight: FontWeight.bold),),
      )),
    );
  }
}