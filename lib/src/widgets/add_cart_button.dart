import 'package:flutter/material.dart';
import 'package:shoes_app/src/widgets/button.dart';

class AddCartButton extends StatelessWidget {
  final double amount;

  const AddCartButton({@required this.amount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        width: double.infinity,
        height: 60.0,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(100.0)),
        child: Row(
          children: [
            Text(
              '\$$amount',
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Button(
              text: 'Add to cart',
            )
          ],
        ),
      ),
    );
  }
}
