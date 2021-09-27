import 'package:get/get.dart';
import 'package:meetup/models/event.dart';

class EventListController extends GetxController {
  var eventList = <Event>[].obs;
  var location = [
    'Dubai United Arab Emirates',
    'Instanbul',
    'Australia',
  ];
  var selectedLoacation = ''.obs;

  String get locationVal => selectedLoacation.value;

  @override
  void onInit() {
    super.onInit();
    fetchEvents();
    selectLocation(location[0]);
  }

  void fetchEvents() async {
    await Future.delayed(Duration(seconds: 2));
    var events = [
      Event(
          img:
              'https://www.timeoutdubai.com/public/styles/landscape_md/public/images/2021/01/01/Burj-Al-Arab-Jumeirah-(23).jpg?itok=0zethD6I',
          name: 'Burj Al Arab\'s Jumeirah New Year Eve',
          location: 'Dubai United Arab Emirates',
          time: 'Nov 31,2021 at 11:00pm'),
      Event(
          img:
              'https://www.ledgerinsights.com/wp-content/uploads/2021/04/live-events-concert.jpg',
          name: 'Kendji Girac',
          location: 'Dubai United Arab Emirates',
          time: 'Oct 1,2021 at 12:00am'),
      Event(
          img:
              'https://images.pexels.com/photos/976866/pexels-photo-976866.jpeg?auto=compress&cs=tinysrgb&dpr=1',
          name: 'Musical Beats',
          location: 'Dubai United Arab Emirates',
          time: 'Dec 31,2021 at 10:00pm'),
    ];
    eventList.addAll(events);
  }

  void onInterested(var item) {
    eventList[eventList.indexOf(item)].isGoing.toggle();
  }

  void selectLocation(String location) {
    selectedLoacation.value = location;
    eventList.forEach((element) {
      element.location = selectedLoacation.value;
    });
  }
}
