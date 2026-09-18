import 'package:flutter/material.dart';

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
    NavItemData(icon: Icons.search_rounded, label: 'Search'),
    NavItemData(icon: Icons.pie_chart_outline_rounded, label: 'Stats'),
    NavItemData(icon: Icons.access_time_rounded, label: 'History'),
    NavItemData(icon: Icons.person_outline_rounded, label: 'Profile'),
  ];

  // Dummy pages for demonstration
  final List<Widget> _pages = const [
    homeui(),
    Center(child: Text('Search Screen', style: TextStyle(color: Colors.white, fontSize: 20))),
    Center(child: Text('Stats Screen', style: TextStyle(color: Colors.white, fontSize: 20))),
    Center(child: Text('History Screen', style: TextStyle(color: Colors.white, fontSize: 20))),
    Center(child: Text('Profile Screen', style: TextStyle(color: Colors.white, fontSize: 20))),
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
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
                            ? const Color(0xFF2E2C44)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            _navItems[index].icon,
                            color: isSelected
                                ? const Color(0xFFA594F9) // Light purple active icon
                                : Colors.grey[600],        // Grey inactive icon
                            size: 22,
                          ),

                          if (isSelected) ...[
                            const SizedBox(width: 8),
                            Text(
                              _navItems[index].label,
                              style: const TextStyle(
                                color: Color(0xFFA594F9), // Light purple active text
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


class homeui extends StatefulWidget {
  const homeui({super.key});

  @override
  State<homeui> createState() => _homeuiState();
}

class _homeuiState extends State<homeui> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Center(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 60,
              // color: Colors.white70,


              child: Column(
                children: [
                  SizedBox(height: 25,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      CircleAvatar(
                        radius:16,
                        backgroundColor: Color(0xFFA594F9),
                        child: CircleAvatar(
                          radius: 14,
                          backgroundColor: Colors.blue,
                        ),
                      ),
                      Text("Hi,Manish!",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white70),),
                      SizedBox(width: 130,),

                      GestureDetector(
                        child: Icon(Icons.notifications_none,color:  Color(0xFFA594F9) ,),
                      ),
                      GestureDetector(
                        child: Icon(Icons.auto_graph_outlined,color:  Color(0xFFA594F9) ,),
                      ),



                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8,top: 5),
              child: Container(
                width: double.infinity,
                height: 195,
                decoration: BoxDecoration(
                  color: Colors.white10, // Note: Color must be inside BoxDecoration when using decoration

                  borderRadius: BorderRadius.circular(40.0), // Adjust the double value for more/less curve
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white30, // Note: Color must be inside BoxDecoration when using decoration

                          borderRadius: BorderRadius.circular(40.0), // Adjust the double value for more/less curve
                        ),
                        child:Column(
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.end,

                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 20,top: 8),
                                  child: GestureDetector(
                                    child: Icon(Icons.remove_red_eye_outlined),
                                  ),
                                )
                              ],
                            ),
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("₹3,500",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white60,fontSize: 40),),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 95,
                            height: 60,
                            decoration: BoxDecoration(
                              // color: Colors.white30, // Note: Color must be inside BoxDecoration when using decoration

                              borderRadius: BorderRadius.circular(40.0),

                              border: Border.all(
                                color: Colors.white30, // Border color
                                width: 2.0,         // Border width
                                style: BorderStyle.solid,
                              ),// Adjust the double value for more/less curve
                            ),
                            child:Column(mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [



                                Text("Pocket M",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white60,fontSize: 15),),
                                Text("₹500",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white60,fontSize: 20),),
                              ],
                            ),
                          ),
                          Container(
                            width: 95,
                            height: 60,
                            decoration: BoxDecoration(
                              // color: Colors.white30, // Note: Color must be inside BoxDecoration when using decoration

                              borderRadius: BorderRadius.circular(40.0),

                              border: Border.all(
                                color: Colors.white30, // Border color
                                width: 2.0,         // Border width
                                style: BorderStyle.solid,
                              ),// Adjust the double value for more/less curve
                            ),
                            child:Column(mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [



                                Text("Spent",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white60,fontSize: 15),),
                                Text("₹1000",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white60,fontSize: 20),),
                              ],
                            ),
                          ),
                          Container(
                            width: 95,
                            height: 60,
                            decoration: BoxDecoration(
                              // color: Colors.white30, // Note: Color must be inside BoxDecoration when using decoration

                              borderRadius: BorderRadius.circular(40.0),

                              border: Border.all(
                                color: Colors.white30, // Border color
                                width: 2.0,         // Border width
                                style: BorderStyle.solid,
                              ),// Adjust the double value for more/less curve
                            ),
                            child:Column(mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [



                                Text("Saved",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white60,fontSize: 15),),
                                Text("₹1500",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white60,fontSize: 20),),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),

                  ]
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left:20,right: 20,top: 10),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Latest Transactions",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white60,fontSize: 15),),
                  SizedBox(width: 130,),
                  GestureDetector(
                    child:  Text("See All",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white38),),

                  )

                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
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
              padding: const EdgeInsets.only(left:20,right: 20,bottom: 5),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Daily Limit",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white60,fontSize: 15),),
                  SizedBox(width: 130,),
                  GestureDetector(
                    child:  Text("",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white38),),

                  )

                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 8,right: 8),
              child: Container(
                  width: double.infinity,
                  height: 75,
                  decoration: BoxDecoration(
                    color: Colors.white10, // Note: Color must be inside BoxDecoration when using decoration

                    borderRadius: BorderRadius.circular(20.0), // Adjust the double value for more/less curve
                  ),
                  child:  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
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
                            SizedBox(width: 200,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: LinearProgressIndicator(
                                  value: 0.6,
                                  backgroundColor: Colors.white12,
                                  color: Colors.white30,
                                  minHeight: 8.0,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        height: 40,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Colors.white12, // Note: Color must be inside BoxDecoration when using decoration

                          borderRadius: BorderRadius.circular(20), // Adjust the double value for more/less curve
                        ),
                        child: Center(child: Text("₹50",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white60,fontSize: 20),)),





                      ),

                    ],
                  )
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left:20,right: 20,top: 10),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Quick Action",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white60,fontSize: 15),),
                  SizedBox(width: 130,),
                  GestureDetector(
                    child:  Text("",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white38),),

                  )

                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10,top: 5),
                  child: Container(
                    width: 165,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white10, // Note: Color must be inside BoxDecoration when using decoration

                      borderRadius: BorderRadius.circular(20.0), // Adjust the double value for more/less curve
                    ),
                    child: CustomContainericon(icon: Icon(Icons.add,color: Colors.white70,), t1: "Add", t2: "Money",)
                  ),

                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10,top: 5),
                  child: Container(
                    width: 165,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white10, // Note: Color must be inside BoxDecoration when using decoration

                      borderRadius: BorderRadius.circular(20.0), // Adjust the double value for more/less curve
                    ),
                    child:CustomContainericon(icon: Icon(Icons.attach_money,color: Colors.white70,), t1: "Add", t2: "Expance",),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10,top: 10),
                  child: Container(
                    width: 165,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white10, // Note: Color must be inside BoxDecoration when using decoration

                      borderRadius: BorderRadius.circular(20.0), // Adjust the double value for more/less curve
                    ),
                    child: CustomContainericon(icon: Icon(Icons.currency_exchange,color: Colors.white70,), t1: "Transfer", t2: "Money",),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10,top: 10),
                  child: Container(
                    width: 165,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white10, // Note: Color must be inside BoxDecoration when using decoration

                      borderRadius: BorderRadius.circular(20.0), // Adjust the double value for more/less curve
                    ),
                    child: CustomContainericon(icon: Icon(Icons.flag_outlined,color: Colors.white70,), t1: "Add", t2: "Goal",),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
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
              height: 50,
              width: 50,
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
        SizedBox(width: 5,),
      ],
    );
  }
}
