import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String? name, email, password, mobileNumber;
  ImageProvider? userImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Text('Create Account',
                  style: Theme.of(context).textTheme.displayLarge),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => setState(() => userImage = const NetworkImage(
                    "https://img.freepik.com/free-psd/3d-rendering-avatar_23-2150833546.jpg")),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: userImage ??
                      const NetworkImage('assets/images/placeholder_image.png'),
                  backgroundColor: Colors.grey[300],
                ),
              ),
              const SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    _buildTextFormField(
                        'Full Name', Icons.person, (value) => name = value),
                    const SizedBox(height: 16),
                    _buildTextFormField(
                        'Email', Icons.email, (value) => email = value),
                    const SizedBox(height: 16),
                    _buildTextFormField(
                        'Password', Icons.lock, (value) => password = value,
                        obscureText: true),
                    const SizedBox(height: 16),
                    _buildTextFormField('Mobile Number', Icons.phone,
                        (value) => mobileNumber = value),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          Provider.of<UserProvider>(context, listen: false)
                              .updateUser(
                            name!,
                            email!,
                            password!,
                            mobileNumber!,
                            userImage!,
                          );
                          Navigator.pushNamed(context, '/welcome');
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please fill in all fields'),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text('Register'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField(
      String label, IconData icon, FormFieldSetter<String?> onSaved,
      {bool obscureText = false}) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        prefixIcon: Icon(icon),
      ),
      obscureText: obscureText,
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $label';
        }
        return null;
      },
    );
  }
}
