import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

import 'SecondRoute.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

var userName = TextEditingController();
var passWord = TextEditingController();
final Dio _dio = Dio();

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // var userName = TextEditingController();
  //var passWord = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Colors.cyan.shade400,
            Colors.cyan.shade300,
            Colors.cyan.shade200,
          ]),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Header(),
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  )),
              child: const InputWrapper(),
            ))
          ],
        ),
      ),
    );
  }
}

class InputField extends StatefulWidget {
  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  // var userName = TextEditingController();
  // var passWord = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.grey.shade200))),
            child: TextField(
              controller: userName,
              decoration: InputDecoration(
                hintText: "Enter your Username",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.grey.shade200))),
            child: TextField(
              controller: passWord,
              decoration: InputDecoration(
                hintText: "Enter your Password",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Center(
            child: Text(
              'Login',
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "Welcome",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}

class InputWrapper extends StatefulWidget {
  const InputWrapper({Key? key}) : super(key: key);

  @override
  State<InputWrapper> createState() => _InputWrapperState();
}

class _InputWrapperState extends State<InputWrapper> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            const SizedBox(),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: InputField(),
            ),
            const SizedBox(),
            Button(),
          ],
        ),
      ),
    );
  }
}

class Button extends StatefulWidget {
  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ignore: deprecated_member_use
        OutlinedButton.icon(
          onPressed: () {
            Login();
          },
          icon: Icon(
            Icons.login,
            size: 18,
          ),
          label: Text('Login'),
        ),
      ],
    );
  }
}

// Future<void> Login() async {
//  print('userName' + userName.text);
//   print('passWord' + passWord.text);
//   if (passWord.text.isNotEmpty && userName.text.isNotEmpty) {
//     var response = await http.post(
//       Uri.parse("103.104.29.53:8094/rms/api/staff/login"),
//       body: ({'userName': userName.text, 'passWord': passWord.text}),
//     );
//     print(response.toString());
//   } else {
//     print('else' + userName.text);

//     // ScaffoldMessenger.of(context)
//     //     .showSnackBar(SnackBar(content: Text('Black Field Not Allowed')));
//   }
//}

Future Login() async {
  try {
    print('userName' + userName.text);
    print('passWord' + passWord.text);
    Response response = await _dio.post(
      'http://103.104.29.53:8094/rms/api/staff/login',
      data: {'userName': userName.text, 'passWord': passWord.text},
      // queryParameters: {'apikey': 'YOUR_API_KEY'},
      options: Options(
        headers: {
          'userAgent': 'flutter',
        },
      ),
    );
    print('sbdjskcjsdncjsndkjcnskdc ');
    print(response);
    return response;
    var context;
    if (response.statusCode == 200) {
      MaterialPageRoute(builder: (context) => SecondRoute());
    } else if (response.statusCode == 401) {
      return Text('Invalid credentials');
    } else {
      throw Exception('An unknown error occurred');
    }
    //returns the successful user data json object
    print('sdcsdsdcsdsxas ' + response.data);
    return response.data;
  } on DioError catch (e) {
    //returns the error object if any
   // print('aaaaaaaaaaaaaaaaaaaaaaaaa ' + e.toString());
    return e.response!.data;
  }
}
