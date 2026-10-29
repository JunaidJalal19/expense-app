import 'package:flutter/material.dart';

import '../../color_helper.dart';
import '../../data_helper.dart';

class StatisticScreen extends StatelessWidget {
  StatisticScreen({super.key});

  final List<Map<String, dynamic>> _spendingDetailsTrackerList = [
    {
      "bgColor": Colors.deepPurple,
      "percentage" : 40,
      "flex" : 4
    },

    {
      "bgColor": Colors.pinkAccent,
      "percentage" : 25,
      "flex" : 3
    },

    {
      "bgColor": Colors.yellow,
      "percentage" : 15,
      "flex" : 2
    },

    {
      "bgColor": Colors.lightBlueAccent,
      "percentage" : 10,
      "flex" : 2
    },

    {
      "bgColor": Colors.red,
      "percentage" : 5,
      "flex" : 1
    },

    {
      "bgColor": Colors.green,
      "percentage" : 5,
      "flex" : 1
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: .stretch,
              children: [
                
                // Statistic and dropDown
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        "Statistic",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: ColorHelper.primaryColor.withValues(alpha: 0.15),
                          borderRadius: BorderRadiusGeometry.circular(8)
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "This month",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16
                            ),
                          ),
                
                          SizedBox(width: 5,),
                
                          Icon(Icons.keyboard_arrow_down,color: Colors.black,)
                
                        ],
                      ),
                    )
                  ],
                ),
                
                SizedBox(height: 30,),
                
                // banner ---->
                Container(
                  padding: EdgeInsets.only(left: 20, right: 10, top: 20, bottom: 20),
                  decoration: BoxDecoration(
                      color: ColorHelper.primaryColor,
                      borderRadius: BorderRadiusGeometry.circular(12)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Total expense",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                            ),
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.2),
                              borderRadius: BorderRadiusGeometry.circular(20)
                            ),
                            child: Icon(Icons.more_horiz, color: Colors.white,),
                          )
                        ],
                      ),
                      Text.rich(
                        TextSpan(
                          text: "\$3,734",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w600
                          ),
                          children: [
                            TextSpan(
                              text: "  / \$4000 per month",
                              style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.5),
                                  fontSize: 14,
                
                              ),
                            )
                          ]
                        ),
                      ),
                      SizedBox(height: 10,),
                      LinearProgressIndicator(
                        value: 0.7,
                        minHeight: 8,
                        backgroundColor: Colors.black.withValues(alpha: 0.2),
                        color: Colors.amber.shade300,
                        borderRadius: BorderRadiusGeometry.circular(20),
                      )
                    ],
                  ),
                ),
                
                SizedBox(height: 30,),
                
                // expense breakdown header
                Row(
                  mainAxisAlignment: .spaceBetween,
                  crossAxisAlignment: .start,
                  children: [
                    Column(
                      crossAxisAlignment: .start,
                      spacing: 5,
                      children: [
                        Text(
                          "Expense Breakdown",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: .bold
                          ),
                        ),
                
                        Text(
                          "Limit \$900 / week",
                          style: TextStyle(
                              fontSize: 16,
                
                          ),
                        )
                      ],
                    ),
                
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: ColorHelper.primaryColor.withValues(alpha: 0.15),
                          borderRadius: BorderRadiusGeometry.circular(8)
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Week",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16
                            ),
                          ),
                
                          SizedBox(width: 5,),
                
                          Icon(Icons.keyboard_arrow_down,color: Colors.black,)
                
                        ],
                      ),
                    )
                
                  ],
                ),
                
                // chats
                Container(
                  width: double.infinity,
                  color: Colors.amber,
                    child: Image.asset(
                        "assets/images/chat-img.png",
                      height: 225,
                      fit: BoxFit.cover,
                    )
                ),
                
                SizedBox(height: 10,),
                
                // Spending Details headLine
                Column(
                  spacing: 5,
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      "Spending Details",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: .bold
                      ),
                    ),
                
                    Text(
                      "Your expenses are divided into 6 categories",
                      style: TextStyle(
                          fontSize: 16,
                      ),
                    )
                  ],
                ),
                
                SizedBox(height: 15,),
                
                // category track
                Row(
                  children: List.generate(_spendingDetailsTrackerList.length, (index) {
                    return Expanded(
                      flex: _spendingDetailsTrackerList[index]["flex"],
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          Container(
                            height: 8,
                            color: _spendingDetailsTrackerList[index]["bgColor"],
                          ),
                
                          Text(
                              "${_spendingDetailsTrackerList[index]["percentage"]}%",
                            style: TextStyle(
                              fontSize: 12
                            ),
                          )
                        ],
                      ),
                    );
                  })
                ),
                
                SizedBox(height: 26,),
                
                //expenses list
                
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: DataHelper.transactions.length,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 2/0.8
                    ),
                    itemBuilder: (context, index) {

                      final title = DataHelper.transactions[index]["items"][0]["category"];
                      return Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey.shade300,
                                width: 1
                            ),
                            borderRadius: BorderRadiusGeometry.circular(10)
                        ),
                        child: Row(
                          crossAxisAlignment: .center,
                          spacing: 10,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: DataHelper.transactions[index]["items"][0]["backgroundColor"],
                                  borderRadius: BorderRadiusGeometry.circular(5)
                              ),
                              child: Icon(DataHelper.transactions[index]["items"][0]["icon"], color: DataHelper.transactions[index]["items"][0]["iconColor"], size: 20,),
                            ),

                            Column(
                              crossAxisAlignment: .start,
                              children: [
                                Text(
                                  title.length >  10 ? "${title.substring(0,10)}..." : title,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),

                                Text(
                                    "-\$${DataHelper.transactions[index]["items"][0]["amount"].abs()}0",
                                  style: TextStyle(
                                      color: ColorHelper.secondaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    }
                ),

                SizedBox(height: 25,)
                
                
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
