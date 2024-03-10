import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "OnQizzPlat",
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: RegisterPage(),
    );
  }
}

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  double _imageHeight = 120.0;
  double _imageRotation = 0.0;
  bool _isPasswordHidden = true; // Added to track password visibility

  @override
  void initState() {
    super.initState();
    _animateImage();
  }

  void _animateImage() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _imageHeight = 150.0; // Increase the image size
        _imageRotation = 5.0; // Rotate the image slightly
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.purple,
            Colors.yellow,
            Colors.orange,
            Colors.green,
            Colors.blue,
            Colors.red,
            Colors.white,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _page(),
      ),
    );
  }

  Widget _page() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _animatedIcon(),
            const SizedBox(height: 50),
            _inputField("Enter Name", nameController),
            const SizedBox(height: 20),
            _inputField("Enter valid Email", emailController),
            const SizedBox(height: 20),
            _inputField("Enter Password", passwordController, isPassword: true),
            const SizedBox(height: 20),
            _inputField("Confirm Password", confirmPasswordController, isPassword: true),
            const SizedBox(height: 20),
            _inputField("Enter MobileNo.", mobileController),
            const SizedBox(height: 20),
            _registerBtn(),
            _extraText(),
          ],
        ),
      ),
    );
  }

  Widget _animatedIcon() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeOutQuad,
      height: _imageHeight,
      transform: Matrix4.rotationZ(_imageRotation),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.child_care, color: Colors.white, size: 120),
    );
  }

  Widget _inputField(String hintText, TextEditingController controller,
      {bool isPassword = false}) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: const BorderSide(color: Colors.white),
    );

    return TextField(
      style: const TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: border,
        focusedBorder: border,
        suffixIcon: isPassword
            ? IconButton(
          onPressed: () {
            setState(() {
              _isPasswordHidden = !_isPasswordHidden;
            });
          },
          icon: Icon(
            _isPasswordHidden
                ? Icons.visibility_off
                : Icons.visibility,
            color: Colors.white,
          ),
        )
            : null,
      ),
      obscureText: isPassword && _isPasswordHidden,
    );
  }

  Widget _registerBtn() {
    return ElevatedButton(
      onPressed: () {
        debugPrint("Name: " + nameController.text);
        debugPrint("Email : " + emailController.text);
        debugPrint("Password : " + passwordController.text);
        debugPrint("Confirm Password : " + confirmPasswordController.text);
        debugPrint("Mobile Number : " + mobileController.text);
      },
      child: const SizedBox(
        width: double.infinity,
        child: Text(
          "Register",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        primary: const Color.fromARGB(255, 228, 266, 226),
        onPrimary: Colors.blue,
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }

  Widget _extraText() {
    return const Text(
      "Can't access your account?",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 16, color: Colors.white),
    );
  }
}
