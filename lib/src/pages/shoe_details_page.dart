import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart' show Bounce, FadeInLeft;
import 'package:provider/provider.dart';

// Models
import 'package:shoes_app/src/models/shoe_model.dart';

// Helpers
import 'package:shoes_app/src/helpers/helpers.dart';

// Widgets
import 'package:shoes_app/src/widgets/custom_widgets.dart';

class ShoeDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(tag: 'shoe-page', child: ShoeSizePreview(fullScreen: true)),
              Positioned(
                top: 75,
                left: 10,
                child: Container(
                  width: 60,
                  height: 60,
                  child: FloatingActionButton(
                      heroTag: 'buttonBack',
                      elevation: 0,
                      highlightElevation: 0,
                      backgroundColor: Colors.transparent,
                      onPressed: () {
                        Navigator.pop(context);
                        changeStatusDark();
                      },
                      child: Icon(Icons.chevron_left,
                          color: Colors.white, size: 60)),
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ShoeDescription(
                    title: 'Nike Air Max 720',
                    description:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                  _Amount(),
                  _Colors(),
                  _OptionButtons()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Amount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        margin: EdgeInsets.only(top: 20.0),
        child: Row(
          children: [
            Text(
              '\$180.0',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Bounce(
              delay: Duration(milliseconds: 400),
              from: 8,
              child: Button(
                text: 'Buy now',
                width: 120,
                height: 40,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Colors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                _ColorButton(
                    color: Color(0xff364D56),
                    url: 'assets/images/black.png',
                    index: 4),
                Positioned(
                  left: 35,
                  child: _ColorButton(
                      color: Color(0xff2099F1),
                      url: 'assets/images/blue.png',
                      index: 3),
                ),
                Positioned(
                  left: 70,
                  child: _ColorButton(
                      color: Color(0xffFFAD29),
                      url: 'assets/images/yellow.png',
                      index: 2),
                ),
                Positioned(
                    left: 105,
                    child: _ColorButton(
                        color: Color(0xffC6D642),
                        url: 'assets/images/green.png',
                        index: 1)),
              ],
            ),
          ),
          Button(
            text: 'More related items',
            width: 170,
            height: 30,
            color: Color(0xffFFC675),
          )
        ],
      ),
    );
  }
}

class _ColorButton extends StatelessWidget {
  final Color color;
  final int index;
  final String url;

  const _ColorButton(
      {@required this.color, @required this.url, this.index = 1});

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: this.index * 100),
      duration: Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () => Provider.of<ShoeModel>(context, listen: false).assetImage =
            this.url,
        child: Container(
            width: 45,
            height: 45,
            decoration:
                BoxDecoration(color: this.color, shape: BoxShape.circle)),
      ),
    );
  }
}

class _OptionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _OptionButton(icon: Icon(Icons.star, color: Colors.redAccent)),
          _OptionButton(
            icon: Icon(Icons.add_shopping_cart,
                color: Colors.grey.withOpacity(0.4)),
          ),
          _OptionButton(
              icon: Icon(Icons.settings, color: Colors.grey.withOpacity(0.4))),
        ],
      ),
    );
  }
}

class _OptionButton extends StatelessWidget {
  final Icon icon;

  const _OptionButton({
    @required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 20,
                spreadRadius: -5,
                offset: Offset(0, 10))
          ]),
      child: FloatingActionButton(
        heroTag: this.icon,
        elevation: 0,
        highlightElevation: 0,
        backgroundColor: Colors.transparent,
        onPressed: () {},
        child: this.icon,
      ),
    );
  }
}
