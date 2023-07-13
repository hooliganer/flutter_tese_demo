import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:haozuke_test/widgets/page_content.dart';

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
      Navigator.pushNamed(context, 'register');
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("登录"),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(30),
        child: ListView(

          children: [

            TextField(
              decoration: InputDecoration(
                labelText: "用户名",
                hintText: "请输入用户名",
              ),
            ),

            Padding(padding: EdgeInsets.all(10)),

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

            Padding(padding: EdgeInsets.all(10)),

            ElevatedButton(onPressed: (){

            }, child: Text("登录")),

            Text.rich(TextSpan(
              children: [
                TextSpan(text: "还没有账号"),
                TextSpan(
                    text: "去注册",
                    style: TextStyle(color: Colors.blue),
                    recognizer: tapGesture
                      ..onTap = () {
                        toRegister();
                      }),
              ],
            )),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('没有账号？'),
                TextButton(onPressed: () {
                  toRegister();
                }, child: Text('去注册')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

