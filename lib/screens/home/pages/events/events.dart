import 'package:flutter/material.dart';
import 'package:hotel_connect/screens/home/pages/events/add_event.dart';
import 'package:hotel_connect/screens/home/pages/events/view_event.dart';
import 'package:table_calendar/table_calendar.dart';



class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}
class _EventsState extends State<Events> {
  CalendarController _controller;
  Map<DateTime, List<dynamic>> _events;
  List<dynamic> _selectedEvents;
  
  @override
  void initState(){
    super.initState();
    _controller = CalendarController();
//     _eventController = TextEditingController();
    _events = {};
    _selectedEvents = [];
//     initPrefs();
  }

//   TextEditingController _eventController;
//   SharedPreferences prefs;

  Widget build(BuildContext context) {
           
          return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: <Widget>[
                    TableCalendar(
                      events: _events,
                      initialCalendarFormat: CalendarFormat.month ,
                      calendarStyle: CalendarStyle(
                        canEventMarkersOverflow: true,
                        todayColor:Colors.redAccent,
                        selectedColor: Colors.grey,
                        todayStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color:Colors.white,
                          ),
                      ),
                      headerStyle:HeaderStyle(
                        centerHeaderTitle:true,
                        formatButtonDecoration:BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(20.0), 
                        ),
                      formatButtonTextStyle: TextStyle(
                        color:Colors.white,
                      ),
                      formatButtonShowsNext: false,
                      ),
                      onDaySelected:(date,events){
                        setState(() {
                          _selectedEvents = events;
                        });
                      }, 
                                                                 
                      calendarController: _controller,
                      ),
                      ..._selectedEvents.map((event) => ListTile(
                        title: Text(event.title),
                        onTap: (){
                          Navigator.push(context,
                            MaterialPageRoute(
                              builder: (_) => EventDetailsPage(
                              event:event,
                            )
                          )
                        );
                        },
                        )),
                   
                  Center(
                    child: FloatingActionButton(
                      child: Icon(Icons.add),
                      onPressed: () => Navigator.push(
                        context, MaterialPageRoute(builder: (context)=> AddEventPage())),
                        ),
                  ),
                  ]
                ),
          );
  }
}