import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'person_model.dart';

class ExampleView extends StatefulWidget {
  const ExampleView({super.key});

  @override
  State<ExampleView> createState() => _ExampleViewState();
}

class _ExampleViewState extends State<ExampleView> {
  final nameController = TextEditingController();
  late SharedPreferences sp;
  int studentCount = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    sp = await SharedPreferences.getInstance();
    int lastId = sp.getInt('last_id') ?? 0;
    setState(() {
      studentCount = lastId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: _appBarWidget(),
        body: _bodyWidget(),
      ),
    );
  }

  _appBarWidget() {
    return AppBar(
      backgroundColor: Colors.black,
      title: const Text(
        'Attendance Book',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  _bodyWidget() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            /// 학생 추가
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 280,
                  child: TextFormField(
                    controller: nameController,
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      hintText: '학생 이름',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    /* shared_preferences 이용 구간 */
                    int id = sp.getInt('last_id') ?? 0;
                    PersonModel personModel = PersonModel(
                      id: id,
                      name: nameController.text,
                      age: 20,
                      attend: false,
                    );
                    sp.setString(id.toString(), personModel.toJson());
                    id += 1;
                    sp.setInt('last_id', id);
                    nameController.clear();
                    debugPrint('[SUCCESS] 학생 추가 : ${id - 1}번 학생');
                    setState(() {
                      studentCount = id;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      return Colors.black;
                    }),
                  ),
                  child: const Text(
                    '학생 추가',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            /// 학생 명단
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: studentCount,
              itemBuilder: (_, index) {
                /* shared_preferences 이용 구간 */
                String? studentJson = sp.getString(index.toString());
                if (studentJson == null) {
                  return const Center(child: Text('학생이 없습니다'));
                } else {
                  PersonModel student = PersonModel.fromJson(studentJson);
                  return _studentBlock(
                    student,
                    () {
                      setState(() {
                        if (!student.attend) {
                          final newModel = PersonModel(
                            id: student.id,
                            name: student.name,
                            age: student.age,
                            attend: true,
                          );
                          sp.setString(
                              student.id.toString(), newModel.toJson());
                        }
                      });
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  /// 학생 명단 위젯
  Widget _studentBlock(PersonModel student, void Function() onPressed) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${student.name}(${student.age})',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: onPressed,
                icon: student.attend
                    ? const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      )
                    : const Icon(
                        Icons.circle_outlined,
                        color: Colors.black,
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
