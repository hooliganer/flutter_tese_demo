import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {

  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  bool showPwd = false;
  bool showAgainPwd = false;

  @override
  Widget build(BuildContext context) {

    final TapGestureRecognizer tapGesture = TapGestureRecognizer();

    void toLogin() {
      Navigator.pushReplacementNamed(context, 'login');
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("注册"),
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

            TextField(
              obscureText: !showAgainPwd,
              decoration: InputDecoration(
                labelText: "确认密码",
                hintText: "请输入密码",
                suffixIcon: IconButton(icon: Icon(showAgainPwd ? Icons.visibility_off : Icons.visibility),onPressed: () {
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
                  const TextSpan(text: "已有账号"),
                  TextSpan(
                      text: "去登录",
                      style: const TextStyle(color: Colors.blue),
                      recognizer: tapGesture
                        ..onTap = () {
                          toLogin();
                        }),
                ],
              )),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('已有账号？'),
                TextButton(onPressed: () {
                  toLogin();
                }, child: const Text('去登录')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

