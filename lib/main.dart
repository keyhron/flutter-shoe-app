import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Pages
import 'package:shoes_app/src/pages/shoe_page.dart';

// Models
import 'package:shoes_app/src/models/shoe_model.dart';

void main() =>
    runApp(ChangeNotifierProvider(create: (_) => ShoeModel(), child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shoes App',
      debugShowCheckedModeBanner: false,
      home: ShoePage(),
    );
  }
}
