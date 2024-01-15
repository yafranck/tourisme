import 'package:tourisme/widgets/PostAppBar.dart';
import 'package:tourisme/widgets/PostBottomBar.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/images/img7.jpg"),
        fit: BoxFit.cover,
        opacity: 0.7,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
           child: PostAppBar()
           ),
           bottomNavigationBar: PostBottomBar(),
      ),
    );
  }
}
