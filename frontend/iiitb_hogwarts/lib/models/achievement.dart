class Achievement {

  String id;
  String label;
  String points;

  Achievement.fromJson(jsonObj):
    id = jsonObj['_id'],
    label = jsonObj['label'],
    points = jsonObj['points'];

}