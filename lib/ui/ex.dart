import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';

class CustomStepperPage extends StatefulWidget {
  const CustomStepperPage({super.key});

  @override
  State<CustomStepperPage> createState() => _CustomStepperPageState();
}

class _CustomStepperPageState extends State<CustomStepperPage> {
  int activeStep = 0;

  // Define unique widgets/containers for each step
  final List<Widget> stepViews = [
    // Step 1: Account Info Widget
    Container(
      key: const ValueKey(0),
      width: double.infinity,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.blue.shade200),
      ),
      child: Column(
        children: [
          TextField(
            // Sets the style of the text the user types
            style: const TextStyle(
              fontSize: 32.0,                  // Large font size matching the image
              fontWeight: FontWeight.bold,     // Bold styling
              color: Colors.white,             // Adjust color to contrast with your background
            ),
            keyboardType: TextInputType.number, // Forces numeric keyboard for currency
            decoration: InputDecoration(
              // Places a non-editable Rupee symbol right before the input text
              prefixText: '₹ ',
              prefixStyle: const TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              hintText: '0',                   // Placeholder when empty
              hintStyle: const TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: Colors.white60,         // Slightly faded out zero hint
              ),
              border: InputBorder.none,        // Removes the default underline/box border
              contentPadding: EdgeInsets.zero, // Removes default inner padding
            ),
          )


        ],
      ),
    ),

    // Step 2: Address Info Widget
    Container(
      key: const ValueKey(1),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.green.shade200),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.home, size: 48, color: Colors.green),
          SizedBox(height: 12),
          Text(
            'Shipping Address',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              labelText: 'Street Address',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ],
      ),
    ),

    // Step 3: Payment Widget
    Container(
      key: const ValueKey(2),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.orange.shade200),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.payment, size: 48, color: Colors.orange),
          SizedBox(height: 12),
          Text(
            'Payment Details',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              labelText: 'Card Number',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ],
      ),
    ),

    // Step 4: Confirmation Widget
    Container(
      key: const ValueKey(3),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.purple.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.purple.shade200),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.check_circle, size: 48, color: Colors.purple),
          SizedBox(height: 12),
          Text(
            'Review & Confirm',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Text(
            'Please verify all details before submitting.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black54),
          ),
        ],
      ),
    ),
  ];

  final List<String> stepTitles = [
    'Add money',
    'Category',
    'Payment',
    'More',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       // backgroundColor: const Color(0xFF1E1E1E),
      backgroundColor: Colors.black12,

      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0,bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton.icon(
                    onPressed: activeStep > 0
                        ? () => setState(() => activeStep--)
                        : null,
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Previous'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      if (activeStep < stepViews.length - 1) {
                        setState(() => activeStep++);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Form Submitted Successfully!'),
                          ),
                        );
                      }
                    },
                    icon: Icon(
                      activeStep == stepViews.length - 1
                          ? Icons.check
                          : Icons.arrow_forward,
                    ),
                    label: Text(
                      activeStep == stepViews.length - 1 ? 'Finish' : 'Next',
                    ),
                  ),
                ],
              ),
            ),



            EasyStepper(
              activeStep: activeStep,
              lineStyle: LineStyle(
                lineType: LineType.normal,
                lineThickness: 3,
                lineLength: 40,
                activeLineColor: Colors.purple,
                finishedLineColor: Colors.purple,
                unreachedLineColor: Colors.grey.shade300,
              ),
              stepRadius: 15,
              showLoadingAnimation: false,
              onStepReached: (index) {
                setState(() {
                  activeStep = index;
                });
              },
              steps: List.generate(
                stepViews.length,
                    (index) => EasyStep(
                  customStep: CircleAvatar(
                    radius: 20,
                    backgroundColor: activeStep >= index
                        ? Colors.purple
                        : Colors.grey.shade300,
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                        color: activeStep >= index
                            ? Colors.white
                            : Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  title: stepTitles[index],
                ),
              ),
            ),

            const SizedBox(height: 5),

            // --- Active Step Custom Container ---
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: stepViews[activeStep],
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }
}








