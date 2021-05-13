import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_app/app/component/input_data/simple_text_form_field_widget.dart';
import 'package:marketplace_store_app/app/component/loading/simple_loading_widget.dart';
import 'package:marketplace_store_app/app/component/navigation_bar/simple_navigation_bar_widget.dart';
import 'package:marketplace_store_app/app/modules/login/page/login_remember/login_remember_bloc.dart';

class LoginRememberPage extends StatefulWidget {
  final String email;

  const LoginRememberPage({Key key, this.email}) : super(key: key);

  @override
  _LoginRememberPageState createState() => _LoginRememberPageState();
}

class _LoginRememberPageState extends State<LoginRememberPage> {
  final _formKey = GlobalKey<FormState>();
  LoginRememberBloc _bloc = Modular.get();

  TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.email != null) {
      _emailController.text = widget.email;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: SimpleNavigationBarWidget(
        title: "ESQUECI A SENHA",
      ),
      child: StreamBuilder(
        stream: _bloc.outStateController,
        initialData: false,
        builder: (streamContext, snapshot){
          if (snapshot.hasData && snapshot.data is bool){
            bool isLoading = snapshot.data;

            if (isLoading == false){
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SimpleTextFormFieldWidget(
                        controller: _emailController,
                        title: "Email coorporativo",
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Obrigatório";
                          }

                          return null;
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Expanded(
                              child: CupertinoButton.filled(
                                child: Text("Enviar senha"),
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    _bloc.sendEmail(context,
                                        email: _emailController.text);
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
          }

          return SimpleLoadingWidget();
        },
      ),
    );
  }
}
