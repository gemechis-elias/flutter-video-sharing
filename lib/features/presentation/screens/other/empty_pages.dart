import 'package:flutter/material.dart';

import '../../../../../core/data/my_colors.dart';
import '../../../../../core/data/my_text.dart';

class EmptyPages extends StatefulWidget {
  final String title;
  EmptyPages(this.title);

  @override
  EmptyPagesState createState() => EmptyPagesState();
}

class EmptyPagesState extends State<EmptyPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 1,
            iconTheme: const IconThemeData(color: MyColors.grey_60),
            title: Text(widget.title,
                style:
                    MyText.body2(context)!.copyWith(color: MyColors.grey_40)),
            automaticallyImplyLeading: false,
            actions: <Widget>[
              IconButton(
                  icon: const Icon(Icons.done),
                  onPressed: () {
                    Navigator.pop(context);
                  }), // overflow menu
            ]),
        body: const SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ));
  }
}
