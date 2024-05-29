import 'package:flutter/material.dart';
import 'package:http_app/models/user_model.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({
    super.key,
    required this.data,
    required this.name,
    required this.lastname,
  });

  final RandomUser? data;
  final String name;
  final String lastname;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          width: double.infinity,
          height: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              data != null
                  ? Text(
                      '${data!.results[0].name.first} ${data!.results[0].name.last}')
                  : Text("$name $lastname"),
              const SizedBox(width: 10),
            ],
          )),
    );
  }
}
