import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:flutter_contact/data/contact.dart';

class ContactsListPage extends StatefulWidget {
  const ContactsListPage({Key? key}) : super(key: key);

  @override
  State<ContactsListPage> createState() => _ContactsListPageState();
}

class _ContactsListPageState extends State<ContactsListPage> {
  late List<Contact> _contacts;

  @override
  void initState() {
    _contacts = List.generate(50, (index) {
      final fakePerson = faker.person;
      return Contact(
        name: '${fakePerson.firstName()} ${fakePerson.lastName()}',
        email: faker.internet.freeEmail(),
        phoneNumber: faker.randomGenerator.integer(10000000).toString(),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: ListView.builder(
        itemCount: _contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_contacts[index].name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_contacts[index].email),
                const SizedBox(height: 4),
                Text(_contacts[index].phoneNumber),
              ],
            ),
            trailing: IconButton(
              icon: Icon(
                _contacts[index].isFavorite ? Icons.star : Icons.star_border,
                color: _contacts[index].isFavorite ? Colors.amber : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _contacts[index].isFavorite = !_contacts[index].isFavorite;
                  _contacts.sort(((a, b) {
                    if (a.isFavorite) {
                      return -1;
                    } else if (b.isFavorite) {
                      return 1;
                    } else {
                      return 0;
                    }
                  }));
                });
              },
            ),
          );
        },
      ),
    );
  }
}
