import 'package:flutter/material.dart';
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

class addmoney extends StatefulWidget {
  const addmoney({super.key});

  @override
  State<addmoney> createState() => _addmoneyState();
}

class _addmoneyState extends State<addmoney> {

  late final ReelTextController _labelController;





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
  final List<String> _allItems = ['Apple', 'Banana', 'Cherry', 'Date', 'Elderberry'];
  String _selectedItem = 'None';


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
                          // Pass selected item back and close bottom sheet
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
                "Add Money",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Text(
                "Add money to your wallet",
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
                onPressed: (){},
            ),
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
                                          Text(
                                            "₹00.00",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                              fontSize: 35,
                                            ),
                                          ),
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
                          height: 270,
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
                              SizedBox(height: 10,),
                              InkWell(

                                onTap:  () => _openCategoryBottomSheet(context),
                                child: Row(
                                  children: [

                                    Row(
                                      children: [
                                        SizedBox(width: 20,height: 50,),
                                        Icon(
                                          Icons.payments,
                                          color: Colors.white54,
                                          size: 25,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          "Money received from",
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
                                        "Family",
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

                                onTap:  () => _openCategoryBottomSheet(context),
                                child: Row(
                                  children: [

                                    Row(
                                      children: [
                                        SizedBox(width: 20,height: 50,),
                                        Icon(
                                          Icons.attach_money,
                                          color: Colors.white54,
                                          size: 25,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          "Received via",
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
                                        "Upi",
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
                              SizedBox(height: 10,),







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
                        padding: const EdgeInsets.only(left: 8.0, right: 8, top: 10),
                        child: Container(
                          width: double.infinity,
                          height: 180,
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


}
