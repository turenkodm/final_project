import 'dart:convert';
import 'dart:io';

import 'package:final_project/models/user.dart';
import 'package:final_project/pages/user_detail_page.dart';
import 'package:final_project/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<User> _list = [];
  bool isLoading = false;

  Future fetchData() async {
    setState(() {
      isLoading = true;
    });
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      final _data = jsonDecode(response.body);
      setState(() {});
      for (Map i in _data) {
        _list.add(User.fromJson(i));
      }
      isLoading = false;
    } else {
      throw Exception('Failed load DATA');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    const _idTextStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
    const _nameTextStyle = TextStyle(fontSize: 20);
    const _drawerTextStyle =
        TextStyle(color: Color.fromRGBO(145, 41, 53, 1), fontSize: 16);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(145, 41, 53, 1),
        title: const Text('Main Page'),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            const Image(image: AssetImage(ApplicationImages.jaguarLogo)),
            ListTile(
              trailing: const Icon(
                Icons.arrow_right_alt,
                color: Color.fromRGBO(145, 41, 53, 1),
              ),
              title: const Text(
                'Main Page',
                textAlign: TextAlign.center,
                style: _drawerTextStyle,
              ),
              onTap: () => Navigator.pushNamed(context, '/main_page'),
            ),
            ListTile(
              trailing: const Icon(
                Icons.arrow_right_alt,
                color: Color.fromRGBO(145, 41, 53, 1),
              ),
              title: const Text(
                'Exit Application',
                style: _drawerTextStyle,
                textAlign: TextAlign.center,
              ),
              onTap: () => exit(0),
            ),
          ],
        ),
      ),
      body: Container(
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                onRefresh: fetchData,
                child: ListView.builder(
                    itemCount: _list.length,
                    itemBuilder: (context, index) {
                      final dataList = _list[index];
                      return InkWell(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 10),
                          child: Card(
                            color: const Color.fromRGBO(240, 240, 240, 1),
                            elevation: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const Icon(Icons.person),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'ID: ',
                                          style: _idTextStyle,
                                        ),
                                        Text(dataList.id.toString()),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Name: ',
                                        style: _idTextStyle,
                                      ),
                                      Text(
                                        dataList.name,
                                        style: _nameTextStyle,
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Email: ',
                                          style: _idTextStyle,
                                        ),
                                        Text(dataList.email),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserDetailPage(
                              id: dataList.id,
                              name: dataList.name,
                              username: dataList.username,
                              email: dataList.email,
                              address: dataList.address,
                              phone: dataList.phone,
                              website: dataList.website,
                              company: dataList.company,
                            ),
                          ),
                        ),
                      );
                    }),
              ),
      ),
    );
  }
}
