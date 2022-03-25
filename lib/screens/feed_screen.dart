import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:purple/utils/colors.dart';
import 'package:purple/utils/global_variables.dart';
import 'package:purple/widgets/post_card.dart';
import 'package:provider/provider.dart';
import 'package:purple/providers/user_provider.dart';
import 'package:purple/models/user.dart' as model;

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    model.User user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
        backgroundColor:
            width > webScreenSize ? webBackgroundColor : mobileBackgroundColor,
        appBar: width > webScreenSize
            ? null
            : AppBar(
                backgroundColor: mobileBackgroundColor,
                elevation: 0.0,
                leading: Container(
                  height: 40,
                  width: 40,
                  color: const Color(0xff85488A),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: IconButton(
                    icon: const Icon(
                      Icons.menu_rounded,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(
                      CupertinoIcons.square_favorites_alt_fill,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
        body: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('projects').snapshots(),
            builder: (context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return LayoutBuilder(
                builder:
                    (BuildContext context, BoxConstraints viewportConstraints) {
                  return SingleChildScrollView(
                      child: ConstrainedBox(
                    constraints: BoxConstraints(
                        minHeight: viewportConstraints.maxHeight),
                    child: Column(children: [
                      Text.rich(
                        TextSpan(
                          text: 'Hello, ',
                          style: const TextStyle(
                            color: primaryColor,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: user.fullname,
                              style: const TextStyle(
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'What do you want to donate today?',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            height: 80,
                            width: viewportConstraints.maxWidth,
                            decoration: const BoxDecoration(),
                            child: const Text.rich(
                              TextSpan(
                                text: 'Tip:',
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Color(
                                        0xff652D69)), // default text style
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        ' Try to make your project as transpe donations',
                                    style: TextStyle(
                                      color: Color(0xff652D69),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            child: Container(
                              height: 30,
                              width: 80,
                              alignment: Alignment.bottomLeft,
                              child: CupertinoButton(
                                onPressed: () {},
                                child: const Text('Start a Project'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Text('Categories'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const ImageIcon(
                                  AssetImage('assetName'),
                                ),
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.redAccent,
                                ),
                              ),
                              const Text(
                                'Healthcare',
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                child: const ImageIcon(
                                  AssetImage('assetName'),
                                ),
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.redAccent,
                                ),
                              ),
                              const Text(
                                'Healthcare',
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                child: const ImageIcon(
                                  AssetImage('assetName'),
                                ),
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.redAccent,
                                ),
                              ),
                              const Text(
                                'Healthcare',
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                child: const ImageIcon(
                                  AssetImage('assetName'),
                                ),
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.redAccent,
                                ),
                              ),
                              const Text(
                                'Healthcare',
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(children: [
                        const Text('Projects'),
                        Wrap(
                          spacing: 2.0,
                          children: const [
                            Text('Filter'),
                            Icon(Icons.filter_list_rounded)
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (ctx, index) => Container(
                            margin: EdgeInsets.symmetric(
                              horizontal:
                                  width > webScreenSize ? width * 0.3 : 0,
                              vertical: width > webScreenSize ? 15 : 0,
                            ),
                            child: ProjectCard(
                              snap: snapshot.data!.docs[index].data(),
                            ),
                          ),
                        ),
                      ]),
                    ]),
                  ));
                },
              );
            }));
  }
}
