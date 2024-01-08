import 'package:flutter/material.dart';
import 'package:lab6_129/hobby.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<Hobby> hobbies = [];
  List<String> hbselected=[];
  @override
  void initState() {
    super.initState();
    hobbies = Hobby.getHobby();
  }

  List<Widget> createCheckbox() {
    List<Widget> myhobby = [];
    for (var hobby in hobbies) {
      myhobby.add(CheckboxListTile(
        title: Text(hobby.name),
        value: hobby.checked,
        onChanged: (bool? value) {
          setState(() {
            hobby.checked = value!;
            if (hobby.checked) {
              hbselected.add(hobby.name);
            }
            else{
              hbselected.remove(hobby.name);
            }
          });
          print(hbselected.join());
        },
      ));
    }
    return myhobby;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lab6 CheckboxListTile"),
      ),
      body: Column(
        children: [
        const Text("งานอดิเรก"),
        Column(children: createCheckbox()),
        Text(hbselected.join(','))
                // ใส่ checkbox
        ],
      ),
    );
  }
}
