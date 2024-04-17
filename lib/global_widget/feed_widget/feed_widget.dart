import 'package:flutter/material.dart';

import '../../app_config/app_config.dart';

class FeedWidget extends StatefulWidget {
  //const PostCard({super.key});

  final String? profPic;
  final String name;
  final String timePosted;
  final String descriptionPosted;
  final String imagePosted;

  final bool? showBlueTick;
  final String? likeCount;
  final String commentCount;
  final String shareCount;
  final int? itemId;
  final void Function() likePressed;
  final void Function() unlike;
  final void Function() comment;
  final void Function() bookmark;

  FeedWidget({
    this.profPic,
    required this.name,
    required this.timePosted,
    required this.descriptionPosted,
    required this.imagePosted,
    this.showBlueTick = false,
    this.likeCount,
    required this.commentCount,
    required this.shareCount,
    this.itemId,
    required this.likePressed, required this.unlike, required this.comment, required this.bookmark,
  });

  @override
  State<FeedWidget> createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {
  @override
  Widget build(BuildContext context) {
    var imageUrl = widget.imagePosted == null
        ? "https://th.bing.com/th/id/OIP.y6HMdOJ4LiIUWk7n5ZGlpAHaHa?w=480&h=480&rs=1&pid=ImgDetMain"
        : AppConfig.mediaurl + widget.imagePosted!;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // postCardHeader(),
          ListTile(
            // leading: ProfilePics(displayImage: profPic, displayStatus: false),
            title: Row(
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(
                  width: 5,
                ),
                Icon(
                  widget.showBlueTick == true ? Icons.verified : null,
                  color: Colors.blue,
                  size: 26,
                )
              ],
            ),
            subtitle: Text(widget.timePosted == null ? "" : widget.timePosted),
          ),
          // imageSection(),
          Container(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Image.network(imageUrl),
          ),
          titleSection(),
          footerSection(),
          // HeaderButtonSection(
          //   buttonOne: headerButton(
          //       buttonText: "Like",
          //       buttonIcon: Icons.thumb_up_alt_outlined,
          //       buttonAction: () {
          //         Provider.of<FeedPageController>(context, listen: false)
          //             .likeTapped();
          //       },
          //       buttonColor: Colors.orange),
          //   buttonTwo: headerButton(
          //       buttonText: "Comment",
          //       buttonIcon: Icons.message_outlined,
          //       buttonAction: () {},
          //       buttonColor: Colors.orange),
          //   buttonThree: headerButton(
          //       buttonText: "BookMark",
          //       buttonIcon: Icons.bookmark_add_outlined,
          //       buttonAction: () {},
          //       buttonColor: Colors.orange),
          // )
          SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                    onPressed: widget.likePressed,
                    onLongPress: widget.unlike,
                    icon: Icon(
                      Icons.thumb_up_alt_outlined,
                      color: Colors.orange,
                    ),
                    label: Text(
                      "Like",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
                    )),
                headerButton(
                    buttonText: "Comment",
                    buttonIcon: Icons.message_outlined,
                    buttonAction: widget.comment,
                    buttonColor: Colors.orange),
                headerButton(
                    buttonText: "BookMark",
                    buttonIcon: Icons.bookmark_add_outlined,
                    buttonAction: widget.bookmark,
                    buttonColor: Colors.orange),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget displayText({required String label}) {
    return Text(
      label == null ? "" : label,
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
    );
  }

  Widget footerSection() {
    return Container(
      height: 50,
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
                child: const Icon(Icons.thumb_up, color: Colors.white, size: 14),
              ),
              const SizedBox(
                width: 4,
              ),
              displayText(label: "${widget.likeCount}"),
            ],
          ),
          Row(
            children: [
              displayText(label: "${widget.commentCount}"),
              const SizedBox(
                width: 4,
              ),
              displayText(label: "Comments"),
              const SizedBox(
                width: 12,
              ),
              displayText(label: "${widget.shareCount}"),
              const SizedBox(
                width: 4,
              ),
              displayText(label: "Bookmarks"),

              // ProfilePics(
              //   displayImage: profPic,
              //   displayStatus: false,
              //   profHeight: 25,
              //   profWidth: 25,
              // ),
              // const SizedBox(
              //   width: 3,
              // ),
              // IconButton(
              //   onPressed: () {
              //     // print("Drop down pressed");
              //   },
              //   icon: Icon(
              //     Icons.arrow_drop_down,
              //     color: Colors.grey[700],
              //   ),
              // ),
            ],
          )
        ],
      ),
    );
  }

  // Widget imageSection() {
  Widget titleSection() {
    return widget.descriptionPosted != null && widget.descriptionPosted != ""
        ? Container(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(widget.descriptionPosted == null ? "" : widget.descriptionPosted,
                style: const TextStyle(color: Colors.black, fontSize: 16)),
          )
        : const SizedBox();
  }
}

class HeaderButtonSection extends StatelessWidget {
  final Widget buttonOne;
  final Widget buttonTwo;
  final Widget buttonThree;

  const HeaderButtonSection(
      {super.key, required this.buttonOne, required this.buttonTwo, required this.buttonThree});

  @override
  Widget build(BuildContext context) {
    // Widget verticalDivider = VerticalDivider(
    //   thickness: 1,
    //   color: Colors.grey[300],
    // );
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buttonOne,
          buttonTwo,
          buttonThree,
        ],
      ),
    );
  }
}

Widget headerButton(
    {required String buttonText,
    required IconData buttonIcon,
    required void Function() buttonAction,
    required Color buttonColor}) {
  return TextButton.icon(
      onPressed: buttonAction,
      icon: Icon(
        buttonIcon,
        color: buttonColor,
      ),
      label: Text(
        buttonText,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
      ));
}
