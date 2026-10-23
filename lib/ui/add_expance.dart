import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mypocket/state_provider/provider_for_addexpense.dart';
import 'package:mypocket/ui/add_expance.dart';
import 'package:mypocket/ui/component/glowingbutton.dart';
import 'package:mypocket/ui/ex.dart';
import 'package:provider/provider.dart';
import 'package:reel_text/reel_text.dart';

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



class addexpence extends StatefulWidget {
  const addexpence({super.key});

  @override
  State<addexpence> createState() => _addexpenceState();
}

class _addexpenceState extends State<addexpence> {





  TimeOfDay? _selectedTime;

  // Function to trigger the time picker dialog
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
      // Force 24-hour mode or 12-hour mode if needed:
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            // 1. Changes the overall dialog background color
            dialogBackgroundColor: Colors.teal[50],

            colorScheme: ColorScheme.light(
              // 2. Changes header text and selected day circle color
              primary: Colors.teal,
              // 3. Changes surface card and overall calendar background panel
              surface: Color(0xFF333333),

              // 4. Changes general text colors inside the picker
              onSurface: Colors.white,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.teal, // Color for action buttons ('OK' / 'CANCEL')
              ),
            ),
          ),
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



  DateTime? _selectedDate;

  // Function to trigger the date picker dialog
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(), // Default focus date
      firstDate: DateTime(2020),                   // Minimum allowable date
      lastDate: DateTime(2030),

      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            // 1. Changes the overall dialog background color
            dialogBackgroundColor: Colors.teal[50],

            colorScheme: ColorScheme.light(
              // 2. Changes header text and selected day circle color
              primary: Colors.teal,
              // 3. Changes surface card and overall calendar background panel
              surface: Color(0xFF333333),

              // 4. Changes general text colors inside the picker
              onSurface: Colors.white,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.teal, // Color for action buttons ('OK' / 'CANCEL')
              ),
            ),
          ),
          child: child!,
        );
      },



      // Maximum allowable date
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }



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
  final List<CategoryItem> _subCategories = const [
    // Food & Dining
    CategoryItem(
      title: 'Groceries',
      icon: Icons.shopping_cart,
      color: Colors.green,
    ),
    CategoryItem(
      title: 'Breakfast',
      icon: Icons.free_breakfast,
      color: Colors.orange,
    ),
    CategoryItem(
      title: 'Lunch',
      icon: Icons.lunch_dining,
      color: Colors.amber,
    ),
    CategoryItem(
      title: 'Dinner',
      icon: Icons.dinner_dining,
      color: Colors.deepOrange,
    ),
    CategoryItem(
      title: 'Snacks',
      icon: Icons.fastfood,
      color: Colors.orange,
    ),
    CategoryItem(
      title: 'Tea & Coffee',
      icon: Icons.local_cafe,
      color: Colors.brown,
    ),
    CategoryItem(
      title: 'Restaurant',
      icon: Icons.restaurant,
      color: Colors.red,
    ),
    CategoryItem(
      title: 'Food Delivery',
      icon: Icons.delivery_dining,
      color: Colors.pink,
    ),

    // Transport
    CategoryItem(
      title: 'Bus',
      icon: Icons.directions_bus,
      color: Colors.blue,
    ),
    CategoryItem(
      title: 'Auto Rickshaw',
      icon: Icons.electric_rickshaw,
      color: Colors.amber,
    ),
    CategoryItem(
      title: 'Taxi / Cab',
      icon: Icons.local_taxi,
      color: Colors.yellow,
    ),
    CategoryItem(
      title: 'Metro',
      icon: Icons.subway,
      color: Colors.indigo,
    ),
    CategoryItem(
      title: 'Train',
      icon: Icons.train,
      color: Colors.blueGrey,
    ),
    CategoryItem(
      title: 'Fuel',
      icon: Icons.local_gas_station,
      color: Colors.red,
    ),
    CategoryItem(
      title: 'Parking',
      icon: Icons.local_parking,
      color: Colors.purple,
    ),
    CategoryItem(
      title: 'Vehicle Repair',
      icon: Icons.car_repair,
      color: Colors.grey,
    ),

    // Shopping
    CategoryItem(
      title: 'Clothing',
      icon: Icons.checkroom,
      color: Colors.purple,
    ),
    CategoryItem(
      title: 'Shoes',
      icon: Icons.shopping_bag,
      color: Colors.brown,
    ),
    CategoryItem(
      title: 'Accessories',
      icon: Icons.watch,
      color: Colors.teal,
    ),
    CategoryItem(
      title: 'Electronics',
      icon: Icons.devices,
      color: Colors.blue,
    ),
    CategoryItem(
      title: 'Mobile & Gadgets',
      icon: Icons.phone_android,
      color: Colors.indigo,
    ),
    CategoryItem(
      title: 'Home & Kitchen',
      icon: Icons.kitchen,
      color: Colors.orange,
    ),
    CategoryItem(
      title: 'Online Shopping',
      icon: Icons.shopping_cart,
      color: Colors.deepPurple,
    ),

    // Housing
    CategoryItem(
      title: 'Rent',
      icon: Icons.home,
      color: Colors.amber,
    ),
    CategoryItem(
      title: 'Hostel',
      icon: Icons.hotel,
      color: Colors.blue,
    ),
    CategoryItem(
      title: 'Furniture',
      icon: Icons.chair,
      color: Colors.brown,
    ),
    CategoryItem(
      title: 'Home Appliances',
      icon: Icons.blender,
      color: Colors.teal,
    ),
    CategoryItem(
      title: 'Cleaning',
      icon: Icons.cleaning_services,
      color: Colors.cyan,
    ),
    CategoryItem(
      title: 'Repairs',
      icon: Icons.build,
      color: Colors.grey,
    ),

    // Education
    CategoryItem(
      title: 'College Fees',
      icon: Icons.school,
      color: Colors.indigo,
    ),
    CategoryItem(
      title: 'Books',
      icon: Icons.menu_book,
      color: Colors.blue,
    ),
    CategoryItem(
      title: 'Stationery',
      icon: Icons.edit,
      color: Colors.orange,
    ),
    CategoryItem(
      title: 'Course / Training',
      icon: Icons.cast_for_education,
      color: Colors.teal,
    ),
    CategoryItem(
      title: 'Exam Fees',
      icon: Icons.assignment,
      color: Colors.deepPurple,
    ),

    // Health & Medical
    CategoryItem(
      title: 'Medicine',
      icon: Icons.medication,
      color: Colors.red,
    ),
    CategoryItem(
      title: 'Doctor',
      icon: Icons.person,
      color: Colors.blue,
    ),
    CategoryItem(
      title: 'Hospital',
      icon: Icons.local_hospital,
      color: Colors.redAccent,
    ),
    CategoryItem(
      title: 'Medical Tests',
      icon: Icons.biotech,
      color: Colors.teal,
    ),
    CategoryItem(
      title: 'Dental',
      icon: Icons.health_and_safety,
      color: Colors.cyan,
    ),

    // Entertainment
    CategoryItem(
      title: 'Movies',
      icon: Icons.movie,
      color: Colors.pink,
    ),
    CategoryItem(
      title: 'Games',
      icon: Icons.games,
      color: Colors.deepPurple,
    ),
    CategoryItem(
      title: 'Music',
      icon: Icons.music_note,
      color: Colors.orange,
    ),
    CategoryItem(
      title: 'Streaming',
      icon: Icons.play_circle,
      color: Colors.red,
    ),
    CategoryItem(
      title: 'Events',
      icon: Icons.event,
      color: Colors.purple,
    ),
    CategoryItem(
      title: 'Hobbies',
      icon: Icons.palette,
      color: Colors.teal,
    ),

    // Bills & Utilities
    CategoryItem(
      title: 'Electricity',
      icon: Icons.bolt,
      color: Colors.amber,
    ),
    CategoryItem(
      title: 'Water',
      icon: Icons.water_drop,
      color: Colors.blue,
    ),
    CategoryItem(
      title: 'Gas',
      icon: Icons.local_fire_department,
      color: Colors.orange,
    ),
    CategoryItem(
      title: 'Mobile Recharge',
      icon: Icons.phone_android,
      color: Colors.green,
    ),
    CategoryItem(
      title: 'Internet',
      icon: Icons.wifi,
      color: Colors.indigo,
    ),
    CategoryItem(
      title: 'DTH / TV',
      icon: Icons.tv,
      color: Colors.deepPurple,
    ),

    // Other
    CategoryItem(
      title: 'Personal Care',
      icon: Icons.spa,
      color: Colors.pink,
    ),
    CategoryItem(
      title: 'Gym & Fitness',
      icon: Icons.fitness_center,
      color: Colors.green,
    ),
    CategoryItem(
      title: 'Gifts & Donations',
      icon: Icons.card_giftcard,
      color: Colors.pinkAccent,
    ),
    CategoryItem(
      title: 'Subscriptions',
      icon: Icons.subscriptions,
      color: Colors.red,
    ),
    CategoryItem(
      title: 'Bank Charges',
      icon: Icons.account_balance,
      color: Colors.blueGrey,
    ),
    CategoryItem(
      title: 'Insurance',
      icon: Icons.shield,
      color: Colors.teal,
    ),
    CategoryItem(
      title: 'Loan / EMI',
      icon: Icons.payments,
      color: Colors.deepOrange,
    ),
    CategoryItem(
      title: 'Miscellaneous',
      icon: Icons.more_horiz,
      color: Colors.grey,
    ),
  ];
  final List<CategoryItem> _paymentMethods = const [
    CategoryItem(
      title: 'Cash',
      icon: Icons.money,
      color: Colors.green,
    ),
    CategoryItem(
      title: 'UPI',
      icon: Icons.qr_code_2,
      color: Colors.indigo,
    ),
    CategoryItem(
      title: 'Debit Card',
      icon: Icons.credit_card,
      color: Colors.blue,
    ),
    CategoryItem(
      title: 'Credit Card',
      icon: Icons.credit_score,
      color: Colors.purple,
    ),
    CategoryItem(
      title: 'Net Banking',
      icon: Icons.account_balance,
      color: Colors.teal,
    ),
    CategoryItem(
      title: 'Mobile Wallet',
      icon: Icons.account_balance_wallet,
      color: Colors.orange,
    ),
    CategoryItem(
      title: 'Bank Transfer',
      icon: Icons.swap_horiz,
      color: Colors.cyan,
    ),
    CategoryItem(
      title: 'EMI',
      icon: Icons.payments,
      color: Colors.deepOrange,
    ),
    CategoryItem(
      title: 'Cheque',
      icon: Icons.receipt_long,
      color: Colors.blueGrey,
    ),
    CategoryItem(
      title: 'Gift Card',
      icon: Icons.card_giftcard,
      color: Colors.pink,
    ),
    CategoryItem(
      title: 'Other',
      icon: Icons.more_horiz,
      color: Colors.grey,
    ),
  ];

  final List<String> _allItems = ['Apple', 'Banana', 'Cherry', 'Date', 'Elderberry'];
  String _selectedItem = 'None';

  // 3. Open Modal Bottom Sheet
  void _openCategoryBottomSheet(BuildContext context) async {
    final CategoryItem? result = await showModalBottomSheet<CategoryItem>(
      context: context,
      backgroundColor: const Color(0xFF201F1F),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: SizedBox(
            height: 400,
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
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: 250,
                      height: 50,
                      child: SearchAnchor(
                        builder: (BuildContext context, SearchController controller) {
                          return SearchBar(
                            elevation: const WidgetStatePropertyAll<double>(0.0),
                            shadowColor: const WidgetStatePropertyAll<Color>(Colors.transparent),
                            backgroundColor: const WidgetStatePropertyAll<Color>(Colors.black26),
                            controller: controller,
                            padding: const WidgetStatePropertyAll<EdgeInsets>(
                              EdgeInsets.symmetric(horizontal: 16.0),
                            ),
                            onTap: () => controller.openView(),
                            onChanged: (_) => controller.openView(),
                            leading: const Icon(Icons.search),
                            hintText: 'Search Categ...',
                          );
                        },
                        suggestionsBuilder: (BuildContext context, SearchController controller) {
                          final String query = controller.text.toLowerCase();
                          return _allItems
                              .where((item) => item.toLowerCase().contains(query))
                              .map((item) => ListTile(
                            title: Text(item),
                            onTap: () {
                              setState(() {
                                _selectedItem = item;
                                controller.closeView(item);
                              });
                            },
                          ))
                              .toList();
                        },
                      ),
                    ),
                    ElevatedButton(style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black26, // Button background color
                      foregroundColor: Colors.white, // Text/icon color
                      side: const BorderSide(
                        color: Colors.white54, // Border color
                        width: 1.5,         // Border thickness
                      ),

                    )
                        ,
                        // onPressed: _showBottomforsavebutton,
                         onPressed: () {  },
                        child: Icon(Icons.add)
                        ),
                  ],
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
                          context.read<selectcategory>().select_category(category.title);
                          Navigator.pop(context, category);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
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
  void _openCategoryBottomSheetforplayment(BuildContext context) async {
    final CategoryItem? result = await showModalBottomSheet<CategoryItem>(
      context: context,
      backgroundColor: const Color(0xFF201F1F),
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight:
        MediaQuery.of(context).size.height *
            0.55, // Caps it at 75% of screen height
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: SizedBox(
            height: 400,
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
                  'Select Payment Method',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: 250,
                      height: 50,
                      child: SearchAnchor(
                        builder: (BuildContext context, SearchController controller) {
                          return SearchBar(
                            elevation: const WidgetStatePropertyAll<double>(0.0),
                            shadowColor: const WidgetStatePropertyAll<Color>(Colors.transparent),
                            backgroundColor: const WidgetStatePropertyAll<Color>(Colors.black26),
                            controller: controller,
                            padding: const WidgetStatePropertyAll<EdgeInsets>(
                              EdgeInsets.symmetric(horizontal: 16.0),
                            ),
                            onTap: () => controller.openView(),
                            onChanged: (_) => controller.openView(),
                            leading: const Icon(Icons.search),
                            hintText: 'Search Categ...',
                          );
                        },
                        suggestionsBuilder: (BuildContext context, SearchController controller) {
                          final String query = controller.text.toLowerCase();
                          return _allItems
                              .where((item) => item.toLowerCase().contains(query))
                              .map((item) => ListTile(
                            title: Text(item),
                            onTap: () {
                              setState(() {
                                _selectedItem = item;
                                controller.closeView(item);
                              });
                            },
                          ))
                              .toList();
                        },
                      ),
                    ),
                    ElevatedButton(style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black26, // Button background color
                      foregroundColor: Colors.white, // Text/icon color
                      side: const BorderSide(
                        color: Colors.white54, // Border color
                        width: 1.5,         // Border thickness
                      ),

                    )
                        ,
                        // onPressed: _showBottomforsavebutton,
                        onPressed: () {  },
                        child: Icon(Icons.add)
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // Category options list
                Flexible(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: _paymentMethods.length,
                    separatorBuilder: (context, index) => const Divider(
                      color: Colors.white12,
                      height: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    itemBuilder: (context, index) {
                      final category = _paymentMethods[index];
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
                          context.read<select_paymentmethod>().select_paymentcategory(category.title);
                          Navigator.pop(context, category);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
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
  void _openCategoryBottomSheetforsubcategories(BuildContext context) async {
    final CategoryItem? result = await showModalBottomSheet<CategoryItem>(
      context: context,
      backgroundColor: const Color(0xFF201F1F),
      isScrollControlled: true,

      // 2. Set the maximum height constraint
      constraints: BoxConstraints(
        maxHeight:
        MediaQuery.of(context).size.height *
            0.75, // Caps it at 75% of screen height
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: SizedBox(
            height: 400,
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
                  'Select Sub-Category',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: 250,
                      height: 50,
                      child: SearchAnchor(
                        builder: (BuildContext context, SearchController controller) {
                          return SearchBar(
                            elevation: const WidgetStatePropertyAll<double>(0.0),
                            shadowColor: const WidgetStatePropertyAll<Color>(Colors.transparent),
                            backgroundColor: const WidgetStatePropertyAll<Color>(Colors.black26),
                            controller: controller,
                            padding: const WidgetStatePropertyAll<EdgeInsets>(
                              EdgeInsets.symmetric(horizontal: 16.0),
                            ),
                            onTap: () => controller.openView(),
                            onChanged: (_) => controller.openView(),
                            leading: const Icon(Icons.search),
                            hintText: 'Search Categ...',
                          );
                        },
                        suggestionsBuilder: (BuildContext context, SearchController controller) {
                          final String query = controller.text.toLowerCase();
                          return _allItems
                              .where((item) => item.toLowerCase().contains(query))
                              .map((item) => ListTile(
                            title: Text(item),
                            onTap: () {
                              setState(() {
                                _selectedItem = item;
                                controller.closeView(item);
                              });
                            },
                          ))
                              .toList();
                        },
                      ),
                    ),
                    ElevatedButton(style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black26, // Button background color
                      foregroundColor: Colors.white, // Text/icon color
                      side: const BorderSide(
                        color: Colors.white54, // Border color
                        width: 1.5,         // Border thickness
                      ),

                    )
                        ,
                        // onPressed: _showBottomforsavebutton,
                        onPressed: () {  },
                        child: Icon(Icons.add)
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // Category options list
                Flexible(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: _subCategories.length,
                    separatorBuilder: (context, index) => const Divider(
                      color: Colors.white12,
                      height: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    itemBuilder: (context, index) {
                      final category = _subCategories[index];
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
                          context.read<selectsub_category>().select_subcategory(category.title);
                          Navigator.pop(context, category);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
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




  late final ReelTextController _labelController;

  @override
  void initState() {
    super.initState();
    // 1. Initial text state
    _labelController = ReelTextController(initialText: 'Are you sure?');
  }



  @override
  void dispose() {
    _labelController.dispose();
    super.dispose();
  }


  Future<void> _backnavigation()async{
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pop(context);
    Navigator.pop(context);
  }
  // Simulated save action (replace with your API/Database call)
  Future<void> _performSave() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  // Runs the state transition: Are you sure? -> Saving... -> Saved!
  Future<void> _onConfirmSave() {

    _backnavigation();



    return _labelController.runWhile(
      _performSave,
      waiting: 'Saving...',
      success: 'Saved!',
      failure: 'Failed to save',
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar( scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black12 ,
      title:  Padding(
        padding: const EdgeInsets.only(left: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add Expense",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Text(
              "Track every rupee",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white54,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ) ,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: ElevatedButton(style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black, // Button background color
              foregroundColor: Colors.white, // Text/icon color
              side: const BorderSide(
                color: Colors.white54, // Border color
                width: 1.5,         // Border thickness
              ),

            )
                ,
                // onPressed: _showBottomforsavebutton,
                child: Text("Add"),
                onPressed: showMyDialog),
          )
        ],
      ),
      backgroundColor: Colors.black12,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [

          
          
          
              SizedBox(
                height: 710,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8, top: 10),
                        child: Container(
                          width: double.infinity,
                          height: 118,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(37, 255, 255, 255), // Note: Color must be inside BoxDecoration when using decoration

                            borderRadius: BorderRadius.circular(
                              30.0,
                            ), // Adjust the double value for more/less curve
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: _showBottomSheet2,


                                child: SizedBox(
                                  height: 80,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(width: 20),
                                          Icon(
                                            Icons.wallet,
                                            color: Colors.white54,
                                            size: 25,
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            "Enter Amount",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white70,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        children: [
                                          SizedBox(width: 20),
                                          Consumer<addexpense>(builder: (context,addexpense,child){
                                            return Text(
                                              "₹ ${addexpense.moneyvalue}",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                                fontSize: 35,
                                              ),
                                            );
                                          }),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),







                            ],



                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:20,right: 20,top: 10),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Info",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 20),),
                            SizedBox(width: 130,),
                            GestureDetector(
                              child:  Text("",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white38),),

                            )

                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8, top: 10),
                        child: Container(
                          width: double.infinity,
                          height: 330,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(37, 255, 255, 255), // Note: Color must be inside BoxDecoration when using decoration
          
                            borderRadius: BorderRadius.circular(
                              30.0,
                            ), // Adjust the double value for more/less curve
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              SizedBox(height: 5),



          
                              InkWell(
                                onTap:  () => _openCategoryBottomSheet(context),
                                child: Row(
                                  children: [

                                    Row(
                                      children: [
                                        SizedBox(width: 20,height: 50,),
                                        Icon(
                                          Icons.grid_view,
                                          color: Colors.white54,
                                          size: 25,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          "Category",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white70,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),

                                    Spacer(),

                                    Consumer<selectcategory>(builder: (context,cateory,child){
                                      return Padding(
                                        padding: const EdgeInsets.only(right: 10.0),
                                        child: Text(
                                          "${cateory.selecttedcategory}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                      );
                                    }),
                                    SizedBox(width: 10),
                                  ],
                                ),
                              ),
                              Divider(
                                color: Colors.black45, // Line color
                                thickness: 2.0, // Line thickness
                               // Total height allocated to the widget (includes empty space above/below)
                                indent:
                                20.0, // Empty space before the line starts (left side)
                                endIndent:
                                20.0, // Empty space after the line ends (right side)
                              ),
                              InkWell(
                                  onTap:  () => _openCategoryBottomSheetforsubcategories(context),

                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(width: 20,height: 50,),
                                        Icon(
                                          Icons.subdirectory_arrow_right,
                                          color: Colors.white54,
                                          size: 25,
                                        ),
                                        SizedBox(width: 10),

                                        Text(
                                          "Sub-category",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white70,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Consumer<selectsub_category>(builder: (context,subcategory,child){
                                      return  Padding(
                                        padding: const EdgeInsets.only(right: 10.0),
                                        child: Text(
                                          "${subcategory.selecttedsubcategory}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                      );
                                    }),

                                    SizedBox(width: 10),
                                  ],
                                ),
                              ),
                              Divider(
                                color: Colors.black45, // Line color
                                thickness: 2.0, // Line thickness
                                // Total height allocated to the widget (includes empty space above/below)
                                indent:
                                20.0, // Empty space before the line starts (left side)
                                endIndent:
                                20.0, // Empty space after the line ends (right side)
                              ),
                              InkWell(
                                onTap: () => _selectDate(context),
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(width: 20,height: 50,),
                                        Icon(
                                          Icons.calendar_today,
                                          color: Colors.white54,
                                          size: 25,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          "Date",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white70,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10.0),
                                      child: Text(
                                        "Sun, 4 October 2026",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                  ],
                                ),
                              ),
                              Divider(
                                color: Colors.black45, // Line color
                                thickness: 2.0, // Line thickness
                                // Total height allocated to the widget (includes empty space above/below)
                                indent:
                                20.0, // Empty space before the line starts (left side)
                                endIndent:
                                20.0, // Empty space after the line ends (right side)
                              ),
                              InkWell(
                                 onTap: () => _selectTime(context),

                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(width: 20,height: 50,),
                                        Icon(
                                          Icons.access_time_outlined,
                                          color: Colors.white54,
                                          size: 25,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          "Time",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white70,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10.0),
                                      child: Text(
                                        "8:19 pm",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                  ],
                                ),
                              ),
                              Divider(
                                color: Colors.black45, // Line color
                                thickness: 2.0, // Line thickness
                                 // Total height allocated to the widget (includes empty space above/below)
                                indent:
                                20.0, // Empty space before the line starts (left side)
                                endIndent:
                                20.0, // Empty space after the line ends (right side)
                              ),
                              InkWell(
                                onTap: ()=> _openCategoryBottomSheetforplayment(context),
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(width: 20,height: 50,),
                                        Icon(
                                          Icons.payment,
                                          color: Colors.white54,
                                          size: 25,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          "Payment Method",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white70,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),

                                    Consumer<select_paymentmethod>(builder: (context,paymentmethod,child){
                                      return Padding(
                                        padding: const EdgeInsets.only(right: 10.0),
                                        child:  Text(
                                          "${paymentmethod.selecttepaymentdcategory}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                      );
                                    }),
                                    SizedBox(width: 10),
                                  ],
                                ),
                              ),
          
                              SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ),
          
                      Padding(
                        padding: const EdgeInsets.only(left:20,right: 20,top: 10),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Optional",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 20),),
                            SizedBox(width: 130,),
                            GestureDetector(
                              child:  Text("",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white38),),
          
                            )
          
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8, top: 10,bottom: 20),
                        child: Container(
                          width: double.infinity,
                          height: 240,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(37, 255, 255, 255), // Note: Color must be inside BoxDecoration when using decoration
          
                            borderRadius: BorderRadius.circular(
                              30.0,
                            ), // Adjust the double value for more/less curve
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  padding: const EdgeInsets.only(left: 10,right: 10,top: 5),
                                  decoration: BoxDecoration(
          
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 10,
                                        spreadRadius: 2,
                                      ),
                                    ],
                                  ),
                                  child: TextField(
                                    minLines: 1, // Minimum lines when empty or small
                                    maxLines: 2, // Allows the textfield to expand vertically as text increases
                                    textInputAction: TextInputAction.done, // Changes the Enter key to 'Done'
                                    onSubmitted: (value) {
                                      FocusScope.of(context).unfocus(); // Dismisses the keyboard on Done press
                                    },
                                    keyboardType: TextInputType.text,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white70,
                                    ),
                                    decoration: InputDecoration(
                                      labelText: 'Add Note',
                                      labelStyle: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      floatingLabelBehavior: FloatingLabelBehavior.always, // Keeps label in the border cutout
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                          color: Colors.white70,
                                          width: 1.5,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                          color: Colors.white ,
                                          width: 2.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Divider(
                                color: Colors.black45, // Line color
                                thickness: 2.0, // Line thickness
                                height:
                                20.0, // Total height allocated to the widget (includes empty space above/below)
                                indent:
                                20.0, // Empty space before the line starts (left side)
                                endIndent:
                                20.0, // Empty space after the line ends (right side)
                              ),
                              InkWell(

                                onTap: _showBottomSheetforshopname,
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(width: 20,height: 50,),
                                        Icon(
                                          Icons.store_mall_directory,
                                          color: Colors.white54,
                                          size: 25,
                                        ),
                                        SizedBox(width: 10),

                                        Text(
                                          "shop name",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white70,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10.0),
                                      child: Text(
                                        "Mohan Samose Wala",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                  ],
                                ),
                              ),
                              Divider(
                                color: Colors.black45, // Line color
                                thickness: 2.0, // Line thickness
                                height:
                                20.0, // Total height allocated to the widget (includes empty space above/below)
                                indent:
                                20.0, // Empty space before the line starts (left side)
                                endIndent:
                                20.0, // Empty space after the line ends (right side)
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(width: 20),
                                      Icon(
                                        Icons.attachment_outlined,
                                        color: Colors.white54,
                                        size: 25,
                                      ),
                                      SizedBox(width: 10),
          
                                      Text(
                                        "receipt",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white70,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child:Icon(Icons.camera_alt_outlined,color: Colors.white60,),
                                  ),
                                  SizedBox(width: 20),
                                ],
                              ),
                              SizedBox(height: 10,)
          
          
          
          
                            ],
          
          
          
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
              ),
          
          
          
          
          
          
            ],
          ),
        ),
      ),
    );






  }

  void showMyDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevents closing the dialog by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1E1E1E),

          title: const Text('Add Expense',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,),),
          content: SizedBox(
            height: 40,
            child: Center(
              child: ReelText.controller(
                controller: _labelController,
                style: const TextStyle(
                  fontSize: 20,

                ),
              ),
            ),
          ),
          actions: <Widget>[
            Column(
              children: [




                Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1E1E1E),
                      foregroundColor: Colors.white, // Text/icon color
                      side: const BorderSide(
                        color: Colors.white54, // Border color
                        width: 1.5,         // Border thickness
                      ),

                    ),onPressed:(){
                      Navigator.pop(context);
                    }, child: Text("Cancel")),
                    ElevatedButton(style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white70, // Button background color
                      foregroundColor: Colors.black, // Text/icon color


                    ),onPressed:_onConfirmSave, child: Text("Add")),


                  ],
                )

              ],
            )
          ],
        );
      },
    );
  }






  void _showBottomforsavebutton() {
    showModalBottomSheet(
      context: context,
      // The background color of the glass/barrier behind the bottom sheet
      barrierColor: Colors.black.withOpacity(0.6),
      // The actual background color of the sheet
      backgroundColor: const Color(0xFF1E1E1E),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return Container(
          height: 180,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Center(
                child:

                ClipRect(
                  child: SizedBox(
                    height: 40,
                    child: Center(
                      child: ReelText.controller(
                        controller: _labelController,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1E1E1E),
                    foregroundColor: Colors.white, // Text/icon color
                    side: const BorderSide(
                      color: Colors.white54, // Border color
                      width: 1.5,         // Border thickness
                    ),

                  ),onPressed:(){}, child: Text("Cancel")),
                  ElevatedButton(style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white70, // Button background color
                    foregroundColor: Colors.black, // Text/icon color


                  ),onPressed:_onConfirmSave, child: Text("Save")),


                ],
              )

            ],
          ),

        );
      },
    );
  }



  void _showBottomSheet2() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      // 2. Set the maximum height constraint
      constraints: BoxConstraints(
        maxHeight:
            MediaQuery.of(context).size.height *
            0.75, // Caps it at 75% of screen height
      ),
      // The background color of the glass/barrier behind the bottom sheet
      barrierColor: Colors.black.withOpacity(0.6),
      // The actual background color of the sheet
      backgroundColor: const Color(0xFF1E1E1E),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return Container(
          height: 450,
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Dark mode drag handle (optional, but looks great)
              Center(
                child: Container(
                  width: 40,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: IconButton.filled(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.clear),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.black54, // Background color
                        foregroundColor: Colors.white,
                        // Icon color
                      ),
                    ),
                  ),






                ],
              ),

              Row(
                children: [
                  SizedBox(width: 110,),

                  Expanded(
                    child: TextField(

                      textInputAction: TextInputAction.done, // Shows the check/done button on the keyboard
                      onSubmitted: (value) {
                        context.read<addexpense>().increse(value);
                        Navigator.pop(context);
                      },

                      autofocus: true,
                      // Sets the style of the text the user types
                      style: const TextStyle(
                        fontSize: 35.0,                  // Large font size matching the image
                        fontWeight: FontWeight.w500,     // Bold styling
                        color: Colors.white,             // Adjust color to contrast with your background
                      ),
                      keyboardType: TextInputType.number, // Forces numeric keyboard for currency
                      decoration: InputDecoration(
                        // Places a non-editable Rupee symbol right before the input text
                        prefixText: '₹ ',
                        prefixStyle: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                        hintText: '0.00',                   // Placeholder when empty
                        hintStyle: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w500,
                          color: Colors.white60,         // Slightly faded out zero hint
                        ),
                        border: InputBorder.none,        // Removes the default underline/box border
                        contentPadding: EdgeInsets.zero, // Removes default inner padding
                      ),
                    ),
                  ),
                ],
              )


            ],
          ),
        );
      },
    );
  }
  void _showBottomSheetforshopname() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      // 2. Set the maximum height constraint
      constraints: BoxConstraints(
        maxHeight:
            MediaQuery.of(context).size.height *
            0.75, // Caps it at 75% of screen height
      ),
      // The background color of the glass/barrier behind the bottom sheet
      barrierColor: Colors.black.withOpacity(0.6),
      // The actual background color of the sheet
      backgroundColor: const Color(0xFF1E1E1E),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return Container(
          height: 450,
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Dark mode drag handle (optional, but looks great)
              Center(
                child: Container(
                  width: 40,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: IconButton.filled(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.clear),
                      style: IconButton.styleFrom(
                        backgroundColor: Color(0xFF393939), // Background color
                        foregroundColor: Colors.white,
                        // Icon color
                      ),
                    ),
                  ),






                ],
              ),

              Row(
                children: [
                  SizedBox(width: 80,),

                  Expanded(
                    child: TextField(

                      textInputAction: TextInputAction.done, // Shows the check/done button on the keyboard
                      onSubmitted: (value) {
                        // Call your function here when the check button is clicked
                        Navigator.pop(context);
                      },

                      autofocus: true,
                      // Sets the style of the text the user types
                      style: const TextStyle(
                        fontSize: 35.0,                  // Large font size matching the image
                        fontWeight: FontWeight.w500,     // Bold styling
                        color: Colors.white,             // Adjust color to contrast with your background
                      ),
                       // Forces numeric keyboard for currency
                      decoration: InputDecoration(
                        // Places a non-editable Rupee symbol right before the input text
                        prefixText: 'Mr ',
                        prefixStyle: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                        hintText: 'Type name',                   // Placeholder when empty
                        hintStyle: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Colors.white60,         // Slightly faded out zero hint
                        ),
                        border: InputBorder.none,        // Removes the default underline/box border
                        contentPadding: EdgeInsets.zero, // Removes default inner padding
                      ),
                    ),
                  ),
                ],
              )


            ],
          ),
        );
      },
    );
  }
}

class CustomContainericon1 extends StatelessWidget {
  final Icon icon;
  final String t1;
  final String t2;

  const CustomContainericon1({
    super.key,
    required this.icon,
    required this.t1,
    required this.t2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors
                    .white12, // Note: Color must be inside BoxDecoration when using decoration

                borderRadius: BorderRadius.circular(
                  50,
                ), // Adjust the double value for more/less curve
              ),
              child: icon,
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 38,
              child: Column(
                children: [
                  Text(
                    t1,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white60,
                      fontSize: 15,
                    ),
                  ),

                  Text(
                    t2,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white60,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}


