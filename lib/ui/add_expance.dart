import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:mypocket/ui/add_expance.dart';
import 'package:mypocket/ui/component/glowingbutton.dart';
import 'package:mypocket/ui/ex.dart';

class addexpence extends StatefulWidget {
  const addexpence({super.key});

  @override
  State<addexpence> createState() => _addexpenceState();
}

class _addexpenceState extends State<addexpence> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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

            ),onPressed: _showBottomforsavebutton, child: Text("Save")),
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
                          height: 400,
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
                                            "Amount",
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
                                            "₹3,500",
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
          
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Text(
                                      "Food",
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
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Text(
                                      "Snacks",
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
          
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Text(
                                      "UPI",
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
          
                              SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ),
          
                      Padding(
                        padding: const EdgeInsets.only(left:20,right: 20,top: 10),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("More",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 20),),
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
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(width: 20),
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

                Text(
                  "Are you sure?",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 30,
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


                  ),onPressed:(){}, child: Text("Save")),


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
