import 'package:flutter/material.dart';
import 'constants.dart';

class QueuePage extends StatefulWidget {
  @override
  _QueuePageState createState() => _QueuePageState();
}

class _QueuePageState extends State<QueuePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          brightness: Brightness.light,
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    elevation: 8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
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
                                      "Ticket No. ",
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
                                      "Wait time",
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
                            padding: EdgeInsets.all(16),
                            color: Colors.white,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "Currently Serving",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "Position in line",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: FlatButton(
                                          onPressed: () {},
                                          child: Text(
                                            "SHOW QR CODE",
                                          ),
                                          textColor: Colors.white,
                                          color: kBlueColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: FlatButton(
                                          onPressed: () {},
                                          child: Text(
                                            "LEAVE LINE",
                                          ),
                                          textColor: Colors.grey[700],
                                          color: Colors.grey[300],
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
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
                  
                ])));
  }
}
