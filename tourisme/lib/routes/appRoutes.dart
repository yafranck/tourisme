import 'package:flutter/material.dart';




class AppRoutes {

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('Error: Page not found'),
        ),
      );
    });
  }
}
