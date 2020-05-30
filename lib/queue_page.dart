import 'package:flutter/material.dart';
import 'QRscreen.dart';
import 'constants.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'customer_details_model.dart';
import 'chatscreen.dart';

class QueuePage extends StatefulWidget {
  @override
  _QueuePageState createState() => _QueuePageState();
}

class _QueuePageState extends State<QueuePage> {
  var rating = 3.0;
  final String costumerUrl =
      "https://damp-plains-24002.herokuapp.com/api/customer/1590819844";
  List<CostumerDetailsModel> costumerList = List();

  var isLoading = false;

  @override
  void initState() {
    super.initState();
    this.fetchCostumerData();
  }

  Future<String> fetchCostumerData() async {
    setState(() {
      isLoading = true;
    });
    final response = await http.get(Uri.encodeFull(costumerUrl),
        headers: {"Accept": "application/json"});
    print(response.body);

    if (response.statusCode == 200) {
      costumerList = (json.decode(response.body) as List)
          .map((data) => new CostumerDetailsModel.fromJson(data))
          .toList();
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load costumer data');
    }
    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          brightness: Brightness.light,
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : new ListView.builder(
                itemCount: costumerList == null ? 0 : costumerList.length,
                itemBuilder: (BuildContext context, int index) {
                  return new Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 8),
                              elevation: 8,
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(16),
                                      color: kBlueColor,
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                "Ticket No. " +
                                                    costumerList[index].code,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey[300],
                                                ),
                                              ),
                                              Icon(
                                                Icons.more_vert,
                                                color: Colors.grey[300],
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.watch_later,
                                                color: Colors.grey[100],
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                // costumerList[index]
                                                //         .waitTime
                                                //         .toString() +
                                                    "15 mins",
                                                style: TextStyle(
                                                  color: Colors.grey[100],
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          top: 20, bottom: 20, left: 10),
                                      color: Colors.white,
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            "You are now " +
                                                costumerList[index]
                                                    .position
                                                    .toString() +
                                                "th in line.",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20, bottom: 20, left: 10),
                                            child: Row(
                                              children: <Widget>[
                                                Text(
                                                  "Rate your experience",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                SmoothStarRating(
                                                    allowHalfRating: false,
                                                    onRated: (v) {},
                                                    starCount: 5,
                                                    //rating: rating,
                                                    size: 30.0,
                                                    isReadOnly: false,
                                                    color: Colors.green,
                                                    borderColor: Colors.green,
                                                    spacing: 0.0)
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: FlatButton(
                                                    onPressed: () =>
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (_) =>
                                                                    QRScreen())),
                                                    child: Text(
                                                      "SHOW QR CODE",
                                                    ),
                                                    textColor: Colors.white,
                                                    color: kBlueColor,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20))),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: FlatButton(
                                                    onPressed: () {},
                                                    child: Text(
                                                      "LEAVE LINE",
                                                    ),
                                                    textColor: Colors.grey[700],
                                                    color: Colors.grey[300],
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20))),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Center(
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Text(
                                      "Need to ask a quick question? \nTalk to an available Customer Care Rep",
                                      style: TextStyle(
                                        color: Color(0xff2c3550),
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => ChatScreen())),
                                    child: Icon(
                                      Icons.chat,
                                      color: Color(0xff3ecdff),
                                      size: 50,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ]));
                },
              ));
  }
}
