import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_file/features/presentation/model/model_data.dart';
import 'package:flutter/services.dart';

class JsonScreen extends StatefulWidget {
  const JsonScreen({Key? key}) : super(key: key);

  @override
  _JsonScreenState createState() => _JsonScreenState();
}

class _JsonScreenState extends State<JsonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Show Json Data'),
         ),
        body: FutureBuilder<List<Welcome>>(
            future: fetchData(context),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              } else if (snapshot.hasData) {
                List itemList = snapshot.data as List<Welcome>;
                return ListView.builder(

                    itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 4,
                      child: ListTile(
                        title: Text('${itemList[index].name}'),
                        subtitle: Text('${itemList[index].code}'),

                        onTap: (){
                          final currentStatus=itemList[index];

                         Navigator.of(context).pop<Welcome>(currentStatus);
                        },

                      ),
                    ),
                  );
                });
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }));
  }

  Future<List<Welcome>> fetchData(BuildContext context) async {
    final jsonString = await DefaultAssetBundle.of(context)
        .loadString('jsons/json_data_model');
    return welcomeFromJson(jsonString);
  }
}

/// first code without using software
// Future<List<ModelData>>readJson()async{
// final jsonData=await rootBundle.rootBundle.loadString('jsons/json_data_model');
// final jsonList= json.decode(jsonData) as List<dynamic>;
// return jsonList.map((e) => ModelData.fromJson(e)).toList();
