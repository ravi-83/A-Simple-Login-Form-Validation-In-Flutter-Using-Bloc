import 'package:flutter/material.dart';
import 'package:login_bloc/bloc/provider.dart';
import 'bloc/blocs.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc =Provider.of(context);
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          emailField(bloc),
          passwordField(bloc),
          SizedBox(height: 25,),
          submitButton(bloc),
        ],
      ),
    );
  }
  Widget emailField(Bloc bloc){
    return StreamBuilder(
      stream: bloc.email,
      builder: (context,snapshot){
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'you@example.com',
            labelText: 'Email Address',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget passwordField(Bloc bloc){
    return StreamBuilder(
      stream: bloc.password,
      builder: (context,snapshot){
        return TextField(
          onChanged: bloc.changePassword,
          decoration: InputDecoration(
            hintText: 'password',
            labelText: 'Password',
            errorText: snapshot.error,
          ),
        );
      },
    );

  }
  Widget submitButton(Bloc bloc){

    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context,snapshot){
        return RaisedButton(
          onPressed: !snapshot.hasData ?
          null : (){
            Scaffold.of(context).showSnackBar(new SnackBar(
                content: new Text('Email : ${bloc.emailValue} and Password : ${bloc.passwordValue}')
            ));
          },
          color: Colors.blue,
          child: Text('Login'),
        );
      },
    );
  }
}
