import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../res/component/custum_textform_field.dart';
import '../../../res/component/round_button.dart';
import '../../dashboard/screen/dashboard_screen.dart';
import '../viewmodel/login_viewmodel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginViewmodel(),
      child: const _LoginForm(),
    );
  }
}

class _LoginForm extends StatefulWidget {
  const _LoginForm();

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    _obscurePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(width * 0.05), // Responsive padding
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  SizedBox(height: height * 0.15), // Responsive spacing
                  Image.asset(
                    "assets/images/logo.png",
                    width: width * 0.4, // Adjust the width of the logo
                  ),
                  SizedBox(height: height * 0.08), // Responsive spacing
                  // Mobile Number Field
                  CustomTextFormField(
                    controller: _usernameController,
                    label: 'Mobile Number',
                    hintText: "Enter Mobile Number",
                    keyboardType: TextInputType.phone,
                    // focusNode: _usernameFocusNode,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Mobile Number is required';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: height * 0.02), // Responsive spacing
                  // Password Field
                  ValueListenableBuilder<bool>(
                    valueListenable: _obscurePassword,
                    builder: (context, value, child) {
                      return CustomTextFormField(
                        controller: _passwordController,
                        label: 'Password',
                        hintText: "Enter Password",
                        // obscureText: value,
                        suffixIcon: IconButton(
                          icon: Icon(
                            value ? Icons.visibility_off : Icons.visibility,
                          ),
                          onPressed: () {
                            _obscurePassword.value = !value;
                          },
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                          return null;
                        },
                      );
                    },
                  ),

                  SizedBox(height: height * 0.05), // Responsive spacing
                  // Login Button
                  Consumer<LoginViewmodel>(
                    builder: (context, viewModel, _) {
                      return RoundButton(
                        title: "LOGIN",
                        color: Colors.pink,
                        loading: viewModel.loading,
                        width: width * 0.6, // Responsive width
                        onPress: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            final loginData = {
                              "mobile_number": _usernameController.text,
                              "password": _passwordController.text,
                            };
                            viewModel.loginApi(loginData, context);
                          }
                        },
                      );
                    },
                  ),

                  SizedBox(height: height * 0.2), // Responsive spacing
                  // Dashboard Button (for testing purposes)
                  RoundButton(
                    title: 'Dashboard',
                    width: width * 0.4, // Responsive width
                    color: Colors.blue,
                    onPress: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => DashBoardScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
