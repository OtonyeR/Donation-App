import 'package:flutter/material.dart';
import 'package:purple/utils/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: secondaryColor,
                  backgroundImage: NetworkImage(''),
                  radius: 95,
                ),
                Text(
                  'username',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: primaryColor),
                ),
                Text(
                  'location',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(133, 72, 138, 0.7),
                  ),
                ),
                Text(
                  'description',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32.0),
                  topRight: Radius.circular(32.0),
                ),
              ),
              child: Column(
                children: [
                  const Text(
                    'Interests',
                    textAlign: TextAlign.start,
                    style: TextStyle(color: primaryColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 75,
                        width: 75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: const DecorationImage(
                              image: AssetImage("assets/images/bulb.jpg"),
                              fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Container(
                        height: 75,
                        width: 75,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: const DecorationImage(
                                image: AssetImage("assets/images/bulb.jpg"),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Container(
                        height: 75,
                        width: 75,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: const DecorationImage(
                                image: AssetImage("assets/images/bulb.jpg"),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                    ],
                  ),
                  const Text(
                    'Projects',
                    textAlign: TextAlign.start,
                    style: TextStyle(color: primaryColor),
                  ),
                  ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 15,
                    itemBuilder: (BuildContext context, int index) => Card(
                      child: Center(child: Text('Dummy Card Text')),
                    ),
                  ),
                  const Text(
                    'Start a Connection',
                    textAlign: TextAlign.start,
                    style: TextStyle(color: primaryColor),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          child: IconButton(
                            onPressed: () {},
                            icon: const ImageIcon(
                              AssetImage('assets/icons/icons8-facebook-64.png'),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          child: IconButton(
                            onPressed: () {},
                            icon: const ImageIcon(
                              AssetImage(
                                  'assets/icons/icons8-instagram-64.png'),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          child: IconButton(
                            onPressed: () {},
                            icon: const ImageIcon(
                              AssetImage('assets/icons/icons8-twitter-64.png'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
