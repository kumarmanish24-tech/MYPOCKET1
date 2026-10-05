import 'package:flutter/material.dart';



// 1. Category Data Model
class CategoryItem {
  final String title;
  final IconData icon;
  final Color color;

  const CategoryItem({
    required this.title,
    required this.icon,
    required this.color,
  });
}

// 2. Main Screen Widget
class CategoryPickerScreen extends StatefulWidget {
  const CategoryPickerScreen({super.key});

  @override
  State<CategoryPickerScreen> createState() => _CategoryPickerScreenState();
}

class _CategoryPickerScreenState extends State<CategoryPickerScreen> {
  // Store the user's selected category
  CategoryItem? _selectedCategory;

  // List of all categories
  final List<CategoryItem> _categories = const [
    CategoryItem(
      title: 'Food & Dining',
      icon: Icons.restaurant,
      color: Colors.orange,
    ),
    CategoryItem(
      title: 'Transport',
      icon: Icons.directions_bus,
      color: Colors.blue,
    ),
    CategoryItem(
      title: 'Shopping',
      icon: Icons.shopping_bag,
      color: Colors.purple,
    ),
    CategoryItem(
      title: 'Housing',
      icon: Icons.home,
      color: Colors.amber,
    ),
    CategoryItem(
      title: 'Education',
      icon: Icons.school,
      color: Colors.indigo,
    ),
    CategoryItem(
      title: 'Health & Medical',
      icon: Icons.medical_services,
      color: Colors.red,
    ),
    CategoryItem(
      title: 'Entertainment',
      icon: Icons.movie,
      color: Colors.pink,
    ),
    CategoryItem(
      title: 'Bills & Utilities',
      icon: Icons.receipt_long,
      color: Colors.teal,
    ),
    CategoryItem(
      title: 'Other',
      icon: Icons.more_horiz,
      color: Colors.grey,
    ),
  ];

  // 3. Open Modal Bottom Sheet
  void _openCategoryBottomSheet(BuildContext context) async {
    final CategoryItem? result = await showModalBottomSheet<CategoryItem>(
      context: context,
      backgroundColor: const Color(0xFF323232),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Top drag indicator bar
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const Text(
                'Select Category',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              // Category options list
              Flexible(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: _categories.length,
                  separatorBuilder: (context, index) => const Divider(
                    color: Colors.white12,
                    height: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
                  itemBuilder: (context, index) {
                    final category = _categories[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: category.color.withOpacity(0.15),
                        child: Icon(category.icon, color: category.color),
                      ),
                      title: Text(
                        category.title,
                        style: const TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        // Pass selected item back and close bottom sheet
                        Navigator.pop(context, category);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );

    // 4. Update state when item selected
    if (result != null) {
      setState(() {
        _selectedCategory = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      appBar: AppBar(
        title: const Text('Category Selector'),
        backgroundColor: const Color(0xFF323232),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Selected Category Display
            if (_selectedCategory != null)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF323232),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      backgroundColor:
                      _selectedCategory!.color.withOpacity(0.2),
                      radius: 18,
                      child: Icon(
                        _selectedCategory!.icon,
                        color: _selectedCategory!.color,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      _selectedCategory!.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              )
            else
              const Text(
                'No category selected',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            const SizedBox(height: 24),

            // Trigger Button
            ElevatedButton.icon(
              onPressed: () => _openCategoryBottomSheet(context),
              icon: const Icon(Icons.category),
              label: const Text('Select Category'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF323232),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class TimePickerExample extends StatefulWidget {
  const TimePickerExample({super.key});

  @override
  State<TimePickerExample> createState() => _TimePickerExampleState();
}

class _TimePickerExampleState extends State<TimePickerExample> {
  // Store the selected time
  TimeOfDay? _selectedTime;

  // Function to trigger the time picker dialog
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
      // Force 24-hour mode or 12-hour mode if needed:
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Time Picker Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _selectedTime == null
                  ? 'No time selected'
                  : 'Selected Time: ${_selectedTime!.format(context)}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectTime(context),
              child: const Text('Choose Time'),
            ),
          ],
        ),
      ),
    );
  }
}




