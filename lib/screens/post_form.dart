import 'package:flutter/material.dart';
import 'package:persono_mobile/components/form_input.dart';
import 'package:persono_mobile/models/post.dart';
import 'package:persono_mobile/services/remote_services.dart';

class PostForm extends StatefulWidget {
  const PostForm({super.key});

  @override
  State<PostForm> createState() => _PostFormState();
}

class _PostFormState extends State<PostForm> {
  final TextEditingController _valueTitleController = TextEditingController();
  final TextEditingController _valueNameController = TextEditingController();
  final TextEditingController _valueBodyController = TextEditingController();
  final TextEditingController _valueCategoryController =
      TextEditingController();
  bool _sending = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(int.parse('0xff2c2c2c')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Crie Seu post',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Column(
                  children: [
                    FormInput(
                      label: 'Qual o titulo do seu post?',
                      minlength: 2,
                      errorMessage: 'O titulo deve ter mais de 2 digitos',
                      hintText: 'Titulo do Post',
                      controller: _valueTitleController,
                    ),
                    FormInput(
                      label: 'Qual o seu nome?',
                      minlength: 2,
                      errorMessage: 'O nome deve ter mais de 2 digitos',
                      hintText: 'Seu nome',
                      controller: _valueNameController,
                    ),
                    FormInput(
                      label: 'Qual o seu Post?',
                      inputHeight: 100,
                      minlength: 10,
                      errorMessage: 'O Post deve ter mais de 10 digitos',
                      hintText: 'Post',
                      controller: _valueBodyController,
                    ),
                    FormInput(
                      label: 'Qual a categoria do post?',
                      minlength: 4,
                      errorMessage: 'A categoria deve ter mais de 4 digitos',
                      hintText: 'Categoria',
                      controller: _valueCategoryController,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            var post = Post(
                                name: _valueNameController.text,
                                title: _valueTitleController.text,
                                body: _valueBodyController.text,
                                category: _valueCategoryController.text,
                                createdAt: DateTime.now());
                            await RemoteService().post(post);
                            Navigator.pop(context);
                          }
                        },
                        child: const Text('Enviar'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
