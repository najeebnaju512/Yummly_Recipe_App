import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/app_config/app_config.dart';
import 'package:recipe_app/presentation/feed_page/controller/feed_page_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key, required this.id});

  final int? id;

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  fetchData() {
    Provider.of<FeedPageController>(context, listen: false).fetchComments(widget.id, context);
  }

  @override
  void initState() {
    fetchData();
    getReceivedData();
    super.initState();
  }

  late SharedPreferences sharedPreferences;
  var data;
  var commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Consumer<FeedPageController>(builder: (context, controller, _) {
      return controller.isLoadingComments
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              appBar: AppBar(title: Text("Comments")),
              body: RefreshIndicator(
                onRefresh: () => Provider.of<FeedPageController>(context, listen: false).fetchComments(widget.id, context),
                child: ListView.builder(
                    itemCount: controller.commentsModel.data?.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(),
                        title: Text("${data["id"]}" == "${controller.commentsModel.data?[index].user}"
                            ? "Me"
                            : "User ${controller.commentsModel.data?[index].user}"),
                        subtitle: Text(controller.commentsModel.data![index].text.toString()),
                      );
                    }),
              ),
              bottomNavigationBar: Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black), borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: size.width * .5,
                          child: TextFormField(
                            controller: commentController,
                            decoration: InputDecoration(focusedBorder: InputBorder.none),
                          )),
                      ElevatedButton.icon(onPressed: () {
                        Provider.of<FeedPageController>(context,listen: false).postComment(widget.id, commentController.text.trim(), context);
                      }, icon: Icon(Icons.send), label: Text("Comment"))
                    ],
                  ),
                ),
              ),
            );
    });
  }

  getReceivedData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    var storeData;
    storeData = sharedPreferences.getString(AppConfig.loginData);
    data = jsonDecode(storeData);
    log("data -> $data");
  }
}
