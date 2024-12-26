import 'package:flutter/material.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});
  static const routeName = "Add_Transaction";

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  String date = 'Date';
  String account = 'Select Account';
  String category = 'Select Category';
  String notes = 'Add Note';
  String? imageUrl;

  List categories = [
    {'name': 'Clothes', 'image': 'assets/icons/clothes.png'},
    {'name': 'Food', 'image': 'assets/icons/food.png'},
    {'name': 'Gym', 'image': 'assets/icons/gym.png'},
    {'name': 'Loan', 'image': 'assets/icons/loan.png'},
    {'name': 'Pet', 'image': 'assets/icons/pet.png'},
    {'name': 'Shopping', 'image': 'assets/icons/shopping.png'},
    {'name': 'Travel', 'image': 'assets/icons/travel.png'},
  ];

  List<String> accounts = ['Salary', 'Side Hustling', 'Extra'];

  Future<void> _selectDateTime() async {
    // Step 1: Show Date Picker
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      // Step 2: Show Time Picker
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        // Combine Date and Time
        final DateTime combinedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        setState(() {
          // Format to show "Today, 10:34"
          date = _formatDateTime(combinedDateTime);
        });
      }
    }
  }

  String _formatDateTime(DateTime dateTime) {
    final DateTime now = DateTime.now();
    final bool isToday = dateTime.day == now.day &&
        dateTime.month == now.month &&
        dateTime.year == now.year;

    final String time =
        "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";

    if (isToday) {
      return "Today, $time";
    } else {
      final String formattedDate =
          "${dateTime.day}-${dateTime.month}-${dateTime.year}";
      return "$formattedDate, $time";
    }
  }

  void amoutBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          child: ListView.builder(
            itemCount: accounts.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(accounts[index]),
                onTap: () {
                  account = accounts[index];
                  Navigator.pop(context);
                  setState(() {});
                },
              );
            },
          ),
        );
      },
    );
  }

  void shoppingBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Wrap(
            runSpacing: 20,
            spacing: 20,
            children: categories
                .map(
                  (item) => GestureDetector(
                    onTap: () {
                      category = item['name'];
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(item['image']),
                        ),
                        Text(item['name']),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }

  // Future<void> _pickImage() async {
  //   final ImagePicker picker = ImagePicker();
  //   final XFile? pickedImage = await picker.pickImage(source: ImageSource.camera);
  //   if (pickedImage != null) {
  //     setState(() {
  //       imageUrl = pickedImage.path;
  //     });
  //   }
  // }

  // void _navigateToNotes() async {
  //   final result = await Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => NotesPage(initialNotes: notes)),
  //   );
  //   if (result != null && result is String) {
  //     setState(() {
  //       notes = result;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Budget'),
        actions: [
          TextButton(
            child: Text("Save"),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2.0),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.grey.shade300, width: 1.0),
                ),

                prefixText: "Amount",
                prefixStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                // border: OutlineInputBorder(
                //   borderSide: BorderSide(),
                // ),
              ),
            ),
          ),
          ListTile(
            title: Text(date),
            trailing: Icon(Icons.arrow_forward_ios, size: 15),
            leading: const Icon(Icons.calendar_today),
            onTap: _selectDateTime,
          ),
          ListTile(
              title: Text(account),
              leading: const Icon(Icons.account_balance),
              trailing: Icon(Icons.arrow_forward_ios, size: 15),
              onTap: amoutBottomSheet),
          ListTile(
            title: Text(category),
            trailing: Icon(Icons.arrow_forward_ios, size: 15),
            leading: const Icon(Icons.category),
            onTap: shoppingBottomSheet,
          ),
          ListTile(
            title: Text(notes),
            leading: const Icon(Icons.notes),
            trailing: Icon(Icons.arrow_forward_ios, size: 15),
            // onTap: _navigateToNotes,
          ),
          ListTile(
            leading: Icon(Icons.date_range),
            title: Text('Add Receipt Image'),
            trailing: Icon(Icons.arrow_forward_ios, size: 15),
          ),
        ],
      ),
    );
  }
}
