import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  bool _showPassword = false;
  bool isChecked = false;

  get value => null;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Tenta criar o usuário com e-mail e senha
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        // Tenta atualizar o nome do usuário
        await userCredential.user!.reload();
        _auth.currentUser; // Recarrega o usuário atualizado

        // Exibe uma notificação de sucesso e redireciona
        _showSnackBar('Cadastro realizado com sucesso!', Colors.green);
        Navigator.pushReplacementNamed(context, '/Login'); // Volta para a tela de login após o cadastro
      } catch (e) {
        // Exibe uma notificação de erro específico
        _showSnackBar('Erro no cadastro: ${e.toString()}', Colors.red);
      }
    }
  }

  void _showSnackBar(String message, Color color) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: color,
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 27, 27, 27),
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Color.fromARGB(255, 255, 255, 255),
            onPressed: () {
              Navigator.pushNamed(context, '/Login');
            }),
      ),
      body: SingleChildScrollView(
        child: Center(
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
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Column(
                        children: [
                          Text(
                            "Cadastre-se já",
                            style: TextStyle(
                              fontFamily: 'Antonio',
                              fontSize: 35,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Crie uma conta para começar a aproveitar nossos serviços',
                            style: TextStyle(
                                fontFamily: 'Antonio',
                                fontSize: 12,
                                color: Color.fromARGB(255, 219, 214, 214),
                                fontWeight: FontWeight.w100),
                          )
                        ],
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
                          hintText: "Insira seu E-mail",
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
                          hintText: "Crie uma senha forte",
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
                      TextFormField(
                        controller: _confirmPasswordController,
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
                          hintText: "Repita sua senha",
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
                      const SizedBox(height: 70),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            _register();
                          },
                          child: const Text(
                            "Cadastrar",
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            child: const Text(
                              'Desejo receber notificações das novidades',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ),
                          Checkbox(
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value ?? false;
                              });
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
      ),
    );
  }
}
