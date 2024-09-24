import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummarData extends StatelessWidget {
  const SummarData({required this.summaryData, super.key});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: summaryData
                .map(
                  (data) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: data["user_answer"] == data["correct_answer"]
                            ? const Color.fromARGB(255, 39, 224, 45)
                            : const Color.fromARGB(255, 174, 21, 10),
                        child: Text(style: GoogleFonts.laila(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),textAlign:TextAlign.center,((data["question_index"] as int) + 1).toString()),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data["question"] as String,
                              style: GoogleFonts.laila(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10,),
                            Text(data["user_answer"]as String,style: GoogleFonts.langar(
                                  color:data["user_answer"] == data["correct_answer"]
                              ? const Color.fromARGB(255, 39, 224, 45)
                              : const Color.fromARGB(255, 174, 21, 10),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                            Text(data["correct_answer"]as String,style: GoogleFonts.langar(
                                  color: const Color.fromARGB(255, 222, 202, 14),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 40,)
                          ],
                        ),
                      )
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
