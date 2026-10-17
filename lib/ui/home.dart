import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:lottie/lottie.dart';
import 'package:mypocket/ui/add_expance.dart';
import 'package:mypocket/ui/ex1.dart';
import 'package:mypocket/ui/view_expance.dart';
import 'ex.dart';

class FloatingNavBarScreen extends StatefulWidget {
  const FloatingNavBarScreen({super.key});



  @override
  State<FloatingNavBarScreen> createState() => _FloatingNavBarScreenState();
}

class _FloatingNavBarScreenState extends State<FloatingNavBarScreen> {


  int _currentIndex = 0;

  // Icons matching your image layout
  final List<NavItemData> _navItems = [
    NavItemData(icon: Icons.home_rounded, label: 'Home'),

    // NavItemData(icon: Icons.pie_chart_outline_rounded, label: 'Stats'),
    NavItemData(icon: Icons.access_time_rounded, label: 'History'),
    NavItemData(icon: Icons.person_outline_rounded, label: 'Profile'),
  ];

  // Dummy pages for demonstration
  late final List<Widget> _pages = [
    const homeui(),
    Center(child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: IconButton(onPressed: (){
            // Navigator.push(context, MaterialPageRoute(builder: (context) => view_expance()));
          }, icon: const Icon(Icons.face)),
        )
      ],
    )),
    Center(child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => DynamicSegmentedButtonExample()));
          }, icon: const Icon(Icons.face)),
        )
      ],
    )),



  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12, // Dark background color
      body: Stack(
        children: [
          _pages[_currentIndex],

          // Floating Navigation Bar positioned at the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white10, // Dark pill container background
                borderRadius: BorderRadius.circular(40),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.white12,
                //     blurRadius: 5,
                //     offset: const Offset(0, 2),
                //   ),
                // ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(_navItems.length, (index) {
                  final isSelected = _currentIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                      padding: EdgeInsets.symmetric(
                        horizontal: isSelected ? 16.0 : 12.0,
                        vertical: 10.0,
                      ),
                      decoration: BoxDecoration(
                        // Pill highlight background for the active item
                        color: isSelected
                            ? Colors.white10
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            _navItems[index].icon,
                            color: isSelected
                                ? Colors.white70// Light purple active icon
                                : Colors.grey[600],        // Grey inactive icon
                            size: 22,
                          ),

                          if (isSelected) ...[
                            const SizedBox(width: 8),
                            Text(
                              _navItems[index].label,
                              style: const TextStyle(
                                color: Colors.white70, // Light purple active text
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NavItemData {
  final IconData icon;
  final String label;

  NavItemData({required this.icon, required this.label});
}

// -------------------------------homeui----------------------------
class homeui extends StatefulWidget {
  const homeui({super.key});

  @override
  State<homeui> createState() => _homeuiState();
}

class _homeuiState extends State<homeui> {

  List<Container> cards = [
    Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 30, 30, 30), // Note: Color must be inside BoxDecoration when using decoration

          borderRadius: BorderRadius.circular(20.0), // Adjust the double value for more/less curve
        ),
        child:  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 5,),
            Column(crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white12, // Note: Color must be inside BoxDecoration when using decoration

                    borderRadius: BorderRadius.circular(50), // Adjust the double value for more/less curve
                  ),
                  child: Icon(Icons.directions_bus_rounded,color: Colors.white70,) ,


                ),
              ],
            ),
            SizedBox(width: 1,),
            Column(mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Travel",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white60,fontSize: 15),),
                Text("Bus 12:10AM",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white60,fontSize: 15),),

              ],
            ),
            SizedBox(width: 100,),
            Text("-155",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white60,fontSize: 20),),
            SizedBox(width: 10,),


          ],
        )
    ),
    Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 44, 44, 44), // Note: Color must be inside BoxDecoration when using decoration

          borderRadius: BorderRadius.circular(20.0), // Adjust the double value for more/less curve
        ),
        child:  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 5,),
            Column(crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white12, // Note: Color must be inside BoxDecoration when using decoration

                    borderRadius: BorderRadius.circular(50), // Adjust the double value for more/less curve
                  ),
                  child: Icon(Icons.kitesurfing,color: Colors.white70,) ,


                ),
              ],
            ),
            SizedBox(width: 1,),
            Column(mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Other",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white60,fontSize: 15),),
                Text("Kit 2:15PM",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white60,fontSize: 15),),

              ],
            ),
            SizedBox(width: 100,),
            Text("-155",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white60,fontSize: 20),),
            SizedBox(width: 10,),


          ],
        )
    ),
    Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 41, 41, 41), // Note: Color must be inside BoxDecoration when using decoration

          borderRadius: BorderRadius.circular(20.0), // Adjust the double value for more/less curve
        ),
        child:  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 5,),
            Column(crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white12, // Note: Color must be inside BoxDecoration when using decoration

                    borderRadius: BorderRadius.circular(50), // Adjust the double value for more/less curve
                  ),
                  child: Icon(Icons.fastfood_outlined,color: Colors.white70,) ,


                ),
              ],
            ),
            SizedBox(width: 1,),
            Column(mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Food",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white60,fontSize: 15),),
                Text("Tea 1:10PM",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white60,fontSize: 15),),

              ],
            ),
            SizedBox(width: 100,),
            Text("-35",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white60,fontSize: 20),),
            SizedBox(width: 10,),


          ],
        )
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Center(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 110,
               // color: Colors.white70,


              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 15,),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Good Morning,",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white70,fontSize: 30),),
                        Text("Manish!",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.white70,fontSize: 30)),
                      ],
                    ),
                    SizedBox(width: 100,),
                    Column(
                      children: [
                        SizedBox(height: 10,),
                        CircleAvatar(
                          radius:20,
                          backgroundColor:Colors.white70,
                          child: CircleAvatar(
                            radius: 18,
                            backgroundImage: NetworkImage("https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                          ),
                        ),
                      ],
                    ),


                  ],
                ),
              )
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8,top:8),
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: Color.fromARGB(37, 255, 255, 255), // Note: Color must be inside BoxDecoration when using decoration

                  borderRadius: BorderRadius.circular(24.0), // Adjust the double value for more/less curve
                ),
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 80,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 20,),
                              Icon(Icons.wallet,color: Colors.white54,size: 25,),
                              SizedBox(width: 10,),
                              Text("Total Balance",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white70,fontSize: 15),),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              SizedBox(width: 20,),
                              Text("₹3,500",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 35),),
                            ],
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.black45, // Line color
                      thickness: 2.0,     // Line thickness
                      height: 20.0,       // Total height allocated to the widget (includes empty space above/below)
                      indent: 20.0,       // Empty space before the line starts (left side)
                      endIndent: 20.0,    // Empty space after the line ends (right side)
                    ),
                    // Row(
                    //   children: [
                    //     Row(
                    //       children: [
                    //         SizedBox(width: 20,),
                    //         Icon(Icons.savings,color: Colors.white54,size: 25,),
                    //         SizedBox(width: 10,),
                    //         Text("Pocket Money",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white70,fontSize: 15),),
                    //       ],
                    //     ),
                    //     SizedBox(
                    //       width: 140,
                    //     ),
                    //     Text("₹500",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 15),),
                    //     SizedBox(
                    //       width: 10,
                    //     ),
                    //   ],
                    //
                    //
                    // ),
                    // Divider(
                    //   color: Colors.black45,  // Line color
                    //   thickness: 2.0,     // Line thickness
                    //   height: 20.0,       // Total height allocated to the widget (includes empty space above/below)
                    //   indent: 20.0,       // Empty space before the line starts (left side)
                    //   endIndent: 20.0,    // Empty space after the line ends (right side)
                    // ),
                    Row(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 20,),
                            Icon(Icons.trending_down,color: Colors.white54,size: 25,),
                            SizedBox(width: 10,),
                            Text("Spent",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white70,fontSize: 15),),
                          ],
                        ),
                        SizedBox(
                          width: 190,
                        ),
                        Text("₹1000",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white70,fontSize: 15),),
                        SizedBox(
                          width: 10,
                        ),
                      ],


                    ),
                    Divider(
                      color: Colors.black45,  // Line color
                      thickness: 2.0,     // Line thickness
                      height: 20.0,       // Total height allocated to the widget (includes empty space above/below)
                      indent: 20.0,       // Empty space before the line starts (left side)
                      endIndent: 20.0,    // Empty space after the line ends (right side)
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 20,),
                            Icon(Icons.account_balance_wallet,color: Colors.white54,size: 25,),
                            SizedBox(width: 10,),
                            Text("Saved",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white70,fontSize: 15),),
                          ],
                        ),
                        SizedBox(
                          width: 190,
                        ),
                        Text("₹1500",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white70,fontSize: 15),),
                        SizedBox(
                          width: 10,
                        ),
                      ],


                    ),





                  ]
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 8,right: 8,top: 8),
              child: Container(
                  width: double.infinity,
                  height: 110,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(37, 255, 255, 255), // Note: Color must be inside BoxDecoration when using decoration

                    borderRadius: BorderRadius.circular(24.0), // Adjust the double value for more/less curve
                  ),
                  child:  Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:20,right: 20,top: 5),
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Icon(Icons.watch_later_outlined,size: 15,color: Colors.white54,),
                                SizedBox(width: 5,),
                                Text("Daily Limit",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white54,fontSize: 12),),


                                SizedBox(width: 115,)




                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:20,right: 20,top: 10),
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Container(
                                  height: 24,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.white60, // Note: Color must be inside BoxDecoration when using decoration

                                    borderRadius: BorderRadius.circular(20), // Adjust the double value for more/less curve
                                  ),
                                  child: Center(child: Text("₹ 50 Left",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black87,fontSize: 12),)),





                                ),



                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [


                                Row(

                                  children: [


                                    SizedBox(width: 5,),




                                    Row(
                                      children: [
                                        Text("₹70",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white60,fontSize: 25),),
                                        Text("/120",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white60,fontSize: 15),),
                                      ],
                                    ),
                                    SizedBox(width: 10,),


                                  ],
                                ),
                                SizedBox(height: 5,),
                                SizedBox(width: 300,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: LinearProgressIndicator(
                                      value: 0.6,
                                      backgroundColor: Colors.white12,
                                      color: Colors.white30,
                                      minHeight: 8.0,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text("Resets at 12:00 AM",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white54,fontSize: 12),),

                              ],
                            ),
                          ),



                        ],
                      ),
                    ],
                  )
              ),
            ),












            Padding(
              padding: const EdgeInsets.only(left:20,right: 20,top: 10),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Quick Action",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white70,fontSize: 20),),
                  SizedBox(width: 130,),
                  GestureDetector(
                    child:  Text("",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white38),),

                  )

                ],
              ),
            ),
            SizedBox(height: 8,),

            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                customebutton(text1: 'Add', text2: 'Money', onPressed: () {  }, icon: Icons.add,),
                customebutton(text1: 'Add', text2: 'Expenses', onPressed: () {

                   Navigator.push(
                     context,
                     PageRouteBuilder(
                       pageBuilder: (context, animation, secondaryAnimation) => const addexpence(),
                       transitionDuration: Duration.zero,        // Removes entry animation
                       reverseTransitionDuration: Duration.zero, // Removes exit/back animation
                     ),
                   );

                }, icon: Icons.payment,),
                customebutton(text1: 'View', text2: 'Expenses', onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) => const DynamicSegmentedButtonExample(),
                      transitionDuration: Duration.zero,        // Removes entry animation
                      reverseTransitionDuration: Duration.zero, // Removes exit/back animation
                    ),
                  );
                }, icon: Icons.post_add,),
                customebutton(text1: 'Set', text2: 'Goal', onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>  Example(),
                      transitionDuration: Duration.zero,        // Removes entry animation
                      reverseTransitionDuration: Duration.zero, // Removes exit/back animation
                    ),
                  );
                }, icon: Icons.outlined_flag,),
                customebutton(text1: 'View', text2: 'Transfer', onPressed: () {  }, icon: Icons.currency_exchange,),

              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left:20,right: 20,top: 8),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Latest Transactions",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white70,fontSize: 20),),
                  SizedBox(width: 100,),
                  GestureDetector(
                    child:  Text("See All",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white38),),

                  )

                ],
              ),
            ),


            Flexible(
              child: CardSwiper(
                backCardOffset: const Offset(0, -10),

                allowedSwipeDirection: const AllowedSwipeDirection.symmetric(horizontal: true),
                scale: 0.96,



                cardsCount: cards.length,
                cardBuilder: (context, index, percentThresholdX, percentThresholdY) => cards[index],
              ),
            ),



























          ],
        ),
      ),
    );
  }


  void _showBottomSheet2() {
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
          height: 350,
          padding: const EdgeInsets.all(20.0),

        );
      },
    );
  }






}

