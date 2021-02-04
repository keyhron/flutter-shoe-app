import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Pages
import 'package:shoes_app/src/pages/shoe_details_page.dart';

// Helpers
import 'package:shoes_app/src/helpers/helpers.dart';

// Models
import 'package:shoes_app/src/models/shoe_model.dart';

class ShoeSizePreview extends StatelessWidget {
  final bool fullScreen;

  const ShoeSizePreview({this.fullScreen = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!fullScreen) {
          changeStatusLight();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => ShoeDetailsPage()));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: fullScreen ? 0.0 : 30.0,
          vertical: fullScreen ? 0.0 : 5.0,
        ),
        child: Container(
          width: double.infinity,
          height: fullScreen ? 410 : 430,
          decoration: BoxDecoration(
            color: Color(0xffFFCF53),
            borderRadius: fullScreen
                ? BorderRadius.only(
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0))
                : BorderRadius.circular(50.0),
          ),
          child: Column(
            children: [
              // Shoe with shadow
              _ShoeWithShadow(),

              // Sizes
              if (!fullScreen) _ShoeSizes()
            ],
          ),
        ),
      ),
    );
  }
}

class _ShoeWithShadow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 30.0),
      child: Stack(
        children: [
          Positioned(bottom: 10, right: 0, child: _ShoeShadow()),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Image(
              image: AssetImage(shoeModel.assetImage),
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes
                        : null,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ShoeShadow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230,
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            boxShadow: [BoxShadow(color: Color(0xffEAA14E), blurRadius: 40.0)]),
      ),
    );
  }
}

class _ShoeSizes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _ShoeSizeItem(size: '37'),
          _ShoeSizeItem(size: '38'),
          _ShoeSizeItem(size: '39'),
          _ShoeSizeItem(size: '40'),
          _ShoeSizeItem(size: '41'),
          _ShoeSizeItem(size: '42'),
        ],
      ),
    );
  }
}

class _ShoeSizeItem extends StatelessWidget {
  final String size;
  const _ShoeSizeItem({@required this.size});

  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);
    final bool selected = this.size == shoeModel.size;

    return GestureDetector(
      onTap: () =>
          Provider.of<ShoeModel>(context, listen: false).size = this.size,
      child: Container(
          alignment: Alignment.center,
          width: 45,
          height: 45,
          decoration: BoxDecoration(
              color: selected ? Color(0xffF1A23A) : Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                if (selected)
                  BoxShadow(
                      color: Color(0xffF1A23A),
                      blurRadius: 10.0,
                      offset: Offset(0, 5))
              ]),
          child: Text(
            this.size,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: selected ? Colors.white : Color(0xffF1A23A),
            ),
          )),
    );
  }
}
