import 'package:flutter/material.dart';



class BottomSheetExample extends StatelessWidget {
  const BottomSheetExample({super.key});

  // Function to show the bottom sheet
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      // Shape to round top corners
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min, // Hug content height
            children: [
              const Text(
                'Bottom Sheet Title',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text('This is the content inside the bottom sheet.'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context), // Close the sheet
                child: const Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }



















  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bottom Sheet Demo')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showBottomSheet(context),
          child: const Text('Open Bottom Sheet'),
        ),
      ),
    );
  }
}

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: const Color(0xFF1E1E1E),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(24),
      ),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choose an option',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 20),

            ListTile(
              leading: const Icon(
                Icons.edit,
                color: Colors.white,
              ),
              title: const Text(
                'Edit',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {},
            ),

            ListTile(
              leading: const Icon(
                Icons.delete_outline,
                color: Colors.white,
              ),
              title: const Text(
                'Delete',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {},
            ),

            const SizedBox(height: 10),
          ],
        ),
      );
    },
  );
}
