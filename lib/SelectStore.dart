import 'package:enigma_app/company_model.dart';
import 'package:enigma_app/queue_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SelectStore extends StatefulWidget {
  @override
  _SelectStoreState createState() => _SelectStoreState();
}

class _SelectStoreState extends State<SelectStore> {
  final String merchantUrl =
      "https://damp-plains-24002.herokuapp.com/api/merchants";
  List<CompanyModel> merchantList = List();
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    this.fetchData();
  }

  Future<String> fetchData() async {
    setState(() {
      isLoading = true;
    });
    final response = await http.get(Uri.encodeFull(merchantUrl),
        headers: {"Accept": "application/json"});
    print(response.body);

    if (response.statusCode == 200) {
      merchantList = (json.decode(response.body) as List)
          .map((data) => new CompanyModel.fromJson(data))
          .toList();
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load merchants');
    }
    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffF3F6FF),
          elevation: 0.0,
          brightness: Brightness.light,
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : Container(
               color : Color(0xffF3F6FF),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Find Your \nStore Location",
                        style: TextStyle(
                            color: Colors.black87.withOpacity(0.8),
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14)),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.search),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Search",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 19),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                            child: CustomScrollView(
                          primary: false,
                          slivers: <Widget>[
                            SliverPadding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 10, right: 10),
                              sliver: SliverGrid(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.5,
                                ),
                                delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          20,
                                        ),
                                      ),
                                      child: Container(
                                        color: Colors.white,
                                        child: Column(
                                          children: <Widget>[
                                            Expanded(
                                                flex: 6,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                    fit: BoxFit.contain,
                                                    image: NetworkImage(
                                                        merchantList[index]
                                                            .logoImage),
                                                  )),
                                                )),
                                            Expanded(
                                              flex: 4,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 12,
                                                      vertical: 2,
                                                    ),
                                                    child: Text(
                                                      merchantList[index].name,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 12,
                                                      vertical: 2,
                                                    ),
                                                    child: Text(
                                                      merchantList[index]
                                                          .address,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 14,
                                                          color:
                                                              Colors.grey),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 12,
                                                      vertical: 2,
                                                    ),
                                                    child: Row(
                                                      children: <Widget>[
                                                        Icon(
                                                          Icons.watch_later,
                                                          color: Colors.green,
                                                          size: 16,
                                                        ),
                                                        Text(
                                                          merchantList[index]
                                                              .estimatedWaitTime
                                                              .toString() + " mins",
                                                          style: TextStyle(
                                                            color: Colors.green,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  new RaisedButton(
                                                      color: Colors.greenAccent,
                                                      onPressed: () =>
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (_) =>
                                                                      QueuePage())),
                                                      child:
                                                          new Text("JOIN LINE"),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            new BorderRadius
                                                                .circular(14.0),
                                                      ))
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  childCount: merchantList.length,
                                ),
                              ),
                            ),
                          ],
                        )),
                      ),
                    ])));
  }
}
