import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import '../../../../../core/data/my_colors.dart';
import '../../../../../core/data/my_text.dart';
import '../../../../core/utils/circle_image.dart';
import '../../widgets/comment_threads.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

class RepliesPage extends StatefulWidget {
  RepliesPage();

  @override
  RepliesPageState createState() => RepliesPageState();
}

final TextEditingController _controller = TextEditingController();
bool emojiShowing = false;
bool showSend = false;
final TextEditingController inputController = TextEditingController();

class RepliesPageState extends State<RepliesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: MyColors.grey_60),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text("Reply",
            style: MyText.body2(context)!.copyWith(color: MyColors.grey_40)),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(height: 10),

                    // COMMENT 1
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildCommentWidget(
                          'Gemechis Elias',
                          '2 hour ago',
                          'Lorem ipsum dolor sit amet consectetur. Aliquam sagittis ullamcorper      amet justo quisque          ullamcorper volutpat. Donec feugiat diam et tellus in habitant viverra duis.',
                          340,
                          10,
                        ),
                        const SizedBox(
                            height: 10), // Adjust the spacing between comments

                        // REPLY (COMMENT 2)
                        buildCommentWidget(
                          'Gemechis Elias',
                          '2 hour ago',
                          'Lorem ipsum dolor sit amet consectetur. Aliquam sagittis ullamcorper      amet justo quisque          ullamcorper volutpat. Donec feugiat diam et tellus in habitant viverra duis.',
                          0,
                          0,
                          isReply: true,
                        ),
                      ],
                    ),
                  ],
                ),
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
      ),
    );
  }
}
