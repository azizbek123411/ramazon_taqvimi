import 'package:flutter/material.dart';
import 'package:ramazon_taqvimi/src/repository/service/api_service.dart';

class ApiPage extends StatefulWidget {
  const ApiPage({super.key});

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: ApiService.getTimes(
          city: "Tashkent",
          month: 4,
          country: 'Uzbekistan',
          year: 2024,
        ),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final day = snapshot.data![index];
                  if (snapshot.data!.isEmpty) {
                    return const Text(
                      "List bo'sh",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.all(50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          day.data.toString(),
                          style: const TextStyle(
                              color: Colors.black, fontSize: 30),
                        ),
                        const Text(
                          "",
                          style:  TextStyle(
                              color: Colors.black, fontSize: 15),
                        ),
                      ],
                    ),
                  );
                });
          }
        },
      ),
    );
  }
}
