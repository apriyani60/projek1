import 'package:app3/requestController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login.dart';
import 'layout.dart';

class LupaPassView extends StatefulWidget {
  const LupaPassView({Key? key}) : super(key: key);

  @override
  _LupaPassViewState createState() => _LupaPassViewState();
}

class _LupaPassViewState extends State<LupaPassView> {
  final requestController = Get.put(RequestController());
  TextEditingController tUser = TextEditingController();
  TextEditingController tPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset('assets/images/Back.png'),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 20.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
                alignment: Alignment.center,
                child: Text(
                  'Ubah Password Anda',
                  style: TextStyle(fontSize: 20),
                )),
            SizedBox(
              height: 40.0,
            ),
            TextField(
              minLines: 1,
              controller: tUser,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 3,
                    color: Colors.black,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 3,
                    color: Colors.black,
                  ),
                ),
                hintText: "masukan password baru",
              ),
              keyboardType: TextInputType.text,
            ),
            SizedBox(
              height: 20.0,
            ),
            TextButton(
              onPressed: () async {
                print('Login ${tUser.text} dan ${tPass.text}');
                await requestController.createUser(context, 'rika', '9898');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.purple,
                ),
                foregroundColor: MaterialStateProperty.all(
                  Colors.white,
                ),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 50,
                  ),
                ),
                textStyle: MaterialStateProperty.all(
                  const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              child: Text('Lupa Password'),
            ),
            SizedBox(
              height: 20.0,
            ),
            Image(image: AssetImage('assets/images/Rectangle 2.5.png')),
          ],
        ),
      ),
    );
  }
}
