import 'package:expanse_tracker/core/constants/colors.dart';
import 'package:expanse_tracker/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SignupScreen extends StatefulWidget {
  static const String routeName = "SignUp_Screen";

  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final isHide = ValueNotifier<bool>(true);
  final isCheck = ValueNotifier<bool>(false);

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void signUp(BuildContext context) {
    try {
      AuthService().signUp(nameController.text, emailController.text,
          passwordController.text, context);
    } catch (error) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Error"),
            content: Text("$error\n${error.toString()}"),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Text(
              'EXPENDI',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Fill your information below or register with your social account',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                prefixIcon: Icon(Iconsax.user),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ValueListenableBuilder<bool>(
              valueListenable: isHide,
              builder: (context, value, child) {
                return TextFormField(
                  controller: passwordController,
                  cursorColor: MyColors.primary,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: value,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                      onPressed: () => isHide.value = !isHide.value,
                      icon: Icon(value ? Iconsax.eye_slash : Iconsax.eye),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            Row(
              children: [
                ValueListenableBuilder<bool>(
                  valueListenable: isCheck,
                  builder: (context, value, child) {
                    return Checkbox(
                      value: isCheck.value,
                      onChanged: (value) => isCheck.value = value!,
                    );
                  },
                ),
                const Text("I agree to the "),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "Terms and Conditions",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: MyColors.primary,
                        ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: () => signUp(context),
                child: Text(
                  'Create Account',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 20),
            const Text("__________    OR    __________"),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                // onPressed: () => AuthService().signInWithGoogle(context),
                onPressed: () {},
                label: Text("Sign Up with Google"),
                icon: Image.asset('assets/images/google.png', width: 20),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?'),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Sign In'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
