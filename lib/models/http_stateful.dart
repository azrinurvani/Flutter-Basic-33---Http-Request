import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//TODO 1 - Buat Models HttpSateFul
class HttpStateful {
  final String? id, name, job, createdAt;

  HttpStateful({
    @required this.id,
    @required this.name,
    @required this.job,
    @required this.createdAt,
  });

  //Method dibikin static agar bisa langsung dipanggil
  //Tipe dari method Future agar bisa menggunakan method then() setelah memanggil method connectAPI
  //example ada pada home_statefull.dart pada button POST DATA
  static Future<HttpStateful> connectAPI(String name, String job) async {
    Uri url = Uri.parse("https://reqres.in/api/users");

    var hasilResponse = await http.post(
      url,
      body: {
        "name": name,
        "job": job,
      },
    );

    var data = json.decode(hasilResponse.body);

    return HttpStateful(
      id: data["id"],
      name: data["name"],
      job: data["job"],
      createdAt: data["createdAt"],
    );
  }
}
