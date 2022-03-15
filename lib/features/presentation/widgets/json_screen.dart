import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_file/features/presentation/model/model_data.dart';
import 'package:flutter/services.dart' as rootBundle;

class JsonScreen extends StatefulWidget {
  const JsonScreen({Key? key}) : super(key: key);

  @override
  _JsonScreenState createState() => _JsonScreenState();
}

class _JsonScreenState extends State<JsonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Show Json Data'),),
      body: FutureBuilder(
        future: readJson(),
        builder:(context,data){
          if(data.hasError){
            return Center(child: Text('${data.error}'),);
          }
          else if(data.hasData){
            var ItemList= data.data as List<ModelData>;
            return ListView.builder(itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 4,
                  child: ListTile(
                    title: Text('${ItemList[index].name}'),
                    subtitle: Text('${ItemList[index].code}'),
                  ),
                ),
              );
            });
          }
          else {
            return const Center(child:  CircularProgressIndicator());
          }
        } ,

      )
      );
  }

   Future<List<ModelData>>readJson()async{
   final jsonData=await rootBundle.rootBundle.loadString('jsons/json_data_model');
   final jsonList= json.decode(jsonData) as List<dynamic>;
   return jsonList.map((e) => ModelData.fromJson(e)).toList();
  }
}
