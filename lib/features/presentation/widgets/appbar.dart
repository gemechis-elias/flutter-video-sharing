import 'package:flutter/material.dart';

AppBar MyAppBar() {
  return AppBar(
    toolbarHeight: 38,
    title: Row(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: CircleAvatar(
            radius: 10,
            backgroundImage: AssetImage('assets/images/logo.png'),
          ),
        ),
        Row(
          children: [
            const Text(
              'SeeQul',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 15,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward_ios, size: 12),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
      ],
    ),
    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
  );
}