class CustomContainericon extends StatelessWidget {
  final Icon icon;
  final String t1;
  final String t2;



  const CustomContainericon({
    super.key,
    required this.icon,
    required this.t1,
    required this.t2,


  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: 5,),
        Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: Colors.white12, // Note: Color must be inside BoxDecoration when using decoration

                borderRadius: BorderRadius.circular(50), // Adjust the double value for more/less curve
              ),
              child: icon ,


            ),
          ],
        ),
        SizedBox(width: 1,),
        Column(mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(t1,style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white60,fontSize: 15),),
            Text(t2,style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white60,fontSize: 15),),

          ],
        ),
        SizedBox(width: 30,),
      ],
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
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: 5,),
        Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.white10, // Note: Color must be inside BoxDecoration when using decoration

                borderRadius: BorderRadius.circular(50), // Adjust the double value for more/less curve
              ),
              child: icon ,


            ),
          ],
        ),
        SizedBox(width: 1,),
        Row(mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(t1,style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white60,fontSize: 15),),
            SizedBox(width: 5,),
            Text(t2,style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white60,fontSize: 15),),

          ],
        ),
        SizedBox(width: 15,),
      ],
    );
  }
}


class customebutton extends StatelessWidget {
  final String text1;
  final String text2;
  final IconData icon;
  final Color backgroundColor;
  final VoidCallback onPressed;


  const customebutton({
    super.key,
    required this.text1,
    required this.text2,
    required this.icon,
    this.backgroundColor = Colors.blue,
    required this.onPressed,

  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onPressed,
      child: Container(
        height: 96,
        width: 56,
        decoration: BoxDecoration(
          // border: Border.all(
          //   color: Colors.white24,      // Border color
          //   width: 1.0,              // Border thickness
          // ),

          // color: Colors.white12,

          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 18,
              child: Icon(icon),
              backgroundColor: Colors.white70,
            ),
            SizedBox(height: 6,),
            SizedBox(
              height: 36,
              child: Column(
                children: [
                  Text(text1,style: TextStyle(color: Colors.white70),),
                  Text(text2,style: TextStyle(color: Colors.white70),),
                ],
              ),)


          ],
        ),
      ),
    );
  }
}

