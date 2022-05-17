import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:zipcodef/modules/search/presenter/search/controllers/search_zipcode_controller.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  final controller = Modular.get<SearchZipCodeController>();

  TextEditingController _controllerZipcode = new MaskedTextController(mask: '00000-000');


  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
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
                        onPressed:(){
                          controller.getZipcode(_controllerZipcode.text);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 30),
                      child:Observer(builder: (_){
                              return Text(controller.zipcode_text,
                                  style: TextStyle(fontSize: 20),
                              );
                            })
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }
}

