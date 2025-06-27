
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/components/Acard.dart';
import 'package:frontend/components/Atext.dart';
import 'package:frontend/screens/nav/dashboard/projectBox.dart';
import 'package:frontend/screens/nav/tickets/allticketbox.dart';


class AllTickets extends StatelessWidget {
  const AllTickets ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.only(left: 30.w, right: 30.w, top: 50.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AText(text: "All Tickets", fontWeight: FontWeight.w700, size: 25),
              AText(
                text: "Here's an overview of your raised tickets.",
                fontWeight: FontWeight.w400,
                size: 11,
                color: Colors.grey[700],
              ),
              SizedBox(height: 20.h),
              ACard(
                border: Border.all(color: Colors.grey[200]!, width: 0.5.w),
                padding: EdgeInsets.symmetric(
                  vertical: 10.h,
                  horizontal: 20.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AText(
                          text: "Total Tickets",
                          fontWeight: FontWeight.w500,
                          size: 11,
                          color: Colors.grey[900],
                        ),
                        AText(
                          text: "3",
                          fontWeight: FontWeight.w700,
                          size: 20,
                          color: Colors.grey[900],
                        ),
                      ],
                    ),
                    ACard(
                      padding: EdgeInsets.all(10.w),
                      color: Colors.blue[100],
                      borderRadius: 5.r,
                      child: Icon(
                        Icons.confirmation_num,
                        color: Colors.blue,
                        size: 15.w,
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 20.h),
              ACard(
                border: Border.all(color: Colors.grey[200]!, width: 0.5.w),
                padding: EdgeInsets.symmetric(
                  vertical: 10.h,
                  horizontal: 20.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AText(
                          text: "Pending Tickets",
                          fontWeight: FontWeight.w500,
                          size: 11,
                          color: Colors.grey[900],
                        ),
                        AText(
                          text: "3",
                          fontWeight: FontWeight.w700,
                          size: 20,
                          color: Colors.grey[900],
                        ),
                      ],
                    ),
                    ACard(
                      padding: EdgeInsets.all(10.w),
                      color: Colors.amber[100],
                      borderRadius: 5.r,
                      child: Icon(
                        Icons.confirmation_num,
                        color: Colors.amber,
                        size: 15.w,
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 20.h),
              ACard(
                border: Border.all(color: Colors.grey[200]!, width: 0.5.w),
                padding: EdgeInsets.symmetric(
                  vertical: 10.h,
                  horizontal: 20.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AText(
                          text: "Completed Tickets",
                          fontWeight: FontWeight.w500,
                          size: 11,
                          color: Colors.grey[900],
                        ),
                        AText(
                          text: "3",
                          fontWeight: FontWeight.w700,
                          size: 20,
                          color: Colors.grey[900],
                        ),
                      ],
                    ),
                    ACard(
                      padding: EdgeInsets.all(10.w),
                      color: Colors.green[100],
                      borderRadius: 5.r,
                      child: Icon(
                        Icons.confirmation_num,
                        color: Colors.green,
                        size: 15.w,
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 30.w),
              AText(
                text: "Your Tickets",
                fontWeight: FontWeight.w700,
                size: 15,
                color: Colors.grey[900],
              ),
              SizedBox(height: 20.w),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: (){
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => SingleProject(projectId: index+1,)));
                  },
                  child: AllTicketBox(
                    title: "Update product page layout",
                    description:
                    "The current product page needs better spacing and improved mobile responsiveness",
                    status: "Ongoing",
                    priority: "high",
                    date: "1/22/2024",
                    assignee: "Sarah Johnson",
                    projectname: "KernalScape",
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
