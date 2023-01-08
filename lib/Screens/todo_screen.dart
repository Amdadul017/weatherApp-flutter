import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:math' as math;

class ForecastScreen extends StatefulWidget {
  const ForecastScreen({super.key});

  @override
  State<ForecastScreen> createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  List? todoData;
  @override
  void initState() {
    super.initState();
    fetchTodoList();
  }

  void fetchTodoList() async {
    Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/todos');
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var weatherData = json.decode(response.body);
      setState(() {
        todoData = json.decode(response.body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo list"),
      ),
      body: Center(
          child: todoData != null
              ? ListView.separated(
                  itemCount: todoData!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 50,
                      //color: Colors.lightGreen,
                      color:
                          Color((math.Random().nextDouble() * 0xffffff).toInt())
                              .withOpacity(1.0),
                      child: Center(child: Text(todoData![index]["title"])),
                    );
                  },
                  separatorBuilder: (BuildContext context, index) =>
                      const Divider(),
                )
              : const Text("Waiting for data")),
    );
  }
}
