class ModelData {
   String? name;

   String? code;

  ModelData(this.name, this.code);

  ModelData.fromJson(Map<String , dynamic>json){

    name = json['name'];
    code = json['code'];
  }
}