import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/components/Acard.dart';
import 'package:frontend/components/Atext.dart';
import 'package:frontend/screens/dashboard/projectBox.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 50.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AText(text: "Dashboard", fontWeight: FontWeight.w700, size: 25),
                  Icon(Icons.menu, size: 25.w),
                ],
              ),
              AText(
                text: "Welcome back! Here's an overview of your projects.",
                fontWeight: FontWeight.w400,
                size: 11,
                color: Colors.grey[700],
              ),
              SizedBox(height: 20.h),
              Column(
                children: [
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
                              text: "Total Projects",
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
                            Icons.folder_outlined,
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
                              text: "Active Projects",
                              fontWeight: FontWeight.w500,
                              size: 11,
                              color: Colors.grey[900],
                            ),
                            AText(
                              text: "2",
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
                            Icons.access_time,
                            color: Colors.green,
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
                              text: "Completed Projects",
                              fontWeight: FontWeight.w500,
                              size: 11,
                              color: Colors.grey[900],
                            ),
                            AText(
                              text: "1",
                              fontWeight: FontWeight.w700,
                              size: 20,
                              color: Colors.grey[900],
                            ),
                          ],
                        ),
                        ACard(
                          padding: EdgeInsets.all(10.w),
                          color: Colors.deepPurple[100],
                          borderRadius: 5.r,
                          child: Icon(
                            Icons.check_outlined,
                            color: Colors.deepPurple,
                            size: 15.w,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.w),
              AText(
                text: "Your Projects",
                fontWeight: FontWeight.w700,
                size: 15,
                color: Colors.grey[900],
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) => ProjectBox(
                  statusLabel: "Active",
                  createdDate: "6/25/2025",
                  pendingCount: 5,
                  ongoingCount: 3,
                  completedCount: 10,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
