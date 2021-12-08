import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _zipcode_text = '';
  TextEditingController _controllerZipcode =
      new MaskedTextController(mask: '00000-000');

  void _getZipcode(String zipcode_value) async {
    if (zipcode_value == '') {
      setState(() {_zipcode_text = ' ';});
      Toast.show("Invalid Zip code", context,
          backgroundColor: Colors.red,
          duration: Toast.LENGTH_LONG,
          gravity: Toast.BOTTOM);
    }else {
      final response = await http
          .get(Uri.parse('https://viacep.com.br/ws/${zipcode_value}/json'));
      if (response.statusCode == 200) {
        var zipcode = jsonDecode(response.body);
        if (zipcode['erro'] == null) {
          setState(() {
            if (zipcode == null) {
              _zipcode_text = ' ';
              Toast.show('Invalid Zip code', context,
                  backgroundColor: Colors.red,
                  duration: Toast.LENGTH_LONG,
                  gravity: Toast.BOTTOM);
            } else {
              _zipcode_text = "Address :\n" +
                  zipcode['logradouro'] +
                  '\n' +
                  zipcode['bairro'] +
                  '\n' +
                  zipcode['localidade'] +
                  '/' +
                  zipcode['uf'];
            }
          });
        } else {
          setState(() {
            _zipcode_text = ' ';
          });
          Toast.show("Invalid Zip code", context,
              backgroundColor: Colors.red,
              duration: Toast.LENGTH_LONG,
              gravity: Toast.BOTTOM);
        }
      } else {
        throw Exception('Failed to load Zip code');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 1,left: 20,right: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 1),
                  child: Image.asset("img/correios_logo.jpeg"),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 1),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      fillColor: Colors.black,
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      hintText: "83601-970",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1.0, color: Colors.grey),
                      ),
                    ),
                    controller: _controllerZipcode,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: RaisedButton(
                    child: Text('Search',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    color: Colors.orange,
                    padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                    onPressed: () => _getZipcode(_controllerZipcode.text),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 30),
                  child: Text(
                    _zipcode_text,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
