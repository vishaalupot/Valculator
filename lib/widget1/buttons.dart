import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class buttons extends StatelessWidget {

  final String text;
  final int bgcolor;
  final Function callback;


  const buttons({
    required this.text,
    required this.bgcolor,
    required this.callback
});


  @override
  Widget build(BuildContext context) {
    return  Container(
    margin: EdgeInsets.all(7),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
    Row(
    children: [
    SizedBox(
    width: 70,
    height: 70,

    child:  TextButton(
    child: Text(text,
    style: GoogleFonts.rubik(
      textStyle: TextStyle(color: Colors.white, fontSize: 30),
    )),
    style: TextButton.styleFrom(
      backgroundColor: Color(bgcolor).withOpacity(1),
      padding: const EdgeInsets.all(0),
      shape: CircleBorder(
        side: BorderSide(width: 0, color: Color(0x252525).withOpacity(1)),
    ),
      ),
    onPressed: () => callback(text),
  ),

  ),
  ],),
  ],
  )
    );
  }
}
