import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/circle_image.dart';

Widget buildCommentWidget(
    String username, String timestamp, String comment, int likes, int comments,
    {bool isReply = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (isReply) // Add a vertical line for replies
        Container(
          margin: EdgeInsets.only(left: 20, top: 12, bottom: 8),
          width: 1,
          height: 40,
          color: Colors.grey,
        ),
      Row(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleImage(
              size: 40,
              imageProvider: AssetImage('assets/images/profile_2.png'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 26, 26, 26),
                  ),
                ),
                Text(
                  timestamp,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff6B6F74),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(left: 45, right: 8, top: 2),
        child: ExpandableText(
          comment,
          animation: true,
          collapseOnTextTap: true,
          linkColor: const Color.fromARGB(255, 68, 186, 254),
          expandText: "More",
          collapseText: 'show less',
          maxLines: 3,
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontSize: 14,
            color: Color.fromARGB(255, 37, 37, 37),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 35, right: 8, top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 40,
                  width: 40,
                  child: IconButton(
                    color: const Color.fromARGB(255, 49, 49, 49),
                    splashRadius: 10,
                    iconSize: 25,
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  "340",
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 36, 36, 36),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                const Icon(
                  Icons.comment,
                  color: Color.fromARGB(255, 22, 22, 22),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  "10",
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 48, 48, 48),
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                const Icon(
                  Icons.flag_outlined,
                  color: Color.fromARGB(255, 51, 51, 51),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
