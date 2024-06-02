import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  static String COUNT_VALUE_KEY = "countValue";
  int count = 0;


  void definePref() async{
    var prefs =  await SharedPreferences.getInstance();
    count = prefs.getInt(COUNT_VALUE_KEY)!;
  }


  @override
  void initState() {
    super.initState();
    definePref();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: count % 15 == 0 && count != 0? Colors.blue : count % 3 == 0 && count != 0 ? Colors.red : count % 5 == 0 && count != 0? Colors.green: Colors.white,
      appBar: AppBar(
        title: Text('Count Save'),
        centerTitle: true,
      ),
      body: Center(child: Text('$count', style: TextStyle(fontSize: 32),)),
      floatingActionButton: FloatingActionButton(onPressed: () async{
        count++;
        var prefs =  await SharedPreferences.getInstance();
        prefs.setInt(COUNT_VALUE_KEY, count);
        setState(() {

        });
      }, child: Icon(Icons.add),),
    );
  }
}
