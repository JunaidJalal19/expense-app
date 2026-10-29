import 'package:expens_app/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:expens_app/data_helper.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // search and logo
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                        "assets/images/expens_logo.png",
                      width: 130,
                    ),
                    Icon(Icons.search_sharp, color: Colors.black, size: 36,)
                  ],
                ),
            
                SizedBox(height: 20,),
            
                // profile and dropDown
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 26,
                            backgroundColor: Colors.blue.shade50,
                            child: FlutterLogo(),
                          ),
                          SizedBox(width: 16,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Morning",
                                  style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: 16
                                  ),
                                ),
            
                                Text(
                                  "Junaid Jalal",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    overflow: TextOverflow.ellipsis
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
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
                  child: Row(
                    children: [
            
                      Column(
                        spacing: 5,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Expense total",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18
                            ),
                          ),
            
                          Text(
                            "\$3,734",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
            
            
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadiusGeometry.circular(3)
                                ),
                                child: Text(
                                  "+\$240",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              SizedBox(width: 5,),
                              Text(
                                "than last month",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: Image.asset(
                            "assets/images/expens_banner_image.png",
                          fit: BoxFit.contain,
            
                        ),
                      )
                    ],
                  ),
                ),
            
                SizedBox(height: 30,),
            
                // expense Title ---->
                Text(
                  "Expense List",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w600
                  ),
                ),
            
                SizedBox(height: 20,),
                
                // expense box list ----->
                ListView.builder(
                  shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: DataHelper.transactions.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: index != DataHelper.transactions.length - 1 ? const EdgeInsets.only(bottom: 30.0) :  const EdgeInsets.only(bottom: 0.0),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey.shade300,
                                  width: 1
                              ),
                              borderRadius: BorderRadiusGeometry.circular(12)
                          ),
                          child: Column(
                            children: [
                              // box title
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    DataHelper.transactions[index]["day"],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18
                                    ),
                                  ),

                                  Text(
                                    "${DataHelper.transactions[index]["total"] < 0 ? "-\$${DataHelper.transactions[index]["total"].abs()}" : "\$${DataHelper.transactions[index]["total"]}"}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 15,),
                              Divider(
                                color: Colors.grey.shade300,
                              ),
                              SizedBox(height: 15,),

                              //box items
                              ListView.builder(
                                shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, idx) {
                                   final itemArray = DataHelper.transactions[index]["items"];
                                    return Padding(
                                      padding: idx != itemArray.length - 1 ? const EdgeInsets.only(bottom: 20.0) : const EdgeInsets.only(bottom: 0.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 40,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                      color: DataHelper.transactions[index]["items"][idx]["backgroundColor"],
                                                      borderRadius: BorderRadiusGeometry.circular(5)
                                                  ),
                                                  child: Icon(DataHelper.transactions[index]["items"][idx]["icon"], color: DataHelper.transactions[index]["items"][idx]["iconColor"], size: 20,),
                                                ),
                                                SizedBox(width: 15,),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "${DataHelper.transactions[index]["items"][idx]["category"]}",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.w500
                                                        ),
                                                      ),
                                                      Text(
                                                        "${DataHelper.transactions[index]["items"][idx]["description"]}",
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 14,
                                                          overflow: TextOverflow.ellipsis

                                                        ),
                                                        maxLines: 1,
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),

                                          // amount
                                          Text(
                                            "${itemArray[idx]["amount"] < 0 ? "-\$${itemArray[idx]["amount"].abs()}" : "\$${itemArray[idx]["amount"]}"}",
                                            style: TextStyle(
                                                color: ColorHelper.secondaryColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500
                                            ),
                                          )

                                        ],
                                      ),
                                    );
                                  },
                                itemCount: DataHelper.transactions[index]["items"].length,
                              )


                            ],
                          ),
                        ),
                      );
                    }
                ),

                SizedBox(height: 20,)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
