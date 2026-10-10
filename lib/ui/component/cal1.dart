import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';



class TableCalendarDemoScreen extends StatefulWidget {
  const TableCalendarDemoScreen({super.key});

  @override
  State<TableCalendarDemoScreen> createState() => _TableCalendarDemoScreenState();
}

class _TableCalendarDemoScreenState extends State<TableCalendarDemoScreen> {
  // Calendar state variables
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // Dummy event repository indexed by date
  final Map<DateTime, List<String>> _events = {
    DateTime.utc(2026, 10, 15): ['Client Presentation', 'Team Lunch'],
    DateTime.utc(2026, 10, 20): ['Product Release Checkup'],
  };

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  // Fetch events mapped to a specific day
  List<String> _getEventsForDay(DateTime day) {
    return _events[DateTime.utc(day.year, day.month, day.day)] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TableCalendar Demo'),

      ),
      body: Column(
        children: [
          // The TableCalendar widget
          TableCalendar<String>(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,

            // Selection logic
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay; // update focused day to prevent jump bugs
              });
            },

            // Format switching logic
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },

            // Sync page movement
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },

            // Hook up events list to calendar UI markers
            eventLoader: _getEventsForDay,

            // Styling customization
            calendarStyle: const CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.indigoAccent,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.indigo,
                shape: BoxShape.circle,
              ),
              markerDecoration: BoxDecoration(
                color: Colors.deepOrange,
                shape: BoxShape.circle,
              ),
            ),
            headerStyle: const HeaderStyle(
              formatButtonVisible: true,
              titleCentered: true,
            ),
          ),
          const Divider(thickness: 2, height: 20),

          // Display list of events for the selected day
          Expanded(
            child: ListView(
              children: _getEventsForDay(_selectedDay ?? _focusedDay)
                  .map((event) => Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: ListTile(
                  leading: const Icon(Icons.event_note, color: Colors.indigo),
                  title: Text(event),
                ),
              ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}