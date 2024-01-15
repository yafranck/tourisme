import 'package:flutter/material.dart';

class SimplePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ceci est une page simple dans Flutter.',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'Bla bla bla :',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),

    );
  }
}


