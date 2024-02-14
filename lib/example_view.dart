import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExampleView extends StatelessWidget {
  ExampleView({super.key});

  final box = Hive.box('myBox');

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
        '로컬 스토리지 기본 사용 예제',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  _bodyWidget() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Hive',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _sampleButton(
                '데이터 추가',
                () {
                  box.put('name', 'Seonwook Kim');
                  box.put('age', 26);

                  debugPrint('[SUCCESS] Hive 데이터 추가');
                },
              ),
              _sampleButton(
                '데이터 읽기',
                () {
                  if (box.isEmpty) {
                    debugPrint('[SUCCESS] Hive 데이터 읽기 : 데이터 없음');
                  } else {
                    String name = box.get('name');
                    int age = box.get('age');

                    debugPrint('[SUCCESS] Hive 데이터 읽기 : $name($age)');
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _sampleButton(
                '데이터 수정',
                () {
                  box.put('age', 28);

                  debugPrint('[SUCCESS] Hive 데이터 수정');
                },
              ),
              _sampleButton(
                '데이터 삭제',
                () {
                  if (box.isEmpty) {
                    debugPrint('[SUCCESS] Hive 데이터 삭제 : 데이터 없음');
                  } else {
                    box.delete('name');
                    box.delete('age');

                    debugPrint('[SUCCESS] Hive 데이터 삭제');
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: 30),

          /// Shared Preference
          const Text(
            'shared_preference',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _sampleButton(
                '데이터 추가',
                () async {
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  await sp.setString('name', 'Seonwook Kim');
                  await sp.setInt('age', 26);

                  debugPrint('[SUCCESS] shared_preference 데이터 추가');
                },
              ),
              _sampleButton(
                '데이터 읽기',
                () async {
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  String? name = sp.getString('name');
                  int? age = sp.getInt('age');

                  debugPrint(
                      '[SUCCESS] shared_preference 데이터 읽기 : $name($age)');
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _sampleButton(
                '데이터 수정',
                () async {
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  await sp.setInt('age', 28);

                  debugPrint('[SUCCESS] shared_preference 데이터 수정');
                },
              ),
              _sampleButton(
                '데이터 삭제',
                () async {
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  await sp.remove('name');
                  await sp.remove('age');

                  debugPrint('[SUCCESS] shared_preference 데이터 삭제');
                },
              ),
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  _sampleButton(String label, void Function() onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 80,
        width: 170,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            label,
          ),
        ),
      ),
    );
  }
}
