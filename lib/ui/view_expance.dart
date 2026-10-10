import 'package:flutter/material.dart';
import 'package:mypocket/ui/component/cal1.dart';
import 'package:mypocket/ui/component/calender.dart';
import 'package:reel_text/reel_text.dart';

class CategoryItem {
  final String title;
  final IconData icon;
  final Color color;
  final String price;

  const CategoryItem({
    required this.title,
    required this.price,
    required this.icon,
    required this.color,
  });
}


enum ContentType { today, thisWeek, thisMonth,thisYear }


class DynamicSegmentedButtonExample extends StatefulWidget {
  const DynamicSegmentedButtonExample({super.key});

  @override
  State<DynamicSegmentedButtonExample> createState() =>
      _DynamicSegmentedButtonExampleState();
}

class _DynamicSegmentedButtonExampleState
    extends State<DynamicSegmentedButtonExample> {

  bool _isCopied = true;


  final List<CategoryItem> _paymentMethods = const [
    CategoryItem(
      title: 'Food',
      price: '₹ 540',
      icon: Icons.emoji_food_beverage,
      color: Colors.green,
    ),
    CategoryItem(
      title: 'Education',
      price: '₹ 1140',
      icon: Icons.receipt,
      color: Colors.indigo,
    ),
    CategoryItem(
      title: 'Entertainment',
      price: '₹ 30',
      icon: Icons.airplay_sharp,
      color: Colors.blue,
    ),
    CategoryItem(
      title: 'Food',
      price: '₹ 540',
      icon: Icons.emoji_food_beverage,
      color: Colors.green,
    ),
    CategoryItem(
      title: 'Education',
      price: '₹ 1140',
      icon: Icons.receipt,
      color: Colors.indigo,
    ),
    CategoryItem(
      title: 'Entertainment',
      price: '₹ 30',
      icon: Icons.airplay_sharp,
      color: Colors.blue,
    ),
    CategoryItem(
      title: 'Food',
      price: '₹ 540',
      icon: Icons.emoji_food_beverage,
      color: Colors.green,
    ),
    CategoryItem(
      title: 'Education',
      price: '₹ 1140',
      icon: Icons.receipt,
      color: Colors.indigo,
    ),
    CategoryItem(
      title: 'Entertainment',
      price: '₹ 30',
      icon: Icons.airplay_sharp,
      color: Colors.blue,
    ),


  ];
  void _openCategoryBottomSheetforplayment(BuildContext context) async {
    final CategoryItem? result = await showModalBottomSheet<CategoryItem>(
      context: context,
      backgroundColor: const Color(0xFF252525),
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
                          backgroundColor: category.color.withValues(alpha: 0.15),
                          child: Icon(category.icon, color: category.color),
                        ),
                        title: Text(
                          category.title,
                          style: const TextStyle(color: Colors.white),
                        ),
                        trailing: Text(category.price)


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
      });
    }
  }



  ContentType _selectedType = ContentType.today;

  // Map each enum value to its corresponding content widget
  Widget _buildContent(ContentType type) {
    switch (type) {
      case ContentType.today:
        return  Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0), // Adjust the value for more/less roundness
          ),
          key: ValueKey('today'),

          color: Colors.white10,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              children: [
                SizedBox(width: 140,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Total Expenses"),
                      Text("₹ 1,730",style: TextStyle(color: Colors.white70,fontSize: 35 ,fontWeight: FontWeight.w700),),
                      Row(
                        children: [
                          SizedBox(width: 83,
                              child: Text("vs Yesterday")),

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
      case ContentType.thisWeek:
        return  Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0), // Adjust the value for more/less roundness
          ),
          key: ValueKey('weak'),
          // color: Color(0xFF323232),
          color: Colors.white10,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              children: [
                SizedBox(width: 140,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Total Expenses"),
                      Text("₹ 987",style: TextStyle(color: Colors. white70,fontSize: 35 ,fontWeight: FontWeight.w700),),
                      Row(
                        children: [
                          SizedBox(width: 83,
                              child: Text("vs last Weak")),

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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0), // Adjust the value for more/less roundness
          ),
          key: ValueKey('month'),
          color: Colors.white10,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              children: [
                SizedBox(width: 140,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Total Expenses"),
                      Text("₹ 875",style: TextStyle(color:  Colors.white70,fontSize: 35 ,fontWeight: FontWeight.w700),),
                      Row(
                        children: [
                          SizedBox(
                              width: 83,child: Text("vs last month")),

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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0), // Adjust the value for more/less roundness
          ),
          key: ValueKey('year'),
          color: Colors.white10,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              children: [
                SizedBox(width: 140,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Total Expenses"),
                      Text("₹ 654",style: TextStyle(color:  Colors.white70,fontSize: 35 ,fontWeight: FontWeight.w700),),
                      Row(
                        children: [
                          SizedBox(width: 83,
                              child: Text("vs last year")),

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
      backgroundColor: Colors.black45,
      appBar: AppBar(
        backgroundColor: Colors.black45,
        scrolledUnderElevation: 0,

        title: const Text('Expenses'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0,right: 8),
        child: Column(
          children: [
            // Segmented Button Navigation
            const SizedBox(height: 6),
            Row(
              children: [
                SizedBox(width: 9,),
                SegmentedButton<ContentType>(
                  style: ButtonStyle(

                    backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
                      if (states.contains(WidgetState.selected)) {
                        return Color(0xFF4E4D4D); // Background color when SELECTED
                      }
                      return Colors.white12; // Background color when UNSELECTED
                    }),
                    foregroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
                      if (states.contains(WidgetState.selected)) {
                        return Colors.white; // Text/Icon color when SELECTED
                      }
                      return Colors.white70; // Text/Icon color when UNSELECTED
                    }),



                    // 1. Remove the outline border
                    side: WidgetStateProperty.all(BorderSide.none),

                    // 2. Apply border radius to all outer corners
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0), // Adjust the radius value here
                      ),
                    ),
                  ),
                  showSelectedIcon: false,
                  segments: [
                    ButtonSegment<ContentType>(




                      value: ContentType.today,
                      label: const Text('Today'),
                    ),
                    const ButtonSegment<ContentType>(
                      value: ContentType.thisWeek,
                      label: Text('Weekly'),
                    ),
                    const ButtonSegment<ContentType>(
                      value: ContentType.thisMonth,
                      label: Text('Monthly'),
                    ),
                    const ButtonSegment<ContentType>(
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
                IconButton(onPressed: (){
                  // _openCategoryBottomSheetforplayment(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TableCalendarDemoScreen()));
                }, icon: Icon(Icons.calendar_month_rounded,color: Color(0xFF989797),))
              ],
            ),
            const SizedBox(height: 6),

            // Dynamic Content Area with Fade Transition
            SizedBox(height: 150,
              child: Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: _buildContent(_selectedType),
                ),
              ),
            ),
            SizedBox(height: 6,),
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                // color: Color(0xFF323232),
                color: Colors.white10,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomRoundedCardforsecondcard(icon: Icon(Icons.shopping_cart_rounded,color: Colors.black,), t1: 'shopping', t2: '₹ 200',),
                  VerticalDivider(
                    color: Colors.black26,
                    thickness: 2,       // Line thickness
                    // Horizontal space occupied by the widget
                    indent: 8,          // Top padding/space
                    endIndent: 8,       // Bottom padding/space
                  ),
                  CustomRoundedCardforsecondcard(icon: Icon(Icons.fastfood_rounded,color: Colors.black,), t1: 'food', t2: '₹ 751',),
                  VerticalDivider(
                    color: Colors.black26,
                    thickness: 2,       // Line thickness
                    // Horizontal space occupied by the widget
                    indent: 8,          // Top padding/space
                    endIndent: 8,       // Bottom padding/space
                  ),
                  CustomRoundedCardforsecondcard(icon: Icon(Icons.train,color: Colors.black,), t1: 'transport', t2: '₹ 432',),
                  VerticalDivider(
                    color: Colors.black26,
                    thickness: 2,       // Line thickness
                    // Horizontal space occupied by the widget
                    indent: 8,          // Top padding/space
                    endIndent: 8,       // Bottom padding/space
                  ),
                  CustomRoundedCardforsecondcard(icon: Icon(Icons.more_horiz,color: Colors.black,), t1: 'other', t2: '₹ 650',),





                ],
              ),
            ),



            Padding(
              padding: const EdgeInsets.only( top: 5,left: 10),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Recent expenses",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 20),),
                  SizedBox(width: 130,),
                  GestureDetector(
                    child:  Text("",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white38),),

                  )

                ],
              ),
            ),
            SizedBox(height: 5,),
            Container(
              width: double.infinity,
              height: 350,
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Flexible(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: _paymentMethods.length,
                  separatorBuilder: (context, index) => const Divider(
                    color: Colors.white12,
                    height: 8,
                    indent: 20,
                    endIndent: 20,
                  ),
                  itemBuilder: (context, index) {
                    final category = _paymentMethods[index];
                    return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: category.color.withValues(alpha: 0.15),
                          child: Icon(category.icon, color: category.color),
                        ),
                        title: Text(
                          category.title,
                          style: const TextStyle(color: Colors.white),
                        ),

                        trailing: Text(category.price, style: const TextStyle(color: Colors.white,fontSize: 15),)
                    );
                  },
                ),
              ),

            ),

          ],
        ),
      ),
    );
  }
}



class CustomRoundedCardforsecondcard extends StatelessWidget {
  final Icon icon;
  final String t1;
  final String t2;


  const CustomRoundedCardforsecondcard({
    super.key,
    required this.icon,
    required this.t1,
    required this.t2,

  });

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      height: 90,
      width: 60,
      child: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0), // Adjust the value for more/less roundness
            ),

            color: Color(0xFF989797),
            child: SizedBox(
                height: 40,
                width: 40,

                child: icon),

          ),
          Text(t1),
          Text(t2),
        ],
      ),
    );
  }
}
