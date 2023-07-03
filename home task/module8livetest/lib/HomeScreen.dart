import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}
class Contact {
  final String name;
  final String email;
  final String phoneNumber;

  Contact({
    required this.name,
    required this.email,
    required this.phoneNumber,
  });
}
void _showContactDetails(BuildContext context, Contact contact) {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Name: ${contact.name}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text('Email: ${contact.email}', style: TextStyle(fontSize: 16.0)),
            SizedBox(height: 8.0),
            Text('Phone: ${contact.phoneNumber}',
                style: TextStyle(fontSize: 16.0)),
            SizedBox(height: 16.0),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Close'),
              ),
            ),
          ],
        ),
      );
    },
  );
}


class _HomeState extends State<Home> {

  final List<Contact> contacts = [
    Contact(
      name: "John Doe",
      email: "johndoe@example.com",
      phoneNumber: "123-456-7890",
    ),
    Contact(
      name: "Jane Smith",
      email: "janesmith@example.com",
      phoneNumber: "987-654-3210",
    ),
    Contact(
      name: "Alice Johnson",
      email: "alicejohnson@example.com",
      phoneNumber: "555-123-4567",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Contact List"),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (BuildContext context, index) {
          return ListTile(
            title: Text(contacts[index].name),
            onTap: () {
              _showContactDetails(context, contacts[index]);
            },
          );
        },
      ),
    );
  }
}