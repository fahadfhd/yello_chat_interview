import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:size_config_fl/size_config_fl.dart';
import 'package:yellochat_interview/providers/data_provider.dart';
import 'package:yellochat_interview/utils/app_routes.dart';
import 'package:yellochat_interview/view/home.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => DataProvider())],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) 
           {
            SizeConfig(
            designScreenWidth: 375,
            designScreenHeight: 875,
          ).init(constraints, orientation);
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
               
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              initialRoute: HomeScreen.route,
             onGenerateRoute:onAppGenerateRoute() ,
            );
          }
        );
      }
    );
  }
}  

