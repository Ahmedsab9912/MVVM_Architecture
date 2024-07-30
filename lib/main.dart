import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerprac/utils/routes/routes.dart';
import 'package:providerprac/utils/routes/routes_name.dart';
import 'package:providerprac/view_model/auth_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
      ],
      child: const MaterialApp(
        title: "Flutter Demo",
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesName.login,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
