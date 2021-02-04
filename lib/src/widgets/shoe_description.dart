import 'package:flutter/material.dart';

class ShoeDescription extends StatelessWidget {
  final String title, description;

  const ShoeDescription({@required this.title, @required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.0,
          ),
          Text(this.title,
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700)),
          SizedBox(
            height: 20.0,
          ),
          Text(this.description,
              style: TextStyle(height: 1.6, color: Colors.black54)),
        ],
      ),
    );
  }
}
