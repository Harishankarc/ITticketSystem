import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/components/Acard.dart';
import 'package:frontend/components/Atext.dart';

class ProjectBox extends StatelessWidget {
  final String statusLabel;
  final String createdDate;
  final int pendingCount;
  final int ongoingCount;
  final int completedCount;

  const ProjectBox({
    super.key,
    required this.statusLabel,
    required this.createdDate,
    required this.pendingCount,
    required this.ongoingCount,
    required this.completedCount,
  });

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return Colors.green;
      case 'completed':
        return Colors.blue;
      case 'pending':
        return Colors.amber;
      case 'delayed':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color statusColor = _getStatusColor(statusLabel);

    return ACard(
      margin: EdgeInsets.only(bottom: 20.h),
      border: Border.all(color: Colors.grey[200]!, width: 1.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AText(
                text: "Project1",
                fontWeight: FontWeight.w600,
                size: 12,
                color: Colors.grey[900],
              ),
              Icon(Icons.arrow_forward, size: 15.w, color: Colors.grey[600]),
            ],
          ),

          SizedBox(height: 10.h),

          AText(
            text: "This is a short description of the project.",
            fontWeight: FontWeight.w400,
            size: 10,
            color: Colors.grey[700],
          ),

          SizedBox(height: 10.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Row(
                  children: [
                    Icon(Icons.access_time, size: 15.w, color: statusColor),
                    SizedBox(width: 5.w),
                    AText(
                      text: statusLabel,
                      fontWeight: FontWeight.w600,
                      size: 10,
                      color: statusColor,
                    ),
                  ],
                ),
              ),
              AText(
                text: "Created $createdDate",
                fontWeight: FontWeight.w400,
                size: 10,
                color: Colors.grey[700],
              ),
            ],
          ),

          SizedBox(height: 10.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStat("$pendingCount", "Pending", Colors.amber[700]!),
              _buildStat("$ongoingCount", "On Going", Colors.blue[700]!),
              _buildStat("$completedCount", "Completed", Colors.green[700]!),
            ],
          ),

        ],
      ),
    );
  }

  Widget _buildStat(String number, String label, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AText(
          text: number,
          fontWeight: FontWeight.w400,
          size: 20,
          color: color,
        ),
        AText(
          text: label,
          fontWeight: FontWeight.w400,
          size: 11,
          color: Colors.grey[700],
        ),
      ],
    );
  }
}
