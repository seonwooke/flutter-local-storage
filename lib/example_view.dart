import 'package:flutter/material.dart';

import 'person_model.dart';

class ExampleView extends StatelessWidget {
  ExampleView({super.key});
  final nameController = TextEditingController();

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

  // _bodyWidget() {
  //   return SingleChildScrollView(
  //     child: Padding(
  //       padding: const EdgeInsets.all(20),
  //       child: Column(
  //         children: [
  //           /// 학생 추가
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               SizedBox(
  //                 width: 280,
  //                 child: TextFormField(
  //                   controller: nameController,
  //                   cursorColor: Colors.black,
  //                   decoration: const InputDecoration(
  //                     hintText: '학생 이름',
  //                     enabledBorder: UnderlineInputBorder(
  //                       borderSide: BorderSide(color: Colors.black),
  //                     ),
  //                     focusedBorder: UnderlineInputBorder(
  //                       borderSide: BorderSide(color: Colors.black),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               ElevatedButton(
  //                 onPressed: () {
  //                   /* Hive 이용 구간 */
  //                   // int id = 0;
  //                   // if (box.isNotEmpty) {
  //                   //   final prevStudent = box.getAt(box.length - 1);
  //                   //   if (prevStudent != null) {
  //                   //     id = prevStudent.id + 1;
  //                   //   }
  //                   // }
  //                   // box.put(id, PersonModel(id: id, name: nameController.text));
  //                   nameController.clear();
  //                   debugPrint('[SUCCESS] 학생 추가');
  //                 },
  //                 style: ButtonStyle(
  //                   backgroundColor:
  //                       MaterialStateProperty.resolveWith((states) {
  //                     return Colors.black;
  //                   }),
  //                 ),
  //                 child: const Text(
  //                   '학생 추가',
  //                   style: TextStyle(
  //                     color: Colors.white,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),

  //           /// 학생 명단
  //           ListView.builder(
  //             shrinkWrap: true,
  //             physics: const NeverScrollableScrollPhysics(),
  //             itemCount: 10,
  //             itemBuilder: (_, index) {
  //               /* Hive 이용 구간 */
  //               // final student = box.getAt(index);
  //               // if (student == null) {
  //               //   return const Center(child: Text('학생이 없습니다'));
  //               // } else {
  //               //   return _studentBlock(
  //               //     student,
  //               //     () {
  //               //       if (!student.attend) {
  //               //         final newModel = PersonModel(
  //               //           id: student.id,
  //               //           name: student.name,
  //               //           attend: true,
  //               //         );
  //               //         box.put(student.id, newModel);
  //               //       }
  //               //     },
  //               //   );
  //               // }
  //             },
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // /// 학생 명단 위젯
  // Widget _studentBlock(PersonModel student, void Function() onPressed) {
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 20),
  //     child: Container(
  //       height: 80,
  //       decoration: BoxDecoration(
  //         color: Colors.grey[200],
  //         borderRadius: BorderRadius.circular(16),
  //       ),
  //       child: Padding(
  //         padding: const EdgeInsets.only(left: 20, right: 5),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Text(
  //               '${student.name}(${student.age})',
  //               style: const TextStyle(
  //                 fontSize: 20,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //             IconButton(
  //               onPressed: onPressed,
  //               icon: student.attend
  //                   ? const Icon(
  //                       Icons.check_circle,
  //                       color: Colors.green,
  //                     )
  //                   : const Icon(
  //                       Icons.circle_outlined,
  //                       color: Colors.black,
  //                     ),
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
