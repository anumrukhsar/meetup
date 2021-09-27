import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetup/controllers/eventlist_controller.dart';
import 'package:meetup/models/event.dart';
import 'package:meetup/widgets/eventitem.dart';
import 'package:meetup/widgets/logo.dart';

class EventList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final eventListController = Get.put(EventListController());
    return Scaffold(
      appBar: AppBar(
        title: Logo(),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10.0),
        child: Obx(() => Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      border: Border.all(color: Colors.black),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: eventListController.selectedLoacation.value,
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 24,
                        elevation: 16,
                        isExpanded: true,
                        style: const TextStyle(
                            color: Colors.black
                        ),
                        underline: null,
                        onChanged: (newValue) {
                        eventListController.selectLocation(newValue!);
                        },
                        items: eventListController.location
                            .map((value) =>
                           DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          ),
                        )
                            .toList(),

                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: (eventListController.eventList.value.length == 0)
                      ? Center(child: CircularProgressIndicator())
                      : buildListEvent(eventListController.eventList.value),
                )
              ],
            )),
      ),
    );
  }

  Widget buildListEvent(List<Event> events) {
    return ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          return EventItem(item: events[index]);
        });
  }
}
