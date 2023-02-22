// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'dart:async';
import 'dart:io';

import 'package:cruz/widget1/buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// @dart=2.9

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {


   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

   String game="Calculator";
   String history="";
   int firstnum=0;
   int secondnum=0;
   String op="";
   String disp="";
   int c=0;
   int cntr=5;

  Future<void> btclick(String btnval)
  async {
    if(btnval=="+" || btnval=="-" || btnval=="x" || btnval=="/" || btnval=="%")
      {
          firstnum = int.parse(disp);
          setState(() {
            disp="";
          });

          op=btnval;


      }
    else if(btnval == "=")
      {
        secondnum = int.parse(disp);

        setState(() {
          history = firstnum.toString()+op.toString()+secondnum.toString();
        });




        if(op=="+")
        {
          setState(() {
            disp=(secondnum+firstnum).toString();
          });
        }
        else if(op=="-")
        {
          setState(() {
            disp=(firstnum-secondnum).toString();
          });
        }
        else if(op=="/")
        {
          setState(() {
            disp=(firstnum/secondnum).toString();
          });
        }
        else if(op=="%")
        {
          setState(() {
            disp=(firstnum%secondnum).toString();
          });
        }
        else if(op=="x")
        {
          setState(() {
            int val=firstnum*secondnum;
            disp=(val).toString();
          });
        }

      }
    else if(btnval == "AC")
      {
        if(disp=="")
        {
          c++;
        }

        setState(() {
          disp="";
        });
        history="";
        firstnum=0;
        secondnum=0;




        print(c);

        if(c==2)
          {


            setState(() {
              game="What is Vishaal's favourite number?";
              cntr=5;
            });


            Timer.periodic(new Duration(seconds: 1), (timer) {

              if(cntr==0 || disp!="")
                {

                  if(disp!="2")
                  {
                    setState(() {

                      game="YOU DON'T KNOW YOUR VISHAAL !!";
                    });
                  }
                  else{
                    setState(() {
                      game="YOU KNOW YOUR VISHAAL !! 😘😘";
                    });
                  }
                  timer.cancel();
                }
              else
                {
                  setState(() {
                    game=cntr.toString();
                  });
                  cntr--;
                }

            });

            c=0;

          }
        else if(c<2)
          {
            setState(() {
              game="Calculator";
            });

          }
        else if(c>2)
          {
            setState(() {
              game="Calculator";
            });
            c=0;
          }
      }
    else
      {
        setState(() {
          setState(() {
            disp=disp+btnval;
          });
        });
      }
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: "Valculator",
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title:  Text(game,
          style: GoogleFonts.barlowCondensed(
          fontSize: 25
          ),),
        ),
          body: Container(
            margin: EdgeInsets.only(left: 10,right: 10, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(right: 15, bottom: 10),
                    child: Text(history,
                      style: GoogleFonts.rubik(
                        textStyle: TextStyle(color: Colors.grey, fontSize: 30)
                    )
                    ),

                  ),
                  alignment: Alignment(1.0,1.0),
                ),
                Container(

                  child: Padding(
                    padding: EdgeInsets.only(right: 15,bottom: 20),
                    child: Text(disp,
                        style: GoogleFonts.rubik(
                            textStyle: TextStyle(color: Colors.white, fontSize: 90 )
                        ),)
                  ),
                  alignment: Alignment(1.0,1.0),
                ),
                Row(
                  children: [
                    buttons(text: '%',bgcolor: 0x8c8c8c,callback: btclick),
                    buttons(text: '/',bgcolor: 0x8c8c8c,callback: btclick),
                    buttons(text: '=',bgcolor: 0x8c8c8c,callback: btclick),
                    buttons(text: 'AC',bgcolor: 0xf99914,callback: btclick)
                  ],
                ),
              Row(
                children: [
                  buttons(text: '1',bgcolor: 0x252525,callback: btclick),
                  buttons(text: '2',bgcolor: 0x252525,callback: btclick),
                  buttons(text: '3',bgcolor: 0x252525,callback: btclick),
                  buttons(text: '+',bgcolor: 0xf99914,callback: btclick),
              ],),
                Row(
                  children: [
                    buttons(text: '4',bgcolor: 0x252525,callback: btclick),
                    buttons(text: '5',bgcolor: 0x252525,callback: btclick),
                    buttons(text: '6',bgcolor: 0x252525,callback: btclick),
                    buttons(text: '-',bgcolor: 0xf99914,callback: btclick),
                  ],
                ),
                Row(
                  children: [
                    buttons(text: '9',bgcolor: 0x252525,callback: btclick),
                    buttons(text: '8',bgcolor: 0x252525,callback: btclick),
                    buttons(text: '7',bgcolor: 0x252525,callback: btclick),
                    buttons(text: 'x',bgcolor: 0xf99914,callback: btclick),
                  ],
                )

            ],


            )),

          ),
      );
  }
}