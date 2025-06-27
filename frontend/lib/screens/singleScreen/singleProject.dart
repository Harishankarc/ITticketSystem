import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/components/Abutton.dart';
import 'package:frontend/components/Acard.dart';
import 'package:frontend/components/Atext.dart';
import 'package:frontend/screens/singleScreen/ticketModal.dart';
import 'package:frontend/screens/singleScreen/workBox.dart';

class SingleProject extends StatefulWidget {
  final int projectId;
  const SingleProject({super.key, required this.projectId});

  @override
  State<SingleProject> createState() => _SingleProjectState();
}

class _SingleProjectState extends State<SingleProject> {
  bool isClicked = false;
  final List<Map<String, dynamic>> pendingProjects = [
    {
      "statusLabel": "high",
      "createdDate": "6/20/2025",
      "pendingCount": 3,
      "ongoingCount": 0,
      "completedCount": 0,
    },
  ];

  final List<Map<String, dynamic>> ongoingProjects = [];

  final List<Map<String, dynamic>> completedProjects = [
    {
      "statusLabel": "Completed",
      "createdDate": "6/10/2025",
      "pendingCount": 0,
      "ongoingCount": 0,
      "completedCount": 10,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 50.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          size: 20.w,
                          color: Colors.grey[600],
                        ),
                      ),
                      AppButton(
                        size: 11,
                        height: 30.h,
                        width: 100.w,
                        borderRadius: 5,
                        gradient: const LinearGradient(
                          colors: [Color(0xFF93B2F1), Color(0xFF6D91F1)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        text: "Raise a ticket",
                        onPressed: () {
                          setState(() {
                            isClicked = !isClicked;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),

                  ACard(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AText(
                          text: "KernalScape Project ${widget.projectId} " ,
                          fontWeight: FontWeight.w700,
                          size: 18,
                          color: Colors.grey[900],
                        ),
                        SizedBox(height: 10.h),
                        AText(
                          text: "This is a short description of the project.",
                          fontWeight: FontWeight.w400,
                          size: 11,
                          color: Colors.grey[700],
                        ),
                        SizedBox(height: 10.h),

                        _summaryBox(
                          count: "3",
                          label: "Pending Requests",
                          borderColor: Colors.amber[200]!,
                          backgroundColor: Colors.amber[100]!,
                          textColor: Colors.amber[900]!,
                        ),
                        SizedBox(height: 10.h),

                        _summaryBox(
                          count: "2",
                          label: "Ongoing Work",
                          borderColor: Colors.blue[200]!,
                          backgroundColor: Colors.blue[100]!,
                          textColor: Colors.blue[900]!,
                        ),
                        SizedBox(height: 10.h),

                        _summaryBox(
                          count: "8",
                          label: "Completed Work",
                          borderColor: Colors.green[200]!,
                          backgroundColor: Colors.green[100]!,
                          textColor: Colors.green[900]!,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20.h),

                  _section(
                    icon: Icons.info_outline,
                    iconColor: Colors.amber[600]!,
                    label: "Pending Requests",
                    projects: pendingProjects,
                  ),

                  SizedBox(height: 20.h),

                  _section(
                    icon: Icons.access_time,
                    iconColor: Colors.blue[600]!,
                    label: "Ongoing Work",
                    projects: ongoingProjects,
                  ),

                  SizedBox(height: 20.h),

                  _section(
                    icon: Icons.check_outlined,
                    iconColor: Colors.green[600]!,
                    label: "Completed Work",
                    projects: completedProjects,
                  ),
                ],
              ),
            ),
          ),
          if (isClicked)
            Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.black.withOpacity(0.6),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(20.w),
                    child: RaiseTicketCard(
                      closeOnTap:() {
                        setState(() {
                          isClicked = !isClicked;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _summaryBox({
    required String count,
    required String label,
    required Color borderColor,
    required Color backgroundColor,
    required Color textColor,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1.w),
        borderRadius: BorderRadius.circular(10.r),
        color: backgroundColor,
      ),
      child: Column(
        children: [
          AText(
            text: count,
            fontWeight: FontWeight.w700,
            size: 18,
            color: textColor,
          ),
          AText(
            text: label,
            fontWeight: FontWeight.w700,
            size: 11,
            color: textColor,
          ),
        ],
      ),
    );
  }

  Widget _section({
    required IconData icon,
    required Color iconColor,
    required String label,
    required List<Map<String, dynamic>> projects,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 20.w, color: iconColor),
            SizedBox(width: 10.w),
            AText(
              text: "$label (${projects.length})",
              fontWeight: FontWeight.w500,
              size: 15,
              color: Colors.grey[900],
            ),
          ],
        ),
        SizedBox(height: 10.h),
        if (projects.isEmpty)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Center(
              child: AText(
                text: "Nothing to show",
                fontWeight: FontWeight.w400,
                size: 12,
                color: Colors.grey[500],
              ),
            ),
          )
        else
          ...projects.map(
            (project) => Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: WorkBox(
                title: "Update product page layout",
                description:
                    "The current product page needs better spacing and improved mobile responsiveness",
                status: "Ongoing",
                priority: "high",
                date: "1/22/2024",
                assignee: "Sarah Johnson",
              ),
            ),
          ),
      ],
    );
  }
}
