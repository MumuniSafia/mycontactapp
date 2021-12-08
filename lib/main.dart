import 'package:contactapp/contact_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Contact app',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List myContacts = listofContacts;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: const Text(
          "My Contacts",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundImage: AssetImage("images/woman.jpg"),
            ),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: myContacts.length,
          itemBuilder: (BuildContext context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (index == 0)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: "Search by name or number",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ))),
                  ),
                if (index == 0)
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text("Recents", style: TextStyle(fontSize: 25)),
                  ),
                if (index == 2)
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text("Contacts",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                  ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ContactPage(
                                  myContacts: myContacts[index],
                                )));
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "${myContacts[index]["image"]}${index + 50}"),
                    ),
                    title: Text(
                      myContacts[index]["name"],
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                    subtitle: Text(myContacts[index]["name"]),
                    trailing: Icon(Icons.more_horiz),
                  ),
                ),
                const Divider(
                  height: 4,
                  color: Colors.grey,
                ),
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.add,
          size: 50,
        ),
      ),
    );
  }
}

List listofContacts = [
  {
    "name": "Mumuni Safia",
    "location": "Sombo",
    "email": "safiyatmoomin@gmail.com",
    "phone": "+233500321965",
    "group": "Mumuni family",
    "image": "https://picsum.photos/200/300?random="
  },
  {
    "name": "Seiku Hamida",
    "location": "Kpaguri",
    "email": "safiyatmoomin@gmail.com",
    "phone": "+233500477615",
    "group": "Mumuni family",
    "image": "https://picsum.photos/200/300?random="
  },
  {
    "name": "Jamil Muslim",
    "location": "Gudaayiri",
    "email": "safiyatmoomin@gmail.com",
    "phone": "+233595254880",
    "group": "Mumuni family",
    "image": "https://picsum.photos/200/300?random="
  },
  {
    "name": "Sherifdeen Nakeeyat",
    "location": "Konta",
    "email": "safiyatmoomin@gmail.com",
    "phone": "+233200514544",
    "group": "Mumuni family",
    "image": "https://picsum.photos/200/300?random="
  },
];
