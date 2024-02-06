import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_eventos/core/helpers/constants.dart';
import 'package:gestao_eventos/presentation/auth/sign_up/bloc/bloc.dart';
import 'package:gestao_eventos/presentation/auth/sign_up/bloc/sign_up_event.dart';
import 'package:gestao_eventos/presentation/auth/sign_up/bloc/sign_up_state.dart';
import 'package:gestao_eventos/presentation/general_components/custom_surfix_icon.dart';
import 'package:gestao_eventos/presentation/general_components/form_error.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? conform_password;
  bool remember = false;
  final List<String?> errors = [];

  late SignUpBloc _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of<SignUpBloc>(context);
    super.initState();
  }

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
        bloc: _bloc,
        listener: (context, state) {
          if (state is SignUpSucess) {
            Navigator.pushReplacementNamed(context, '/home');
          }
        },
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                onSaved: (newValue) => email = newValue,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    removeError(error: kEmailNullError);
                  } else if (emailValidatorRegExp.hasMatch(value)) {
                    removeError(error: kInvalidEmailError);
                  }
                  email = value;
                  return;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    addError(error: kEmailNullError);
                    return '';
                  } else if (!emailValidatorRegExp.hasMatch(value)) {
                    addError(error: kInvalidEmailError);
                    return '';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Digite seu email',
                  // If  you are using latest version of flutter then lable text and hint text shown like this
                  // if you r using flutter less then 1.20.* then maybe this is not working properly
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon:
                      CustomSurffixIcon(svgIcon: 'assets/icons/Mail.svg'),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                onSaved: (newValue) => password = newValue,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    removeError(error: kPassNullError);
                  } else if (value.length >= 8) {
                    removeError(error: kShortPassError);
                  }
                  password = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    addError(error: kPassNullError);
                    return '';
                  } else if (value.length < 8) {
                    addError(error: kShortPassError);
                    return '';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  hintText: 'Digite sua senha',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon:
                      CustomSurffixIcon(svgIcon: 'assets/icons/Lock.svg'),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                onSaved: (newValue) => conform_password = newValue,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    removeError(error: kPassNullError);
                  } else if (value.isNotEmpty && password == conform_password) {
                    removeError(error: kMatchPassError);
                  }
                  conform_password = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    addError(error: kPassNullError);
                    return '';
                  } else if (password != value) {
                    addError(error: kMatchPassError);
                    return '';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Confirmação de senha',
                  hintText: 'Digite novamente sua senha',
                  // If  you are using latest version of flutter then lable text and hint text shown like this
                  // if you r using flutter less then 1.20.* then maybe this is not working properly
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon:
                      CustomSurffixIcon(svgIcon: 'assets/icons/Lock.svg'),
                ),
              ),
              FormError(errors: errors),
              const SizedBox(height: 20),
              BlocBuilder<SignUpBloc, SignUpState>(
                bloc: _bloc,
                builder: (context, state) {
                  if (state is SignUpLoading) {
                    return const CircularProgressIndicator();
                  }
                  if (state is SignUpError) {
                    return Text(
                      state.message,
                      style: const TextStyle(color: Colors.red),
                    );
                  }
                  return Container();
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _bloc.add(SigningUpEvent(
                      email: email!,
                      password: password!,
                    ));
                  }
                },
                child: const Text('Criar conta'),
              ),
            ],
          ),
        ));
  }
}
