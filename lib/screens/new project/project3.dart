import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:purple/providers/user_provider.dart';
import 'package:purple/screens/new%20project/project4.dart';
import 'package:purple/utils/utils.dart';

class ProjectScreen3 extends StatefulWidget {
  const ProjectScreen3({Key? key}) : super(key: key);

  @override
  _ProjectScreen3State createState() => _ProjectScreen3State();
}

class _ProjectScreen3State extends State<ProjectScreen3> {
  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];

  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    print("Image List Length:" + imageFileList!.length.toString());
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);

    return imageFileList == null
        ? Stack(
            children: [
              Container(
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(101, 45, 105, 11.0),
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
              Positioned(
                child: IconButton(
                  alignment: Alignment.center,
                  icon: const Icon(Icons.add_a_photo_rounded),
                  onPressed: () => selectImages(),
                ),
              )
            ],
          )
        : Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                        itemCount: imageFileList!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3),
                        itemBuilder: (BuildContext context, int index) {
                          return Image.file(
                            File(imageFileList![index].path),
                            fit: BoxFit.cover,
                          );
                        }),
                  ),
                ),
                const SizedBox(
                  width: 50,
                  child: Text.rich(
                    TextSpan(
                      text: 'Tip:',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Color(0xff652D69)), // default text style
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              ' Try to make your project as transperent as possible to encourage donations',
                          style: TextStyle(
                            color: Color(0xff652D69),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                Container(
                  width: 270,
                  height: 70,
                  color: const Color.fromRGBO(80, 216, 195, 1),
                  margin: const EdgeInsets.only(
                    left: 74,
                    bottom: 62,
                    right: 74,
                  ),
                  child: CupertinoButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ProjectScreen4(),
                        ),
                      );
                    },
                    child: const Text(
                      'Next',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    disabledColor: Colors.grey,
                    pressedOpacity: 0.6,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
