import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/colors.dart';
import 'providers/changestatus.dart';
import 'providers/order_provider.dart';
import 'screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider<OrderProvider>(
          create: (context) => OrderProvider(),
        ),
        ChangeNotifierProvider<ChangeStatus>(
          create: (context) => ChangeStatus(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // Provider.of<OrderProvider>(context).fetchPost();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
      ),
      home: const HomeScreen(),
    );
  }
}


