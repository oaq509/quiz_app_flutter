// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  const Result(this.resultScore, this.resetHandler);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Done your total score = $resultScore/300',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            width: double.infinity,
            height: 40,
          ),
          OutlinedButton(
            onPressed: resetHandler,
            child: Text('Retry'),
            style: OutlinedButton.styleFrom(primary: Colors.green),
          )
        ],
      ),
    );
  }
}
