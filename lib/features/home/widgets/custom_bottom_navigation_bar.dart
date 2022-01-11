import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        textDirection: TextDirection.ltr,
        children: [
          IconButton(
            color: Colors.black,
            onPressed: () {},
            icon: const Icon(Icons.grid_view_rounded),
          ),
          IconButton(
            color: Colors.black,
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          const SizedBox(width: 60),
          IconButton(
            color: Colors.black,
            onPressed: () {},
            icon: const Icon(Icons.bookmark_border_rounded),
          ),
          IconButton(
            color: Colors.black,
            onPressed: () {},
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
      ),
    );
  }
}
