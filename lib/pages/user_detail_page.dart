import 'dart:convert';
import 'dart:ui';

import 'package:final_project/models/address.dart';
import 'package:final_project/models/company.dart';
import 'package:final_project/models/job.dart';
import 'package:final_project/widgets/custom_user_row.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserDetailPage extends StatefulWidget {
  const UserDetailPage({
    Key? key,
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  }) : super(key: key);

  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  final List<Job> _jobList = [];
  bool _isLoading = false;

  Future _fetchJob(int id) async {
    setState(() {
      _isLoading = true;
    });
    final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/todos?userId=$id'));
    if (response.statusCode == 200) {
      final _data = jsonDecode(response.body);
      setState(() {});
      for (Map i in _data) {
        _jobList.add(Job.fromJson(i));
      }
      _isLoading = false;
    } else {
      throw Exception('Failed load DATA');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchJob(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(145, 41, 53, 1),
        title: Text('${widget.name} details'),
      ),
      body: Container(
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
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
                              const Icon(
                                Icons.person,
                                size: 80,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: CustomUserRow(
                                  text: 'ID: ',
                                  textData: widget.id.toString(),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: CustomUserRow(
                                    text: 'Name: ', textData: widget.name),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: CustomUserRow(
                                  text: 'Username: ',
                                  textData: widget.username,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: CustomUserRow(
                                  text: 'Email: ',
                                  textData: widget.email,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                'Address',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: CustomUserRow(
                                      textData: widget.address.street,
                                      text: 'Street: ',
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: CustomUserRow(
                                      textData: widget.address.suite,
                                      text: 'Suite: ',
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: CustomUserRow(
                                      textData: widget.address.city,
                                      text: 'City: ',
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: CustomUserRow(
                                      textData: widget.address.zipcode,
                                      text: 'ZipCode: ',
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10.0),
                                          child: CustomUserRow(
                                            textData: widget.address.geo.lat,
                                            text: 'Lat: ',
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10.0),
                                          child: CustomUserRow(
                                            textData: widget.address.geo.lng,
                                            text: 'Lng: ',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: CustomUserRow(
                                  text: 'Phone: ',
                                  textData: widget.phone,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: CustomUserRow(
                                  text: 'Website: ',
                                  textData: widget.website,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                'Company',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: CustomUserRow(
                                      textData: widget.company.name,
                                      text: 'Name: ',
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: CustomUserRow(
                                      textData: widget.company.catchPhrase,
                                      text: 'Catch Phrase: ',
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: CustomUserRow(
                                      textData: widget.company.bs,
                                      text: 'BS: ',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'Job List',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _jobList.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          final _jobs = _jobList[index];
                          return CheckboxListTile(
                              secondary: Text(_jobs.id.toString()),
                              title: Text(_jobs.title),
                              value: _jobs.completed,
                              onChanged: (bool? value) {});
                        })
                  ],
                ),
              ),
      ),
    );
  }
}
