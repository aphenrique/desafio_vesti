import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width / 2 - 2;
    double _height = _width * (4 / 3);

    return Container(
      width: _width,
      height: _height,
      color: Colors.white,
      margin: const EdgeInsets.all(1),
      child: Stack(
        // alignment: Alignment.bottomLeft,
        children: [
          Positioned.fill(
            left: 10,
            bottom: 60,
            right: 20,
            top: 10,
            child: InkResponse(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                // padding: EdgeInsets.symmetric(horizontal: 20),
                child: Image.network(
                  "https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg",
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 44,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  "\$ 12.99",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "DANVOUY Womens T Shirt Casual Cotton Short",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.bookmark_outline_rounded,
                color: Colors.black,
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: 40,
              // height: 40,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkResponse(
                    onTap: () {},
                    child: const SizedBox(
                      height: 40,
                      child: Icon(
                        Icons.minimize,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 40,
                    child: const Text(
                      "02",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  InkResponse(
                    onTap: () {},
                    child: const SizedBox(
                      height: 40,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
