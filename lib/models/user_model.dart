
const String tableUser='user_table';
const String tblUserColId='user_id';
const String tblUserColemail='user_email';
const String tblUserColPass='user_pass';


class UserModel{
  int? id;
  String email;
  String password;

  UserModel({
    this.id,
    required this.email,
    required this.password,
  });

Map<String,dynamic>toMap(){
  final map=<String,dynamic>{
    tblUserColemail:email,
    tblUserColPass:password,
  };
  if(id!=null){
    map[tblUserColId]=id;
  }
  return map;
}

factory UserModel.fromMap(Map<String,dynamic>map)=>
    UserModel(
        id: map[tblUserColId],
        email: map[tblUserColemail],
        password: map[tblUserColPass]
    );

  @override
  String toString() {
    return 'UserModel{id: $id, email: $email, password: $password}';
  }

}