import 'package:flutter/material.dart';
import 'package:http_app/models/user_model.dart';
import 'package:http_app/pages/components/info_row_widget.dart';
import 'package:http_app/services/api_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "João";
  String lastname = "Pedro";
  String email = "joao@random.com";
  String image = "https://randomuser.me/api/portraits/thumb/men/5.jpg";
  RandomUser? data;

  void handleGetRandomUser() async {
    final response = await fetchData();

    setState(() => data = response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HTTP Example')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              data != null
                  ? CircleAvatar(
                      radius: 100,
                      backgroundImage:
                          NetworkImage(data!.results[0].picture.thumbnail),
                    )
                  : const CircleAvatar(
                      radius: 100,
                      child: Icon(
                        Icons.person,
                        size: 100,
                      ),
                    ),
              const SizedBox(
                height: 30,
              ),
              data != null
                  ? Column(
                      children: [
                        InfoRow(
                          data: data!,
                          name: data!.results[0].name.first,
                          lastname: data!.results[0].name.last,
                        ),
                        InfoRow(
                          data: data!,
                          name: data!.results[0].email,
                          lastname: data!.results[0].name.last,
                        ),
                        InfoRow(
                          data: data!,
                          name: data!.results[0].name.first,
                          lastname: data!.results[0].name.last,
                        ),
                      ],
                    )
                  : const Row(
                      children: [],
                    ),
              const SizedBox(height: 40),
              Center(
                child: ElevatedButton(
                  onPressed: handleGetRandomUser,
                  child: const Text('Get Data'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
