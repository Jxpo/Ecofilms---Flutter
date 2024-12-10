import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  bool _showPassword = false;

  final FirebaseAuth _auth = FirebaseAuth.instance; // Instância do FirebaseAuth para autenticação
  final TextEditingController _emailController = TextEditingController(); // Controlador para o campo de e-mail
  final TextEditingController _passwordController = TextEditingController(); // Controlador para o campo de senha
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> _login() async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      _showSnackBar('E-mail ou senha não podem estar vazios', Colors.red);
      return;
    }

    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
      Navigator.pushReplacementNamed(context, '/Selecaoperfil');
    } catch (e) {
      _showSnackBar('Erro no login: $e', Colors.red);
    }
  }


  // Método para exibir uma mensagem na parte inferior da tela (SnackBar)
  void _showSnackBar(String message, Color color) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: color,
      duration: Duration(seconds: 2), // Duração de exibição do SnackBar
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<User?> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      return userCredential.user;
    } catch (e) {
      print("Erro ao fazer login: $e");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img/folhas9.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Faça seu login!",
                      style: TextStyle(
                        fontFamily: 'Antonio',
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 60),
                    TextFormField(
                      controller: _emailController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 41, 47, 54),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 48, 107, 52),
                            width: 1.6,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 48, 107, 52),
                            width: 1.6,
                          ),
                        ),
                        suffixIcon: const Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        hintText: "E-mail",
                        hintStyle: const TextStyle(color: Colors.white70),
                      ),
                      validator: (String? email) {
                        if (email == "" || email == null) {
                          return "O e-mail não pode ser vazio";
                        }
                        if (email.length < 6) {
                          return "O e-mail está muito curto";
                        }
                        if (!email.contains("@")) {
                          return "O e-mail é inválido";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 25),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: !_showPassword,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 41, 47, 54),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 48, 107, 52),
                            width: 1.6,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 48, 107, 52),
                            width: 1.6,
                          ),
                        ),
                        suffixIcon: GestureDetector(
                          child: Icon(
                            _showPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.white,
                          ),
                          onTap: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                        ),
                        hintText: "Senha",
                        hintStyle: const TextStyle(color: Colors.white70),
                      ),
                      validator: (String? password) {
                        if (password == "" || password == null) {
                          return "A senha não pode ser vazia";
                        }
                        if (password.length < 8) {
                          return "A senha deve ter mais de 8 caracteres";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 25),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          buttonEnterclick();
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(fontFamily: 'Antonio', fontSize: 18),
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(370, 40),
                          backgroundColor: Color.fromARGB(255, 101, 202, 101),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                      ),
                    ),
                    const Divider(color: Colors.white),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Mater-se conectado?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.white,
                            
                          ),
                        ),

                        GestureDetector(
                          child: Image.asset('assets/img/icongoogle.png',
                            width: 60,
                            height: 60,),
                            onTap: () {
                              _signInWithGoogle();
                            },
                        ),
                        
                        GestureDetector(
                          child: const Text(
                            'Não tem uma conta',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                          onTap: () {
                            Navigator.pushReplacementNamed(context, '/cadastro'); 
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void buttonEnterclick() {
    if (_formkey.currentState!.validate()) {
      _login();
    } else {
      print("form erro");
    }
  }
}
