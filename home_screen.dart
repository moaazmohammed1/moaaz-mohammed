import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'components.dart';
import 'my_note_screen.dart';
import 'sql_helper.dart';

Color mainColor = Colors.blue;

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool color1 = true;
  bool color2 = false;
  bool color3 = false;
  bool color4 = false;
  bool color5 = false;
  bool color6 = false;
  bool color7 = false;
  bool show = false;

  SQLHelper object = SQLHelper();
  @override
  void initState() {
    super.initState();
    // _refreshItem();
    object.createDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          title: Text(
            'New Note',
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.more_vert, size: 30),
              onPressed: () {
                setState(() {
                  show = !show;
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.check, size: 25),
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  object.insertNewNote(
                    title: titleController.text,
                    description: descriptionController.text,
                  );
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return NewNoteScreen();
                  }));
                }
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                DefaultTextField(
                  controller: titleController,
                  keyboard: TextInputType.text,
                  validate: (value) {
                    if (value.isEmpty) {
                      return 'title must not be empty';
                    }
                    return null;
                  },
                  label: 'Type Something',
                  colorText: const Color(0xFF50337E),
                  colorBorder: const Color(0xFF50337E),
                ),
                const SizedBox(height: 15),
                DefaultTextField(
                  controller: descriptionController,
                  keyboard: TextInputType.text,
                  validate: (value) {
                    if (value.isEmpty) {
                      return 'description must not be empty';
                    }
                    return null;
                  },
                  label: 'Type Something',
                  colorText: const Color(0xFF009921),
                  colorBorder: const Color(0xFF009921),
                )
              ],
            ),
          ),
        ),
        bottomSheet: show
            ? BottomSheet(
                onClosing: () {},
                builder: (context) {
                  return Container(
                    padding: const EdgeInsets.all(40),
                    width: double.infinity,
                    color: Colors.blue,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: const [
                            CircleAvatar(
                              backgroundColor: Color(0xDDE7E7E7),
                              child: Icon(
                                Icons.share,
                                size: 23,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Share with your friends',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: const [
                            CircleAvatar(
                              backgroundColor: Color(0xDDE7E7E7),
                              child: Icon(
                                Icons.delete,
                                size: 23,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Delete',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: const [
                            CircleAvatar(
                              backgroundColor: Color(0xDDE7E7E7),
                              child: Icon(
                                Icons.copy,
                                size: 23,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Duplicate',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // cubit.changeCheckColorState(
                                  //     color11: true,
                                  //     color22: false,
                                  //     color33: false,
                                  //     color44: false,
                                  //     color55: false,
                                  //     color66: false,
                                  //     color77: false);
                                },
                                child: CircleAvatar(
                                  radius: 21,
                                  backgroundColor: const Color(0xFFFFFFFF),
                                  // child: cubit.color1
                                  //     ? const Icon(Icons.check,
                                  //         color: Colors.black)
                                  //     : null,
                                ),
                              ),
                              SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {
                                  // cubit.changeCheckColorState(
                                  //   color11: false,
                                  //   color22: true,
                                  //   color33: false,
                                  //   color44: false,
                                  //   color55: false,
                                  //   color66: false,
                                  //   color77: false,
                                  // );
                                },
                                child: CircleAvatar(
                                  radius: 21,
                                  backgroundColor: const Color(0xFFF28B81),
                                  // child: cubit.color2
                                  //     ? const Icon(Icons.check,
                                  //         color: Colors.black)
                                  //     : null,
                                ),
                              ),
                              SizedBox(width: 11),
                              GestureDetector(
                                onTap: () {
                                  // cubit.changeCheckColorState(
                                  //   color11: false,
                                  //   color22: false,
                                  //   color33: true,
                                  //   color44: false,
                                  //   color55: false,
                                  //   color66: false,
                                  //   color77: false,
                                  // );
                                },
                                child: CircleAvatar(
                                  radius: 21,
                                  backgroundColor: const Color(0xFFFBF476),
                                  // child: cubit.color3
                                  //     ? const Icon(Icons.check,
                                  //         color: Colors.black)
                                  //     : null,
                                ),
                              ),
                              SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {
                                  // cubit.changeCheckColorState(
                                  //   color11: false,
                                  //   color22: false,
                                  //   color33: false,
                                  //   color44: true,
                                  //   color55: false,
                                  //   color66: false,
                                  //   color77: false,
                                  // );
                                },
                                child: CircleAvatar(
                                  radius: 21,
                                  backgroundColor: const Color(0xFFCDFF90),
                                  // child: cubit.color4
                                  //     ? const Icon(Icons.check,
                                  //         color: Colors.black)
                                  //     : null,
                                ),
                              ),
                              SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {
                                  // cubit.changeCheckColorState(
                                  //   color11: false,
                                  //   color22: false,
                                  //   color33: false,
                                  //   color44: false,
                                  //   color55: true,
                                  //   color66: false,
                                  //   color77: false,
                                  // );
                                },
                                child: CircleAvatar(
                                  radius: 21,
                                  backgroundColor: const Color(0xFFA7FEEB),
                                  // child: cubit.color5
                                  //     ? const Icon(Icons.check,
                                  //         color: Colors.black)
                                  //     : null,
                                ),
                              ),
                              SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {
                                  // cubit.changeCheckColorState(
                                  //   color11: false,
                                  //   color22: false,
                                  //   color33: false,
                                  //   color44: false,
                                  //   color55: false,
                                  //   color66: true,
                                  //   color77: false,
                                  // );
                                },
                                child: CircleAvatar(
                                  radius: 21,
                                  backgroundColor: Color(0xFFCBF0F8),
                                  // child: cubit.color6
                                  //     ? const Icon(Icons.check,
                                  //         color: Colors.black)
                                  //     : null,
                                ),
                              ),
                              SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {
                                  // cubit.changeCheckColorState(
                                  //   color11: false,
                                  //   color22: false,
                                  //   color33: false,
                                  //   color44: false,
                                  //   color55: false,
                                  //   color66: false,
                                  //   color77: true,
                                  // );
                                },
                                child: CircleAvatar(
                                  radius: 21,
                                  backgroundColor: const Color(0xFFAFCBFA),
                                  // child: cubit.color7
                                  //     ? const Icon(Icons.check,
                                  //         color: Colors.black)
                                  //     : null,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
            : null);
  }
}
