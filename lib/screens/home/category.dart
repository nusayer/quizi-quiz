import 'package:flutter/material.dart';
//import 'package:my_quiz/screens/home/info.dart';
//import 'package:my_quiz/screens/home/quiz.dart';
import 'package:quizi_quiz/services/auth.dart';
import 'package:quizi_quiz/services/api.dart';
import 'package:quizi_quiz/models/category.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final AuthService _auth = AuthService();
  final API api = API();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final List<String> categories = ['Computer Science', 'General Knowledge'];

  CategoryModel currentCategory;
  List<CategoryModel> cate = List();
  List<DropdownMenuItem> items = [];
  String _mySelection = " Loading ";

  Future<String> getCate() async {
    var varCate = await api.getCategories();
    setState(() {
      cate = varCate;
      items = cate
          .map((item) => DropdownMenuItem(
              child: Text(item.name), value: item.name.toString()))
          .toList();
      _mySelection = cate[0].name;
    });
    return 'Success';
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getCate();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
        child: Scaffold(
      backgroundColor: Color(0xFF3BA0F2),
      appBar: AppBar(
        title: Text(
          'Category',
          style: TextStyle(color: Color(0xFFFFFFFF)),
        ),
        backgroundColor: Color(0xFF228BE7),
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(
              Icons.settings,
              color: Color(0xFFFFFFFF),
            ),
            label: Text(
              'Update Info',
              style: TextStyle(color: Color(0xFFFFFFFF)),
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Container()));
            },
          ),
          FlatButton.icon(
            icon: Icon(
              Icons.person,
              color: Color(0xFFFFFFFF),
            ),
            label: Text(
              'logout',
              style: TextStyle(color: Color(0xFFFFFFFF)),
            ),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
        ],
      ),
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 8.0,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: deviceSize.width * 0.8,
            height: deviceSize.height * 0.4,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Choose a Category',
                      style: TextStyle(
                          color: Color(0xFF83878A),
                          fontWeight: FontWeight.w800),
                    ),
                    SizedBox(height: 20.0),
                    DropdownButton(
                      items: items,
                      style: TextStyle(
                          color: Color(0xFF83878A),
                          fontWeight: FontWeight.w500),
                      value: _mySelection,
                      onChanged: (newVal) {
                        setState(() {
                          _mySelection = newVal;
                        });
                      },
                    ),
                    SizedBox(height: 10.0),
                    RaisedButton(
                      color: Colors.pink[400],
                      child: Text(
                        'Select',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        for (var element in cate) {
                          if (_mySelection == element.name) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Container()));
                            break;
                          }
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
