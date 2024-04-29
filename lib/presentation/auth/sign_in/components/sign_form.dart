// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_eventos/core/dependences/get_it.dart';
import 'package:gestao_eventos/core/helpers/constants.dart';
import 'package:gestao_eventos/core/helpers/keyboard.dart';
import 'package:gestao_eventos/domain/entities/permission_level.dart';
import 'package:gestao_eventos/presentation/auth/sign_in/bloc/bloc.dart';
import 'package:gestao_eventos/presentation/auth/sign_in/bloc/sign_in_event.dart';
import 'package:gestao_eventos/presentation/auth/sign_in/bloc/sign_in_state.dart';
import 'package:gestao_eventos/presentation/auth/sign_in/view/sign_in_screen.dart';
import 'package:gestao_eventos/presentation/general_components/custom_surfix_icon.dart';
import 'package:gestao_eventos/presentation/general_components/form_error.dart';
import 'package:gestao_eventos/presentation/painels/admin/view/admin_screen.dart';
import 'package:gestao_eventos/presentation/painels/client/client_home_screen.dart';

class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;
  final List<String?> errors = [];

  late SignInBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<SignInBloc>(context);
    // _bloc.add(
    //   SigningInEvent(
    //     email: 'emilianojamba@gmail.com',
    //     password: 'password',
    //   ),
    // );
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
    return BlocListener<SignInBloc, SignInState>(
      bloc: _bloc,
      listener: (context, state) {
        if (state is SignInSucess) {
          if (state.user.level == PermissionLevel.ADMIN) {
            Navigator.pushReplacementNamed(context, AdminScreen.routeName);
            return;
          }
          if (state.user.level == PermissionLevel.RECEPCIONISTA) {
            throw UnimplementedError();
            // Navigator.pushReplacementNamed(context, '');
            // return;
          }
          Navigator.pushReplacementNamed(context, ClientHomeScreen.routeName);
        }
        if (state is SigningOutState) {
          Navigator.pushReplacementNamed(context, SignInScreen.routeName);
          return;
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
                suffixIcon: CustomSurffixIcon(svgIcon: 'assets/icons/Mail.svg'),
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
                return;
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
                // If  you are using latest version of flutter then lable text and hint text shown like this
                // if you r using flutter less then 1.20.* then maybe this is not working properly
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: CustomSurffixIcon(svgIcon: 'assets/icons/Lock.svg'),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: remember,
                  activeColor: kPrimaryColor,
                  onChanged: (value) {
                    setState(() {
                      remember = value;
                    });
                  },
                ),
                const Text('Lembrar'),
                const Spacer(),
                InkWell(
                  onTap: () => Navigator.pushNamed(
                    context,
                    'ForgotPasswordScreen.routeName',
                  ),
                  child: const Text(
                    'Esqueci minha senha',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
            FormError(errors: errors),
            const SizedBox(height: 16),
            BlocBuilder<SignInBloc, SignInState>(
              bloc: _bloc,
              builder: (context, state) {
                if (state is SigningInState) {
                  return const CircularProgressIndicator();
                }
                if (state is SigningInError) {
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
            BlocBuilder<SignInBloc, SignInState>(
              bloc: _bloc,
              builder: (context, state) {
                if (state is SigningInState) {
                  return Container();
                }
                return ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      _bloc.add(
                        SigningInEvent(email: email!, password: password!),
                      );
                      KeyboardUtil.hideKeyboard(context);
                    }
                  },
                  child: const Text('Entrar'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
