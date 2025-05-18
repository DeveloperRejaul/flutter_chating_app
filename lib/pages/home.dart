import 'package:flutter/material.dart';
import 'package:flutter_chatting_app/api/user.dart';
import 'package:flutter_chatting_app/modal/user.dart';
import 'package:flutter_chatting_app/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<UserModal> users = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  /// Fetches the list of users from the API and updates the state.
  /// Sets [isLoading] to true before fetching, then updates [users] with the
  ///fetched data and sets [isLoading] to false after completion.
  Future<void> getUsers() async {
    setState(() {
      isLoading = true;
    });

    List<UserModal> data = await UserApi.fetchUsers();
    setState(() {
      users = data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Flutter chatting App"),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : users.isEmpty
                ? const Text("No users found.")
                : ListView.separated(
                    padding: const EdgeInsets.only(bottom: 16.0, top: 16.0),
                    itemCount: users.length,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 8);
                    },
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return ItemWidget(name: user.name, email: user.email);
                    },
                  ),
      ),
    );
  }
}
