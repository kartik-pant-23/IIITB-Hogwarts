class Users {

  //Data members
  String _name;
  String _email;
  String _password;

  //Constructor
  Users(this._email, this._password, [this._name]);

  //User to map
  Map toMap() {
    Map<String, dynamic> user = new Map();
    user['name'] = (name!=null) ?name :null;
    user['email'] = email;
    user['password'] = password;
    return user;
  }

  //Getter methods
  get password => _password;
  get email => _email;
  get name => _name;
}