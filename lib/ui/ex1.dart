import 'package:flutter/material.dart';


enum ContentType { today, thisweak, thisMonth,thisYear }


class DynamicSegmentedButtonExample extends StatefulWidget {
  const DynamicSegmentedButtonExample({super.key});

  @override
  State<DynamicSegmentedButtonExample> createState() =>
      _DynamicSegmentedButtonExampleState();
}

class _DynamicSegmentedButtonExampleState
    extends State<DynamicSegmentedButtonExample> {
  ContentType _selectedType = ContentType.today;

  // Map each enum value to its corresponding content widget
  Widget _buildContent(ContentType type) {
    switch (type) {
      case ContentType.today:
        return  Card(
          key: ValueKey('today'),
          color: Color(0xFF323232),
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Total Expenses"),
                    Text("1,730",style: TextStyle(color: Colors.tealAccent,fontSize: 35 ,fontWeight: FontWeight.w700),),
                    Row(
                      children: [
                        Text("vs Yesterday"),
                        SizedBox(width: 5,),
                        Card(
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.only(left: 12.0,right: 12,top: 4,bottom: 4),
                            child: Text("18%",style: TextStyle(color: Colors.black),),
                          ) ,
                        )

                      ],
                    ),
                  ],
                ),
                VerticalDivider(
                  color: Colors.grey,
                  thickness: 2,       // Line thickness
                  width: 32,          // Horizontal space occupied by the widget
                  indent: 8,          // Top padding/space
                  endIndent: 8,       // Bottom padding/space
                ),
                Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 90,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),

                          ),
                          SizedBox(width: 10,),
                          Text("Food"),

                        ],
                      ),
                    ),
                    SizedBox(width: 90,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),

                          ),
                          SizedBox(width: 10,),
                          Text("Transort"),

                        ],
                      ),
                    ),
                    SizedBox(width: 90,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            decoration: const BoxDecoration(
                              color: Colors.pinkAccent,
                              shape: BoxShape.circle,
                            ),

                          ),
                          SizedBox(width: 10,),
                          Text("Shopping"),

                        ],
                      ),
                    ),
                    SizedBox(width: 90,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            decoration: const BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.circle,
                            ),

                          ),
                          SizedBox(width: 10,),
                          Text("Spectacle"),

                        ],
                      ),
                    ),
                    SizedBox(width: 90,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                            ),

                          ),
                          SizedBox(width: 10,),
                          Text("Other"),

                        ],
                      ),
                    ),
                  ],
                ),
                Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("43%"),
                    Text("65%"),
                    Text("6%"),
                    Text("33%"),
                    Text("9%"),

                  ],
                )
              ],
            ),
          ),
        );
      case ContentType.thisweak:
        return  Card(
          key: ValueKey('weak'),
          color: Color(0xFF323232),
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Total Expenses"),
                    Text("987",style: TextStyle(color: Colors.tealAccent,fontSize: 35 ,fontWeight: FontWeight.w700),),
                    Row(
                      children: [
                        Text("vs last Weak"),
                        SizedBox(width: 5,),
                        Card(
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.only(left: 12.0,right: 12,top: 4,bottom: 4),
                            child: Text("15%",style: TextStyle(color: Colors.black),),
                          ) ,
                        )

                      ],
                    ),
                  ],
                ),
                VerticalDivider(
                  color: Colors.grey,
                  thickness: 2,       // Line thickness
                  width: 32,          // Horizontal space occupied by the widget
                  indent: 8,          // Top padding/space
                  endIndent: 8,       // Bottom padding/space
                ),
                Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 90,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),

                          ),
                          SizedBox(width: 10,),
                          Text("Food"),

                        ],
                      ),
                    ),
                    SizedBox(width: 90,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),

                          ),
                          SizedBox(width: 10,),
                          Text("Transort"),

                        ],
                      ),
                    ),
                    SizedBox(width: 90,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            decoration: const BoxDecoration(
                              color: Colors.pinkAccent,
                              shape: BoxShape.circle,
                            ),

                          ),
                          SizedBox(width: 10,),
                          Text("Shopping"),

                        ],
                      ),
                    ),
                    SizedBox(width: 90,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            decoration: const BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.circle,
                            ),

                          ),
                          SizedBox(width: 10,),
                          Text("Spectacle"),

                        ],
                      ),
                    ),
                    SizedBox(width: 90,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                            ),

                          ),
                          SizedBox(width: 10,),
                          Text("Other"),

                        ],
                      ),
                    ),
                  ],
                ),
                Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("34%"),
                    Text("6%"),
                    Text("54%"),
                    Text("9%"),
                    Text("3%"),

                  ],
                )
              ],
            ),
          ),
        );
      case ContentType.thisMonth:
        return  Card(
          key: ValueKey('month'),
          color: Color(0xFF323232),
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Total Expenses"),
                    Text("875",style: TextStyle(color: Colors.tealAccent,fontSize: 35 ,fontWeight: FontWeight.w700),),
                    Row(
                      children: [
                        Text("vs last month"),
                        SizedBox(width: 5,),
                        Card(
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.only(left: 12.0,right: 12,top: 4,bottom: 4),
                            child: Text("12%",style: TextStyle(color: Colors.black),),
                          ) ,
                        )

                      ],
                    ),
                  ],
                ),
                VerticalDivider(
                  color: Colors.grey,
                  thickness: 2,       // Line thickness
                  width: 32,          // Horizontal space occupied by the widget
                  indent: 8,          // Top padding/space
                  endIndent: 8,       // Bottom padding/space
                ),
                Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 90,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),

                          ),
                          SizedBox(width: 10,),
                          Text("Food"),

                        ],
                      ),
                    ),
                    SizedBox(width: 90,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),

                          ),
                          SizedBox(width: 10,),
                          Text("Transort"),

                        ],
                      ),
                    ),
                    SizedBox(width: 90,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            decoration: const BoxDecoration(
                              color: Colors.pinkAccent,
                              shape: BoxShape.circle,
                            ),

                          ),
                          SizedBox(width: 10,),
                          Text("Shopping"),

                        ],
                      ),
                    ),
                    SizedBox(width: 90,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            decoration: const BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.circle,
                            ),

                          ),
                          SizedBox(width: 10,),
                          Text("Spectacle"),

                        ],
                      ),
                    ),
                    SizedBox(width: 90,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                            ),

                          ),
                          SizedBox(width: 10,),
                          Text("Other"),

                        ],
                      ),
                    ),
                  ],
                ),
                Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("43%"),
                    Text("65%"),
                    Text("6%"),
                    Text("33%"),
                    Text("9%"),

                  ],
                )
              ],
            ),
          ),
        );
      case ContentType.thisYear:
        return  Card(
          key: ValueKey('year'),
          color: Color(0xFF323232),
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Total Expenses"),
                    Text("654",style: TextStyle(color: Colors.tealAccent,fontSize: 35 ,fontWeight: FontWeight.w700),),
                    Row(
                      children: [
                        Text("vs last year"),
                        SizedBox(width: 5,),
                        Card(
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.only(left: 12.0,right: 12,top: 4,bottom: 4),
                            child: Text("12%",style: TextStyle(color: Colors.black),),
                          ) ,
                        )

                      ],
                    ),
                  ],
                ),
                VerticalDivider(
                  color: Colors.grey,
                  thickness: 2,       // Line thickness
                  width: 32,          // Horizontal space occupied by the widget
                  indent: 8,          // Top padding/space
                  endIndent: 8,       // Bottom padding/space
                ),
                Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 90,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),

                          ),
                          SizedBox(width: 10,),
                          Text("Food"),

                        ],
                      ),
                    ),
                    SizedBox(width: 90,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),

                          ),
                          SizedBox(width: 10,),
                          Text("Transort"),

                        ],
                      ),
                    ),
                    SizedBox(width: 90,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            decoration: const BoxDecoration(
                              color: Colors.pinkAccent,
                              shape: BoxShape.circle,
                            ),

                          ),
                          SizedBox(width: 10,),
                          Text("Shopping"),

                        ],
                      ),
                    ),
                    SizedBox(width: 90,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            decoration: const BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.circle,
                            ),

                          ),
                          SizedBox(width: 10,),
                          Text("Spectacle"),

                        ],
                      ),
                    ),
                    SizedBox(width: 90,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                            ),

                          ),
                          SizedBox(width: 10,),
                          Text("Other"),

                        ],
                      ),
                    ),
                  ],
                ),
                Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("4%"),
                    Text("85%"),
                    Text("1%"),
                    Text("3%"),
                    Text("9%"),

                  ],
                )
              ],
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Segmented Button Navigation
            SegmentedButton<ContentType>(
              showSelectedIcon: false,
              segments: const [
                ButtonSegment(
                  value: ContentType.today,
                  label: Text('Today'),

                ),
                ButtonSegment(
                  value: ContentType.thisweak,
                  label: Text('Weakly'),

                ),
                ButtonSegment(
                  value: ContentType.thisMonth,
                  label: Text('Monthly'),

                ),
                ButtonSegment(
                  value: ContentType.thisYear,
                  label: Text('Yearly'),

                ),
              ],
              selected: {_selectedType},
              onSelectionChanged: (Set<ContentType> newSelection) {
                setState(() {
                  _selectedType = newSelection.first;
                });
              },
            ),
            const SizedBox(height: 12),

            // Dynamic Content Area with Fade Transition
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: _buildContent(_selectedType),
              ),
            ),
            Spacer(),
            Container(
              height: 300,
            )
          ],
        ),
      ),
    );
  }
}