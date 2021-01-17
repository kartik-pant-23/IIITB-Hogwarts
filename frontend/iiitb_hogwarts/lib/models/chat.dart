class Chat {

  String userId, name, message;

  Chat({this.userId, this.name, this.message});

  Chat.fromJson(jsonObject) {
    this.userId = jsonObject['user_id'];
    this.name = jsonObject['name'];
    this.message = jsonObject['message'];
  }

  Map<String, String> toJson() {
    return {
      'user_id': this.userId,
      'name': this.name,
      'message': this.message
    };
  }

  int getType(String currentUser) {
    return (this.userId==currentUser) ?1 :0;
  }

}