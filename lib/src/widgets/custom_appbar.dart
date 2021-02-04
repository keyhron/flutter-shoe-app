import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String text;

  const CustomAppBar({@required this.text});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Container(
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        width: double.infinity,
        child: Row(
          children: [
            Text(this.text,
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
            Spacer(),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 30.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
