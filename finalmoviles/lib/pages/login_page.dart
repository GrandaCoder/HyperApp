import 'package:finalmoviles/componentes/my_button.dart';
import 'package:finalmoviles/componentes/my_texfield.dart';
import 'package:finalmoviles/componentes/square_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{



  LoginPage ({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers


  final emailController = TextEditingController();

  final passwordController =TextEditingController();



  //sing user in method
  void singUserIn() async{

    showDialog(
      context: context,
      builder: (context){
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      );


  try{
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text, 
      password: passwordController.text,
      );
  } on FirebaseAuthException catch(e){
    if(e.code=='user-not-found'){
      print('este usuario no funciona para este email');

    }else{
      print('clave erronea');
    }
  }






      Navigator.pop(context);
  }

 @override
 Widget build(BuildContext context) {
   return Scaffold(
    backgroundColor: Colors.grey[300],
    body: SafeArea(
      child: Center(
        child: Column(
          children:[
            const SizedBox(height: 50),
            
            //logo
            const Icon(
              Icons.account_box,
              size: 100,
            ),

            const SizedBox(height: 50),

          // bienvenido de nuevo
          Text(
            'bienvenido de nuevo\ te echamos de menos',
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 16,

            ),
            ),

            const SizedBox(height: 25),

            //Email texfield
            MyTextField(
              controller: emailController,
              hindText: 'Email',
              obscureText: false,

            ),
            const SizedBox(height: 10),

            //texfield passwrd
            MyTextField(
              controller: passwordController,
              hindText: 'Password',
              obscureText: true,
            ),
            const SizedBox(height: 10),

            // forgot password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Olvidaste tu clave?',
                    style: TextStyle(color: Colors.grey[600]),
                  )
                ],
              ),
            ),

            const SizedBox(height: 25),

            //button sign
            MyButton(
              onTap: singUserIn,
            ),

            const SizedBox(height: 30),

            //continua con..
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(
                  child: Divider(
                  thickness: 0.5,
                  color: Colors.grey[400],
                  ),
                ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'O continua con',
                        style: TextStyle(color: Colors.grey[700]),),
                ),
                Expanded(
                  child: Divider(
                  thickness: 0.5,
                  color: Colors.grey[400],
                  ),
                )
                ],

              ),
              ),

              const SizedBox(height: 20),

              // google
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  //google button
                  SquareTile(imagePath: 'lib/images/google.png'),
                  SizedBox(width: 25),
                ],
              ),

              const SizedBox(height: 20),

              //not a member

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Text(
                    'No eres miembro?',
                    style: TextStyle(color: Colors.grey[700]),
                    ),

                  const SizedBox(width: 4),
                  const Text(
                    'Registrate ahora',
                    style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),

                    ),
                     ]
                  )
                ],
              ),      
      ),
    ),
  );
 }
}