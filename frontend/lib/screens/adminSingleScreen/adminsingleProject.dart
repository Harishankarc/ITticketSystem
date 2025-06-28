import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/components/Abutton.dart';
import 'package:frontend/components/Acard.dart';
import 'package:frontend/components/Atext.dart';
import 'package:frontend/screens/adminSingleScreen/adminWorkBox.dart';

class AdminSingleProject extends StatefulWidget {
  final int projectId;
  const AdminSingleProject({super.key, required this.projectId});

  @override
  State<AdminSingleProject> createState() => _SingleProjectState();
}

class _SingleProjectState extends State<AdminSingleProject> {
  bool isClicked = false;
  String selectedStatus = "OnGoing";

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

  LinearGradient _getGradientForStatus(String status) {
    switch (status) {
      case "Pending":
        return const LinearGradient(
          colors: [Color(0xFFFFC107), Color(0xFFFF8F00)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        );
      case "OnGoing":
        return const LinearGradient(
          colors: [Color(0xFF93B2F1), Color(0xFF6D91F1)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        );
      case "Completed":
        return const LinearGradient(
          colors: [Color(0xFF4CAF50), Color(0xFF2E7D32)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        );
      default:
        return const LinearGradient(
          colors: [Color(0xFF93B2F1), Color(0xFF6D91F1)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        );
    }
  }

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
                        gradient: _getGradientForStatus(selectedStatus),
                        text: selectedStatus,
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
                    child: StatusSelectionModal(
                      currentStatus: selectedStatus,
                      onStatusSelected: (String newStatus) {
                        setState(() {
                          selectedStatus = newStatus;
                          isClicked = false;
                        });
                      },
                      closeOnTap: () {
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
              child: AdminWorkBox(
                title: "Update product page layout",
                description:
                "The current product page needs better spacing and improved mobile responsiveness",
                status: "Ongoing",
                priority: "high",
                date: "1/22/2024",
                assignee: "Sarah Johnson",
                imageUrl: 'assets/images/ticketimage.png',
              ),
            ),
          ),
      ],
    );
  }
}

class StatusSelectionModal extends StatelessWidget {
  final String currentStatus;
  final Function(String) onStatusSelected;
  final VoidCallback closeOnTap;

  const StatusSelectionModal({
    super.key,
    required this.currentStatus,
    required this.onStatusSelected,
    required this.closeOnTap,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> statusOptions = [
      {
        'name': 'Pending',
        'icon': Icons.info_outline,
        'color': Colors.amber[600],
        'gradient': const LinearGradient(
          colors: [Color(0xFFFFC107), Color(0xFFFF8F00)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      },
      {
        'name': 'OnGoing',
        'icon': Icons.access_time,
        'color': Colors.blue[600],
        'gradient': const LinearGradient(
          colors: [Color(0xFF2196F3), Color(0xFF1976D2)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      },
      {
        'name': 'Completed',
        'icon': Icons.check_circle_outline,
        'color': Colors.green[600],
        'gradient': const LinearGradient(
          colors: [Color(0xFF4CAF50), Color(0xFF2E7D32)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      },
    ];

    return ACard(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AText(
                text: "Select Status",
                fontWeight: FontWeight.w700,
                size: 15,
                color: Colors.grey[900],
              ),
              GestureDetector(
                onTap: closeOnTap,
                child: Icon(
                  Icons.close,
                  size: 20.w,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          ...statusOptions.map((option) => Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: GestureDetector(
              onTap: () => onStatusSelected(option['name']),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(15.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color: currentStatus == option['name']
                        ? option['color']
                        : Colors.grey[300]!,
                    width: currentStatus == option['name'] ? 2.w : 1.w,
                  ),
                  gradient: currentStatus == option['name']
                      ? option['gradient'].withOpacity(0.1)
                      : null,
                ),
                child: Row(
                  children: [
                    Icon(
                      option['icon'],
                      size: 20.w,
                      color: option['color'],
                    ),
                    SizedBox(width: 15.w),
                    AText(
                      text: option['name'],
                      fontWeight: currentStatus == option['name']
                          ? FontWeight.w600
                          : FontWeight.w400,
                      size: 12,
                      color: currentStatus == option['name']
                          ? option['color']
                          : Colors.grey[700],
                    ),
                    const Spacer(),
                    if (currentStatus == option['name'])
                      Icon(
                        Icons.check_circle,
                        size: 18.w,
                        color: option['color'],
                      ),
                  ],
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }
}