import 'package:flutter/material.dart';
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
            Navigator.push(context, MaterialPageRoute(builder: (context) => view_expance()));
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
      backgroundColor: const Color(0xFF13151B), // Dark background color
      body: Stack(
        children: [
          _pages[_currentIndex],

          // Floating Navigation Bar positioned at the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              decoration: BoxDecoration(
                color: const Color(0xFF1B1D26), // Dark pill container background
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
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
              padding: const EdgeInsets.only(left: 8.0,right: 8,top: 20),
              child: Container(
                width: double.infinity,
                height: 240,
                decoration: BoxDecoration(
                  color: Colors.white10, // Note: Color must be inside BoxDecoration when using decoration

                  borderRadius: BorderRadius.circular(30.0), // Adjust the double value for more/less curve
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
                    Row(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 20,),
                            Icon(Icons.savings,color: Colors.white54,size: 25,),
                            SizedBox(width: 10,),
                            Text("Pocket Money",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white70,fontSize: 15),),
                          ],
                        ),
                        SizedBox(
                          width: 140,
                        ),
                        Text("₹500",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 15),),
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
                            Icon(Icons.trending_down,color: Colors.white54,size: 25,),
                            SizedBox(width: 10,),
                            Text("Spent",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white70,fontSize: 15),),
                          ],
                        ),
                        SizedBox(
                          width: 190,
                        ),
                        Text("₹1000",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 15),),
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
                        Text("₹1500",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 15),),
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
              padding: const EdgeInsets.only(left:20,right: 20,top: 10),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Quick Action",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 20),),
                  SizedBox(width: 130,),
                  GestureDetector(
                    child:  Text("",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white38),),

                  )

                ],
              ),
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap:_showBottomSheet2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10,top: 5),
                      child: Container(
                        width: 145,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white24,      // Border color
                            width: 1.0,              // Border thickness
                          ),

                          color: Colors.white10, // Note: Color must be inside BoxDecoration when using decoration

                          borderRadius: BorderRadius.circular(20.0), // Adjust the double value for more/less curve
                        ),
                        child:CustomContainericon1(icon: Icon(Icons.add,color: Colors.white70,size: 18,), t1: "Add", t2: "Money",)
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){

                      Navigator.push(context, MaterialPageRoute(builder: (context) => addexpence()));

                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10,top: 5),
                      child: Container(
                        width: 155,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white24,      // Border color
                            width: 1.0,              // Border thickness
                          ),

                          color: Colors.white10, // Note: Color must be inside BoxDecoration when using decoration

                          borderRadius: BorderRadius.circular(20.0), // Adjust the double value for more/less curve
                        ),
                        child:CustomContainericon1(icon: Icon(Icons.attach_money,color: Colors.white70,size: 18,), t1: "Add", t2: "Expance",),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){

                      // Navigator.push(context, MaterialPageRoute(builder: (context) => SaveConfirmationAnimation()));

                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10,top: 5),
                      child: Container(
                        width: 135,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white24,      // Border color
                            width: 1.0,              // Border thickness
                          ),

                          color: Colors.white10, // Note: Color must be inside BoxDecoration when using decoration

                          borderRadius: BorderRadius.circular(20.0), // Adjust the double value for more/less curve
                        ),
                        child:CustomContainericon1(icon: Icon(Icons.flag_outlined,color: Colors.white70,size: 18,), t1: "Add", t2: "Goal",),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){

                      Navigator.push(context, MaterialPageRoute(builder: (context) => addexpence()));

                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10,top: 5),
                      child: Container(
                        width: 175,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white24,      // Border color
                            width: 1.0,              // Border thickness
                          ),

                          color: Colors.white10, // Note: Color must be inside BoxDecoration when using decoration

                          borderRadius: BorderRadius.circular(20.0), // Adjust the double value for more/less curve
                        ),
                        child:CustomContainericon1(icon: Icon(Icons.currency_exchange,color: Colors.white70,size: 18,), t1: "Transfer", t2: "Money",),
                      ),
                    ),
                  ),






                ],
              ),
            ),




            Padding(
              padding: const EdgeInsets.only(left:20,right: 20,top: 10),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Latest Transactions",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 20),),
                  SizedBox(width: 100,),
                  GestureDetector(
                    child:  Text("See All",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white38),),

                  )

                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8,top: 8),
              child: Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white10, // Note: Color must be inside BoxDecoration when using decoration

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
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8),
              child: Container(
                  width: 310,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.white24, // Note: Color must be inside BoxDecoration when using decoration

                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(20), // Rounds both bottom corners
                    ), // Adjust the double value for more/less curve
                  ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8,bottom: 8),
              child: Container(
                  width: 300,
                  height: 3,
                  decoration: BoxDecoration(
                    color: Colors.white30, // Note: Color must be inside BoxDecoration when using decoration

                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(20), // Rounds both bottom corners
                    ), // Adjust the double value for more/less curve
                  ),

              ),
            ),



            Padding(
              padding: const EdgeInsets.only(left: 8,right: 8),
              child: Container(
                  width: double.infinity,
                  height: 110,
                  decoration: BoxDecoration(
                    color: Colors.white10, // Note: Color must be inside BoxDecoration when using decoration

                    borderRadius: BorderRadius.circular(20.0), // Adjust the double value for more/less curve
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

// -------------------------------His----------------------------
