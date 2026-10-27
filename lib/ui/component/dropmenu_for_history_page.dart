import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class ModernDropdownExample extends StatefulWidget {
  const ModernDropdownExample({super.key});

  @override
  State<ModernDropdownExample> createState() => _ModernDropdownExampleState();
}

class _ModernDropdownExampleState extends State<ModernDropdownExample> {
  // Store the currently selected value
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: _selectedValue,
      hintText: 'Select an option',
      requestFocusOnTap: true,


      onSelected: (String? value) {
        setState(() {
          _selectedValue = value;
        });
      },
      dropdownMenuEntries: const [
        DropdownMenuEntry(value: 'apple', label: 'Apple'),
        DropdownMenuEntry(value: 'banana', label: 'Banana'),
        DropdownMenuEntry(value: 'orange', label: 'Orange'),
      ],
    );
  }
}







class dropmenu extends StatefulWidget {
  const dropmenu({super.key});

  @override
  State<dropmenu> createState() => _dropmenuState();
}

class _dropmenuState extends State<dropmenu> {


  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  final valueListenable = ValueNotifier<String?>(null);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            hint: const Row(
              children: [
                Icon(
                  Icons.list,
                  size: 16,
                  color: Colors.yellow,
                ),
                SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: Text(
                    'Select Item',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            items: items
                .map(
                  (String item) => DropdownItem<String>(
                value: item,
                height: 40,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
                .toList(),
            valueListenable: valueListenable,
            onChanged: (value) {
              valueListenable.value = value;
            },
            buttonStyleData: ButtonStyleData(
              height: 38,
              width: 160,
              padding: const EdgeInsets.only(left: 14, right: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Color(0xFF4E4D4D),
                  width: 2
                ),
                // color: Color(0xFF4E4D4D),
              ),
              elevation: 2,
            ),
            iconStyleData: const IconStyleData(
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
              ),
              iconSize: 20,
              iconEnabledColor: Colors.white70,
              iconDisabledColor: Colors.grey,
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 200,
              width: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Color.fromARGB(37, 255, 255, 255),
              ),
              offset: const Offset(0, -8),
              scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(40),
                thickness: WidgetStateProperty.all<double>(6),
                thumbVisibility: WidgetStateProperty.all<bool>(true),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              padding: EdgeInsets.only(left: 14, right: 14),
            ),
          ),
        ),
      ),
    );
  }
}



class MultiSelectListPage extends StatefulWidget {
  const MultiSelectListPage({super.key});

  @override
  State<MultiSelectListPage> createState() => _MultiSelectListPageState();
}

class _MultiSelectListPageState extends State<MultiSelectListPage> {
  // Sample data list
  final List<String> items = ['Apple', 'Banana', 'Cherry', 'Date', 'Elderberry'];


  final Set<String> selectedItems = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multi-Select ListTile (${selectedItems.length} selected)'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          final isSelected = selectedItems.contains(item);

          // Option 1: Using built-in CheckboxListTile (Easiest)
          return CheckboxListTile(
            title: Text(item),
            value: isSelected,
            onChanged: (bool? value) {
              setState(() {
                if (value == true) {
                  selectedItems.add(item);
                } else {
                  selectedItems.remove(item);
                }
              });
            },
          );

          // Option 2: Using standard ListTile with a trailing icon (Custom UI)
          /*
          return ListTile(
            title: Text(item),
            selected: isSelected,
            selectedTileColor: Colors.blue.withOpacity(0.1),
            trailing: Icon(
              isSelected ? Icons.check_box : Icons.check_box_outline_blank,
              color: isSelected ? Colors.blue : Colors.grey,
            ),
            onTap: () {
              setState(() {
                if (isSelected) {
                  selectedItems.remove(item);
                } else {
                  selectedItems.add(item);
                }
              });
            },
          );
          */
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Do something with selectedItems
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Selected: ${selectedItems.join(', ')}')),
          );
        },
        label: const Text('Done'),
        icon: const Icon(Icons.check),
      ),
    );
  }
}






