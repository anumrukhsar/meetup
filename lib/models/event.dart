import 'package:get/get.dart';
class Event{
  var img;
  var name;
  var location;
  var time;
  var isGoing = false.obs;


  Event({
    this.img,
    this.name,
    this.location,
    this.time,
});
}