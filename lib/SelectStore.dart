import 'package:enigma_app/company_model.dart';
import 'package:enigma_app/company_store_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class SelectStore extends StatefulWidget {
  @override
  _SelectStoreState createState() => _SelectStoreState();
}

class _SelectStoreState extends State<SelectStore> {

  final String merchantUrl = "https://damp-plains-24002.herokuapp.com/api/merchants";
  List <CompanyModel> merchantList = List();
  var isLoading = false;

    @override
  void initState() {
    super.initState();
    this.fetchData();
  }

   Future <String> fetchData() async {
    setState(() {
      isLoading = true;
    });
    final response = await http.get(Uri.encodeFull(merchantUrl), headers: {"Accept": "application/json"});
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
          backgroundColor: Colors.white,
          elevation: 0.0,
          brightness: Brightness.light,
        ),
        body: Container(
                color: Colors.white,
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
                        height: 40,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        height: 50,
                        decoration: BoxDecoration(
                            color: Color(0xffEFEFEF),
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
                                  TextStyle(color: Colors.grey, fontSize: 19),
                            )
                          ],
                        ),
                      ),
                      
                      // Expanded(
                      //   child: Container(
                      //   margin: EdgeInsets.only(top: 20,),

                      //     padding: EdgeInsets.only(
                      //       left: 16,
                      //       right: 16,
                      //     ),
                         
                      //     child: GridView.count(
                      //       crossAxisCount: 2,
                      //       childAspectRatio: 0.7,
                      //       children: CompanyStoreProvider.items.map((item) {
                      //           CompanyStoreCard(
                                  
                      //           );
                                
                      //       }).toList(),
                      //       physics: ClampingScrollPhysics(),
                      //     ),
                      //   ),
                      // ),
                    ])));
  }
}
