
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';



class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  final Map<DateTime, List<String>> _events = {};

  DateTime _dateKey(DateTime date) =>
      DateTime(date.year, date.month, date.day);

  List<String> _getEvents(DateTime date) =>
      _events[_dateKey(date)] ?? [];

  Future<void> _addEvent() async {
    final controller = TextEditingController();

    final title = await showDialog<String>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Add event'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Enter event title',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              final value = controller.text.trim();
              if (value.isNotEmpty) {
                Navigator.pop(dialogContext, value);
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );

    if (!mounted || title == null) return;

    setState(() {
      _events.putIfAbsent(_dateKey(_selectedDay), () => []);
      _events[_dateKey(_selectedDay)]!.add(title);
    });
  }

  void _deleteEvent(int index) {
    setState(() {
      final key = _dateKey(_selectedDay);
      _events[key]?.removeAt(index);

      if (_events[key]?.isEmpty ?? false) {
        _events.remove(key);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final events = _getEvents(_selectedDay);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Calendar',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            tooltip: 'Today',
            onPressed: () {
              setState(() {
                _focusedDay = DateTime.now();
                _selectedDay = DateTime.now();
              });
            },
            icon: const Icon(Icons.today_outlined),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addEvent,
        child: const Icon(Icons.add),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            elevation: 0,
            color: Colors.white12,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: TableCalendar<String>(
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2040, 12, 31),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) =>
                    isSameDay(_selectedDay, day),
                eventLoader: _getEvents,
                startingDayOfWeek: StartingDayOfWeek.sunday,
                calendarStyle: const CalendarStyle(
                  outsideDaysVisible: false,
                  markersMaxCount: 3,
                  todayDecoration: BoxDecoration(
                    color: Color(0xFFBBD0FF),
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Color(0xFF245DCC),
                    shape: BoxShape.circle,
                  ),
                  markerDecoration: BoxDecoration(
                    color: Color(0xFF245DCC),
                    shape: BoxShape.circle,
                  ),
                ),
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            DateFormat('EEEE, d MMMM').format(_selectedDay),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '${events.length} event${events.length == 1 ? '' : 's'}',
            style: TextStyle(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 16),
          if (events.isEmpty)
            const Card(
              elevation: 0,
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Center(
                  child: Column(
                    children: [
                      Icon(Icons.event_available, size: 36),
                      SizedBox(height: 8),
                      Text('No events for this day'),
                    ],
                  ),
                ),
              ),
            )
          else
            ...events.asMap().entries.map((entry) {
              return Card(
                elevation: 0,
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.event_note),
                  ),
                  title: Text(entry.value),
                  subtitle: const Text('All-day event'),
                  trailing: IconButton(
                    tooltip: 'Delete event',
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () => _deleteEvent(entry.key),
                  ),
                ),
              );
            }),
        ],
      ),
    );
  }
}
