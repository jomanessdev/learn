import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  var firstName = '';
  var lastName = '';
  var address = '';
  var occupation = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'First Name',
                    labelText: 'First Name'
                  ),
                  validator: (value) {
                    if (value.isEmpty || value == null) {
                      return 'Please enter some text.';
                    }
                    firstName = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'Last Name',
                    labelText: 'Last Name'
                  ),
                  validator: (value) {
                    if (value.isEmpty || value == null) {
                      return 'Please enter some text.';
                    }
                    lastName = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.location_city),
                    hintText: 'Street, City, State and Zip',
                    labelText: 'Address'
                  ),
                  validator: (value) {
                    if (value.isEmpty || value == null) {
                      return 'Please enter some text.';
                    }
                    address = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.business),
                    hintText: 'Job Title',
                    labelText: 'Occupation'
                  ),
                  validator: (value) {
                    if (value.isEmpty || value == null) {
                      return 'Please enter some text.';
                    }
                    occupation = value;
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.0),
                  child: RaisedButton(
                    child: Text('Submit'),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context){
                            return AlertDialog(
                              title: Text('Welcome'),
                              content: Text('Hello $firstName $lastName !'),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text('Ok'),
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            );
                          }
                        );
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
