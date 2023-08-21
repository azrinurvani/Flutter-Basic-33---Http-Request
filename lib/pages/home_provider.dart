import 'package:flutter/material.dart';
import 'package:flutter_basic_33_http_request/models/http_provider.dart';
import 'package:provider/provider.dart';

class HomeProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //TODO 5 - Buat variable untuk data provider
    final dataProvider = Provider.of<HttpProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("POST - PROVIDER"),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              //TODO 7 - Gunakan Consumer buat panggil data yang telah di POST
              child: Consumer<HttpProvider>(
                builder: (context, value, child) {
                  return Text(
                    (value.data["id"] == null)
                        ? "Belum ada data"
                        : "ID : ${value.data["id"]}",
                    style: const TextStyle(fontSize: 20),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const FittedBox(
              child: Text(
                "Name : ",
                style: TextStyle(fontSize: 20),
              ),
            ),
            FittedBox(
              child: Consumer<HttpProvider>(
                builder: (context, value, child) {
                  return Text(
                    (value.data["name"] == null)
                        ? "Belum ada data"
                        : "${value.data["name"]}",
                    style: const TextStyle(fontSize: 20),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const FittedBox(
              child: Text(
                "Job : ",
                style: TextStyle(fontSize: 20),
              ),
            ),
            FittedBox(
              child: Consumer<HttpProvider>(
                builder: (context, value, child) {
                  return Text(
                    (value.data["job"] == null)
                        ? "Belum ada data"
                        : "${value.data["job"]}",
                    style: const TextStyle(fontSize: 20),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const FittedBox(
              child: Text(
                "Created At : ",
                style: TextStyle(fontSize: 20),
              ),
            ),
            FittedBox(
              child: Consumer<HttpProvider>(
                builder: (context, value, child) {
                  return Text(
                    (value.data["createdAt"] == null)
                        ? "Belum ada data"
                        : "${value.data["createdAt"]}",
                    style: const TextStyle(fontSize: 20),
                  );
                },
              ),
            ),
            const SizedBox(height: 100),
            OutlinedButton(
              onPressed: () {
                //TODO 6 - Panggil method connectAPI untuk action POST DATA ke server
                dataProvider.connectAPI("Jhonny Sins", "Doctor");
              },
              child: const Text(
                "POST DATA",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
