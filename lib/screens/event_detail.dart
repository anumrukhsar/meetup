import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetup/controllers/eventlist_controller.dart';
import 'package:meetup/widgets/eventitem.dart';

class EventDetail extends StatelessWidget{
  var index;
  EventListController eventListController = Get.find();
  EventDetail({this.index});
  @override
  Widget build(BuildContext context) {
    var eventItem = eventListController.eventList.elementAt(index);
    return Scaffold(
        appBar: AppBar(title: Text(eventItem.name),),
        body: EventItem(item: eventItem));
  }
}