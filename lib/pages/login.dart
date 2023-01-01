import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:provider/provider.dart';
import 'package:task1/provider/login_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
      TextEditingController nameController = TextEditingController();
      TextEditingController passwordController = TextEditingController();
        bool _obscureText = true;
        void _toggle() {
          setState(() {
            _obscureText = !_obscureText;
          });
        }
        
    final loginProvider = Provider.of<Login_Provider>(context);    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20),
          child: Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 100.00,
                height: 100.00,
                decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: ExactAssetImage('assets/logo.jpeg'),           
                    ),
                    )
                    ),
            SizedBox(height: 20,),        
            Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  
                  decoration: const InputDecoration(
                    fillColor: Color(0xffF4F4F4),
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color:Color(0xffF4F4F4) )
                    ),
                    hintText: "User name"
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child:  PasswordField(
                  color: Colors.blue,
                  inputDecoration: PasswordDecoration(
                  ),
                  backgroundColor:Color(0xffF4F4F4),
                  
                  controller: passwordController,
                  errorMessage:
                      null,
                  passwordConstraint: r'[a-z|A-Z|\.|\_]*',
                  border: PasswordBorder(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Color(0xffF4F4F4)),                     
                    ),                                    
                  ),
                ), 
              ), 
              SizedBox(height: 20,),            
              Container(
                height: 50,
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffAF0917),
                      shape: RoundedRectangleBorder(                       
                        borderRadius: BorderRadius.circular(20), // <-- Radius
                      ),
                    ),
                  child: const Text('Login'),
                  onPressed: () {
                    loginProvider.login(nameController.text,passwordController.text,context);              
                  },
                )
            ),       
          ],
      ),
    ),
        ),
      ),
    );
  }
}


