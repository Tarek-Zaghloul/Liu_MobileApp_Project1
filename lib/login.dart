import 'package:flutter/material.dart';
import 'package:project1/home_page.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernameController= TextEditingController();
  TextEditingController passwordController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
          Colors.blue,
            Colors.red,
        ],
        )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _page(),
      ),
    );
  }

  Widget _page(){
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _icon(),
            const SizedBox(height: 50),
            _inputField("Username",usernameController),
            const SizedBox(height: 20),
            _inputField("Password",passwordController, isPassword: true ),
            const SizedBox(height: 50),
            _LoginBtn(),
            const SizedBox(height: 20),
            _extraText(),
          ],
        ),
      ),
    );
  }

  Widget _icon(){
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2 ),
        shape: BoxShape.circle),
      child: const Icon(Icons.person, color: Colors.white, size: 120),
    );
  }

  Widget _inputField(String hintText,TextEditingController controller,
  {isPassword = false} ){
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: const BorderSide(color: Colors.white)
    );
    return TextField(
      style: const TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: border,
        focusedBorder: border,
      ),
      obscureText: isPassword,
    );
  }

  Widget _LoginBtn(){
    return ElevatedButton(
        onPressed: (){
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context)=> const Home()));
          debugPrint("Username :"+ usernameController.text);
          debugPrint("Password :"+ passwordController.text);
        },
        child: const SizedBox(
          width: double.infinity,
            child: Text("Sign in",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
            )),
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        padding: const EdgeInsets.symmetric(vertical: 16),
      ) ,
    );
  }

  Widget  _extraText(){
    return const Text(
      "Cant access to your account?",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 16,color: Colors.white),
    );
  }

}
