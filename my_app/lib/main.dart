// ignore_for_file: unnecessary_null_comparison

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
final controller = TextEditingController();
bool isButtonActive = false;
//bool onPressed = true;
bool submit = false;
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
            Colors.blue.shade400,
            Colors.blue.shade300,
            Colors.blue.shade200,
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
  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();

  //late TextEditingController controller;
  final myController = TextEditingController();
  @override
  void initState() {
    super.initState();
    myController.addListener(() {
      setState(() {
        submit = myController.text.isNotEmpty;
      });
    });
  }

  Widget build(BuildContext context) {
    return Form(
      onChanged: () =>
          setState(() => isButtonActive = _formKey.currentState!.validate()),
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Text(
          //   'Username',
          //   textAlign: TextAlign.justify,
          //   style: TextStyle(color: Color.fromARGB(255, 192, 189, 215)),
          // ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.grey.shade200))),
            child: TextFormField(
              controller: userName,
              decoration: InputDecoration(
                labelText: 'Username',
                hintText: "Enter your Username",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
              autovalidateMode: AutovalidateMode.always,

              //  print(value);
              //  print('validator');
              validator: (value) => value!.length < 10
                  ? 'Number must be at least 10 digits'
                  : // return an error message
                  null,
            ),
          ),

          // Text(
          //   'Password',
          //   style: TextStyle(color: Color.fromARGB(255, 192, 189, 215)),
          // ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.grey.shade200))),
            child: TextFormField(
              obscureText: _isObscure,
              controller: passWord,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: "Enter your Password",
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                  icon: Icon(
                    // Based on passwordVisible state choose the icon
                    _isObscure ? Icons.visibility : Icons.visibility_off,
                    color: Theme.of(context).primaryColorDark,
                  ),
                ),
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

var con = userName != null && passWord != null;

class Button extends StatefulWidget {
  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  get yourCallback => null;

  // bool isButtonActive = true;
  // bool isEmpty(String string) => string.isEmpty;
  // bool isActive() {
  //   if (isEmpty(userName.text) == true && isEmpty(passWord.text) == true) {
  //     //  isInactive();
  //     // return isButtonActive = false;
  //     return isButtonActive = false;
  //   } else {
  //     return isButtonActive = true;
  //   }
  // }

  // bool isInactive() {
  //   return isButtonActive = false;
  // }

  @override
  // ignore: curly_braces_in_flow_control_structures
  Widget build(BuildContext context) {
    // isEmpty == true;
    print('calling built');
    // if
    //     // ignore: curly_braces_in_flow_control_structures
    //     (isEmpty(userName.text) == true && isEmpty(passWord.text) == true) {
    //   isInactive();
    //   //isButtonActive = false;
    //   // print(isButtonActive);
    //   // print(!isEmpty(userName.text));
    //   //  print(passWord.text);
    //   //return isButtonActive;
    // }
    // isActive();
    // // print(isButtonActive);
    // if (isEmpty(userName.text) == false && isEmpty(passWord.text) == false) {
    //   // print(passWord.text);

    //   // isButtonActive = true;
    //   isActive();
    // }

    // } else {
    //   isButtonActive = false;
    // }
    return Column(
      children: [
//         // ignore: deprecated_member_use
// if(userName.text==null && passWord.text==null ){
//     isButtonActive= false;
// }else{
//   isButtonActive = true;
// },
        ElevatedButton.icon(
          // onPressed: isButtonActive == true ? yourCallback : null,
          style: ElevatedButton.styleFrom(
            onSurface: Colors.blue,
          ),
          icon: Icon(
            Icons.login,
            size: 18,
          ),
          label: Text('Login'),
          onPressed: isButtonActive ? () => Login : null,
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

// show the dialog
// Future<void> showMyDialog(data) async {
//   var context;
//   return showDialog<void>(
//     context: context,
//     barrierDismissible: false, // user must tap button!
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: const Text('AlertDialog Title'),
//         content: SingleChildScrollView(
//           child: ListBody(
//             children: const <Widget>[
//               Text('This is a demo alert dialog.'),
//               Text('Would you like to approve of this message?'),
//             ],
//           ),
//         ),
//         actions: <Widget>[
//           TextButton(
//             child: const Text('Approve'),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       );
//     },
//   );
// }

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

    // print('sbdjskcjsdncjsndkjcnskdc ');
    print(response);
    // print(response('userName'));
    return response;

    // if (response.data['userName'] != ' $userName') {
    //   AlertDialog(actions: [
    //     Text('Username not match'),
    //   ]);
    // }

    // if (response.data['passWord'] != ' $passWord') {
    //   AlertDialog(actions: [
    //     Text('PassWord not match'),
    //   ]);
    // }

    // if (response.data['userName'] == '$userName' &&
    //     response.data['passWord'] == '$passWord') {
    //   AlertDialog(actions: [
    //     Text('Success'),
    //   ]);
    // }
  } on DioError catch (e) {
    // var context;

    //print(showAlertDialog(e.response!.data));
    //returns the error object if any
    print('adxjdixid');

    // AlertDialog(actions: [
    //   Text(
    //     e.response!.data['message'],
    //   ),
    // ]);
    print(e.response!.data['message']);
    return e.response!.data['message'];
  }
}
