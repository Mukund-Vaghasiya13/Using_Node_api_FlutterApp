enum TExtFieldType{
  secure,notsecure
}

class DataModle{
  String? id;
  String? Username;
  String? Password;
  List? Task;
  String? date;


  DataModle({this.Password,this.Task,this.Username,this.id,this.date});

  factory DataModle.fromjson(Map<String,dynamic>e){
    return DataModle(
      id: e["_id"],
      Username: e["Username"],
      Password: e["Password"],
      Task: e["Task"],
      date: e["date"]
    );
  }
}