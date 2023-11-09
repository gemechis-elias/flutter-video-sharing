import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/data/my_colors.dart';
import '../../../../core/utils/circle_image.dart';
import 'replies_page.dart';

// Comments
bool showSend = false;
final TextEditingController inputController = TextEditingController();
Widget commentCard(BuildContext context) {
  return Card(
    elevation: 10,
    margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
    child: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Center(
              child: Text(
                ' 4.5k Comments  ',
                style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 255, 255, 255),
                    backgroundColor: Color.fromARGB(255, 119, 118, 118)),
              ),
            ),
            Container(height: 10),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff), // Set the background color
                    borderRadius:
                        BorderRadius.circular(15), // Set the border radius
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircleImage(
                            size: 40,
                            imageProvider:
                                AssetImage('assets/images/profile_2.png'),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          // user circular profile photo and name, post date
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Gemechis Elias',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 26, 26, 26),
                                ),
                              ),
                              Text(
                                "2 hour ago",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff6B6F74),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1,
                        )
                      ]),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 45, right: 8, top: 2),
                        child: ExpandableText(
                          "Lorem ipsum dolor sit amet consectetur. Aliquam sagittis ullamcorper      amet justo quisque          ullamcorper volutpat. Donec feugiat diam et tellus in habitant viverra duis. ",
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
                          onHashtagTap: (name) {
                            // showHashtag(name)
                          },
                          hashtagStyle: const TextStyle(
                            color: Color(0xffFEBE44),
                          ),
                          onMentionTap: (username) {
                            //  showProfile(username)
                          },
                          mentionStyle: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                          urlStyle: const TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 35, right: 8, top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: IconButton(
                                    // tint color
                                    color:
                                        const Color.fromARGB(255, 49, 49, 49),
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
                      Padding(
                        padding: const EdgeInsets.only(left: 36.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RepliesPage()),
                            );
                          },
                          child: Container(
                            width: 150,
                            padding: const EdgeInsets.all(10),
                            color: const Color(0xFFFAFAFA),
                            child: const Row(
                              children: [
                                Text(
                                  "View 15 replies ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.black,
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const Divider(
                  thickness: 1,
                  color: Color.fromARGB(255, 245, 245, 245),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff), // Set the background color
                    borderRadius:
                        BorderRadius.circular(15), // Set the border radius
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircleImage(
                            size: 40,
                            imageProvider:
                                AssetImage('assets/images/profile_3.png'),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          // user circular profile photo and name, post date
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Gemechis Elias',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 26, 26, 26),
                                ),
                              ),
                              Text(
                                "2 hour ago",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff6B6F74),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1,
                        )
                      ]),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 45, right: 8, top: 2),
                        child: ExpandableText(
                          "Lorem ipsum dolor sit amet consectetur. Aliquam sagittis ullamcorper      amet justo quisque          ullamcorper volutpat. Donec feugiat diam et tellus in habitant viverra duis. ",
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
                          onHashtagTap: (name) {
                            // showHashtag(name)
                          },
                          hashtagStyle: const TextStyle(
                            color: Color(0xffFEBE44),
                          ),
                          onMentionTap: (username) {
                            //  showProfile(username)
                          },
                          mentionStyle: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                          urlStyle: const TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 35, right: 8, top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: IconButton(
                                    // tint color
                                    color:
                                        const Color.fromARGB(255, 49, 49, 49),
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
                  ),
                ),
                Container(
                  color: Colors.white,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                          icon: const Icon(Icons.sentiment_satisfied,
                              color: MyColors.grey_40),
                          onPressed: () {}),
                      Expanded(
                        child: TextField(
                          controller: inputController,
                          maxLines: 1,
                          minLines: 1,
                          keyboardType: TextInputType.multiline,
                          decoration: const InputDecoration.collapsed(
                              hintText: 'Add Comment'),
                          onChanged: (term) {},
                        ),
                      ),
                      IconButton(
                          icon: const Icon(Icons.send, color: Colors.blue),
                          onPressed: () {}),
                    ],
                  ),
                ),
              ],
            ),
          ],
        )),
  );
}
