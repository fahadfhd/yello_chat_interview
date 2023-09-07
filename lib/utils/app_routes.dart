import 'package:flutter/material.dart';
import 'package:yellochat_interview/view/home.dart';

RouteFactory onAppGenerateRoute() => (settings) {
      switch (settings.name) {
        case HomeScreen.route:
          return MaterialPageRoute(builder: (context) => const HomeScreen(),);
          
          }
          };