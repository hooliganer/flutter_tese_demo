import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool showPwd = false;


  @override
  Widget build(BuildContext context) {

    final TapGestureRecognizer tapGesture = TapGestureRecognizer();

    void toRegister() {
      Navigator.pushReplacementNamed(context, 'register');
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("登录"),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(30),
        child: ListView(

          children: [

            const TextField(
              decoration: InputDecoration(
                labelText: "用户名",
                hintText: "请输入用户名",
              ),
            ),

            const Padding(padding: EdgeInsets.all(10)),

            TextField(
              obscureText: !showPwd,
              decoration: InputDecoration(
                labelText: "密码",
                hintText: "请输入密码",
                suffixIcon: IconButton(icon: Icon(showPwd ? Icons.visibility_off : Icons.visibility),onPressed: () {
                  setState(() {
                    showPwd = !showPwd;
                  });
                },),
              ),
            ),

            const Padding(padding: EdgeInsets.all(10)),

            Container(
              alignment: Alignment.center,
              child: Text.rich(TextSpan(
                children: [
                  const TextSpan(text: "还没有账号"),
                  TextSpan(
                      text: "去注册",
                      style: const TextStyle(color: Colors.blue),
                      recognizer: tapGesture
                        ..onTap = () {
                          toRegister();
                        }),
                ],
              )),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('没有账号？'),
                TextButton(onPressed: () {
                  toRegister();
                }, child: const Text('去注册')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

