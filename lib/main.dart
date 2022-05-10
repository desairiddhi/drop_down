import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int? countryId;
  int? cityId;
  bool isshow = true;

  List<Map<String, dynamic>> countries = [
    {
      "id": 1,
      "name": "India",
    },
    {
      "id": 2,
      "name": "America",
    },
    {"id": 3, "name": "Canada"}
  ];

  List<Map<String, dynamic>> cities = [
    {
      "id": 1,
      "countryId": 1,
      "name": "Gujrat",
    },
    {
      "id": 2,
      "countryId": 1,
      "name": "Delhi",
    },
    {
      "id": 3,
      "countryId": 2,
      "name": "Dublin",
    },
    {
      "id": 4,
      "countryId": 2,
      "name": "Chicago",
    },
    {"id": 5, "countryId": 3, "name": "Manitoba"},
    {"id": 6, "countryId": 3, "name": "Ontario"},
    {"id": 7, "countryId": 1, "name": "Kashmir"},
    {
      "id": 8,
      "countryId": 1,
      "name": "Maharashtra",
    }
  ];
  // List<Map<String, dynamic>> acities = [
  //
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Switch(
                    value: isshow, 
                    onChanged: (v) => setState(() => isshow = v))
              ],
            ),
            !isshow
                ? const SizedBox()
                : DropdownButton<int>(
                    onChanged: (int? ctry) {
                      setState(() {
                        countryId = ctry;
                      });
                    },
                    value: countryId,
                    hint: const Text("Select Country"),
                    items: countries
                        .map((e) => DropdownMenuItem<int>(
                              enabled: true,
                              child: Text(e['name']),
                              value: e["id"],
                              onTap: () {},
                            ))
                        .toList()),
                        !isshow
                        ?const SizedBox()
           : DropdownButton<int>(
                onChanged: (int? city) {
                  setState(() {
                    cityId = city;
                  });
                },
                value: cityId,
                hint: const Text("Select City"),
                items: cities
                    .where((element) => element['countryId'] == countryId)
                    .map((e) => DropdownMenuItem<int>(
                          enabled: true,
                          child: Text(e['name']),
                          value: e["id"],
                          onTap: () {},
                        ))
                    .toList()),
          ],
        ),
      ),
    );
  }
}
