import 'package:firebase_helpers/firebase_helpers.dart';
import 'package:hotel_connect/screens/home/pages/events/event_mark.dart';


DatabaseService<EventModel> 
eventDBS = DatabaseService<EventModel>(
  "events",fromDS: (id,data) => EventModel.fromDS(id, data), toMap:(event) => event.toMap()
  );
