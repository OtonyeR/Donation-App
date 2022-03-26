import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:purple/screens/new%20project/project5.dart';

class ProjectScreen4 extends StatefulWidget {
  const ProjectScreen4({Key? key}) : super(key: key);

  @override
  _ProjectScreen4State createState() => _ProjectScreen4State();
}

class _ProjectScreen4State extends State<ProjectScreen4> {
  bool valuefirst = false;
  bool valuesecond = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(minHeight: viewportConstraints.maxHeight),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  CheckboxListTile(
                    secondary: const Icon(
                      Icons.money_rounded,
                      size: 30.0,
                      color: Colors.white,
                    ),
                    title: const Text('Monetary Donations'),
                    value: valuefirst,
                    onChanged: (newValue) {
                      setState(() {
                        valuefirst = newValue!;
                      });
                    },
                  ),
                  CheckboxListTile(
                    secondary: const Icon(
                      CupertinoIcons.gift_fill,
                      size: 30.0,
                      color: Colors.white,
                    ),
                    title: const Text('In-Kind Donations'),
                    value: valuefirst,
                    onChanged: (newValue) {
                      setState(() {
                        valuefirst = newValue!;
                      });
                    },
                  ),
                  valuefirst == true
                      ? SizedBox(
                          width: 100,
                          height: 40,
                          child: CupertinoTextField(
                            keyboardType: TextInputType.text,
                            minLines: 5,
                            maxLines: 6,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(101, 45, 105, 11.0),
                              borderRadius: BorderRadius.circular(32),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 1.0),
                                  blurRadius: 4.0,
                                  spreadRadius: 0.0,
                                ),
                              ],
                            ),
                          ),
                        )
                      : SizedBox(
                          width: 100,
                          height: 40,
                          child: CupertinoTextField(
                            keyboardType: TextInputType.number,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(101, 45, 105, 11.0),
                              borderRadius: BorderRadius.circular(32),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 1.0),
                                  blurRadius: 4.0,
                                  spreadRadius: 0.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                  const SizedBox(
                    width: 60,
                    child: Text.rich(
                      TextSpan(
                        text: 'Tip:',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Color(0xff652D69)), // default text style
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                ' In-Kind donation is a form of donation in which instead of giving money to buy needed goods and services, the goods and services themselves are given',
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
                            builder: (context) => const ProjectScreen5(),
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
            ),
          );
        },
      ),
    );
  }
}
