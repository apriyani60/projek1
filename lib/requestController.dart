import 'package:app3/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'helperController.dart';

class RequestController extends GetxController {
  final helperController = Get.put(HelperController());

  createUser(BuildContext context, var username, var pass) async {
    return helperController.post(
        path: "api/users",
        onSuccess: (data) {
          return showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text("Login Berhasil"),
                    content: Container(
                      child: Text("Selamat Anda Berhasil login"),
                    ),
                    actions: [
                      TextButton(
                        child: Text('Ok'),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ));
          print(data);
        },
        onError: (error) {
          return showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text("Login Gagal"),
                    content: Container(
                      child:
                          Text("Periksa kembali username dan Password Anda!"),
                    ),
                    actions: [
                      TextButton(
                        child: Text('Ok'),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ));
        },
        body: {
          "username": username
          // "password": password,
        });
  }

  createRegister(BuildContext context, var email, var password) async {
    return helperController.post(
        path: '/api/register',
        onSuccess: (data) {
          return showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text("Login Berhasil"),
                    content: Container(
                      child: Text(
                          "Selamat Anda Berhasil Registrasi. Silahkan Login!"),
                    ),
                    actions: [
                      TextButton(
                        child: Text('Ok'),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ));
          print(data);
        },
        onError: (error) {
          return showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text("Registrasi gagal"),
                    content: Container(
                      child: Text(
                          "Selamat Anda Berhasil Registrasi. Silahkan Login!"),
                    ),
                    actions: [
                      TextButton(
                        child: Text('Ok'),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ));
        },
        body: {
          "email": email,
          "password": password,
        });
  }

  login(BuildContext context, var username, var pass) async {
    return helperController.post(
      path: '/api/login',
      onSuccess: (data) {
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Login Berhasil"),
            content: Container(
              child: Text(
                  "Selamat Anda Berhasil Login. Dengan Token ${data['token']}"),
            ),
            actions: [
              TextButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Get.to(HomePageView());
                  }),
            ],
          ),
        );
      },
      onError: (error) {
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Login Gagal"),
            content: Container(
              child: Text("Gagal Login"),
            ),
            actions: [
              TextButton(
                child: Text('Ok'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      },
      body: {"email": username, "password": pass},
    );
  }
}
