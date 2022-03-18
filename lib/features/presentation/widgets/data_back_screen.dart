import 'package:flutter/material.dart';
import 'package:json_file/features/presentation/model/model_data.dart';
import 'package:json_file/features/presentation/widgets/json_screen.dart';

class ShowDataBack extends StatefulWidget {
  const ShowDataBack({Key? key}) : super(key: key);

  @override
  _ShowDataBackState createState() => _ShowDataBackState();
}

class _ShowDataBackState extends State<ShowDataBack> {
  Welcome? data = Welcome();
  String previousData = ' No Data Yet!';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'Last Selected Data',
                      style: TextStyle(color: Colors.black),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Text(previousData),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'Current Selected Data',
                      style: TextStyle(color: Colors.black),
                    ),
                    const SizedBox(width: 10.0),
                    Text(data != null?'No Data yet!' : data!.name.toString()),
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    previousData = data!.name.toString();

                    data = await Navigator.push<Welcome>(
                      context,
                      MaterialPageRoute(builder: (ctx) => const JsonScreen()),
                    );

                    setState(() {});

                    // print(data!.name);
                  },
                  child: const Text('Select Data')),
            ],
          ),
        ),
      ),
    );
  }
}
