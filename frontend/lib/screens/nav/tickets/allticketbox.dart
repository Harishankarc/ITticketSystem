import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/components/Acard.dart';
import 'package:frontend/components/Atext.dart';

class AllTicketBox extends StatelessWidget {
  final String title;
  final String description;
  final String status;
  final String priority;
  final String date;
  final String assignee;
  final String projectname;

  const AllTicketBox({
    super.key,
    required this.title,
    required this.description,
    required this.status,
    required this.priority,
    required this.date,
    required this.assignee,
    required this.projectname
  });

  Color _getPriorityColor(String label) {
    switch (label.toLowerCase()) {
      case 'high':
        return Colors.red;
      case 'medium':
        return Colors.orange;
      case 'low':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  Color _getStatusColor(String label) {
    switch (label.toLowerCase()) {
      case 'ongoing':
        return Colors.blue;
      case 'completed':
        return Colors.green;
      case 'pending':
        return Colors.amber;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color priorityColor = _getPriorityColor(priority);
    final Color statusColor = _getStatusColor(status);

    return ACard(
      margin: EdgeInsets.only(bottom: 20.h),
      border: Border.all(color: Colors.grey[200]!, width: 1.w),
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AText(
            text: projectname,
            fontWeight: FontWeight.bold,
            size: 18,
            color: Colors.black,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AText(
                  text: title,
                  fontWeight: FontWeight.w600,
                  size: 13,
                  color: Colors.black,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: priorityColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: AText(
                  text: priority,
                  size: 10,
                  fontWeight: FontWeight.w500,
                  color: priorityColor,
                ),
              ),
            ],
          ),

          SizedBox(height: 8.h),

          AText(
            text: description,
            size: 11,
            fontWeight: FontWeight.w400,
            color: Colors.grey[700],
          ),

          SizedBox(height: 12.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  children: [
                    Icon(Icons.access_time, size: 14.sp, color: statusColor),
                    SizedBox(width: 5.w),
                    AText(
                      text: status,
                      size: 10,
                      fontWeight: FontWeight.w500,
                      color: statusColor,
                    ),
                  ],
                ),
              ),
              AText(
                text: date,
                size: 10,
                fontWeight: FontWeight.w400,
                color: Colors.grey[600],
              ),
            ],
          ),

          SizedBox(height: 10.h),

          // Row(
          //   children: [
          //     Icon(Icons.person_outline, size: 14.sp, color: Colors.grey[600]),
          //     SizedBox(width: 5.w),
          //     AText(
          //       text: "Assigned to $assignee",
          //       size: 10,
          //       fontWeight: FontWeight.w400,
          //       color: Colors.grey[700],
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
