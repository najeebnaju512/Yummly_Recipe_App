import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/presentation/creators/controller/creators_controller.dart';

class AllCreators extends StatefulWidget {
  const AllCreators({super.key});

  @override
  State<AllCreators> createState() => _AllCreatorsState();
}

class _AllCreatorsState extends State<AllCreators> {
  fetchData() {
    Provider.of<CreatorsController>(context, listen: false)
        .fetchCreatorsList(context);
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Users',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 24),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
      ),
      body: Consumer<CreatorsController>(builder: (context, controller, child) {
        return ListView.builder(
          itemCount: controller.creatorsModel.users?.length,
          itemBuilder: (context, index) => Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    // leading: const CircleAvatar(
                    //   maxRadius: 50,
                    //   //minRadius: 40,
                    //   backgroundImage:
                    //       AssetImage("recipe_app/assets/images/userimage3.jpg"),
                    // ),
                    title: Text(
                      controller.creatorsModel.users?[index].username ?? "",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    trailing: TextButton(
                      onPressed: () {
                        Provider.of<CreatorsController>(context,listen: false).followUser(
                            context, controller.creatorsModel.users?[index].id.toString(),);
                      },
                      child: const Text(
                        'Follow',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
