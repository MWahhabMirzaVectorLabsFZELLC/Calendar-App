import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Calendar",
        style: TextStyle(
          color: Colors.white,
          fontSize: 40,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic
        ),),
        backgroundColor: Colors.blue,
      ),
      body: content(),
    );
  }

  Widget content() {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Align(alignment: Alignment.center,
            child: ElevatedButton(
                onPressed: () {  },
                child: Text(today.toString().split(" ")[0],
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),)),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30)
            ),
            child: TableCalendar(
              startingDayOfWeek: StartingDayOfWeek.monday,
              weekendDays: const [DateTime.sunday],
              daysOfWeekHeight: 50,
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
                weekendStyle: TextStyle(
                  color: Colors.red.shade900,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                )
              ),
              calendarStyle: CalendarStyle(
                defaultTextStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 18
                ),
                weekendTextStyle: TextStyle(
                  color: Colors.red.shade900,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                )
              ),
              calendarFormat: CalendarFormat.month,
              availableGestures: AvailableGestures.all,
              headerStyle: HeaderStyle(
                decoration: BoxDecoration(
                  color: Colors.red.shade900,
                ),
                titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 30
                ),
                titleCentered: true,
                formatButtonVisible: false
              ),
              rowHeight: 50,
              locale: "en_US",
              selectedDayPredicate: (day) => isSameDay(day, today),
              focusedDay: today,
              firstDay: DateTime.utc(2000, 01, 01),
              lastDay: DateTime.utc(2050, 12, 31),
              onDaySelected: _onDaySelected,
            ),
          )
        ],
      ),
    );
  }
}
