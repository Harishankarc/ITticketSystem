import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/components/Abutton.dart';
import 'package:frontend/components/Acard.dart';
import 'package:frontend/components/Atext.dart';

class AdminWorkBox extends StatefulWidget {
  final String title;
  final String description;
  final String status;
  final String priority;
  final String date;
  final String assignee;
  final String? imageUrl;

  const AdminWorkBox({
    super.key,
    required this.title,
    required this.description,
    required this.status,
    required this.priority,
    required this.date,
    required this.assignee,
    this.imageUrl,
  });

  @override
  State<AdminWorkBox> createState() => _AdminWorkBoxState();
}

class _AdminWorkBoxState extends State<AdminWorkBox> {
  late String selectedStatus;

  @override
  void initState() {
    super.initState();
    selectedStatus = widget.status;
  }

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

  LinearGradient _getGradientForStatus(String status) {
    switch (status.toLowerCase()) {
      case "pending":
        return const LinearGradient(
          colors: [Color(0xFFFFC107), Color(0xFFFF8F00)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        );
      case "ongoing":
        return const LinearGradient(
          colors: [Color(0xFF93B2F1), Color(0xFF6D91F1)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        );
      case "completed":
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

  void _showStatusModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.r)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: ["Pending", "OnGoing", "Completed"].map((status) {
              final isSelected = status.toLowerCase() == selectedStatus.toLowerCase();
              return ListTile(
                leading: Icon(
                  Icons.circle,
                  size: 12.sp,
                  color: isSelected ? Colors.green : Colors.grey,
                ),
                title: Text(
                  status,
                  style: TextStyle(
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    fontSize: 13.sp,
                  ),
                ),
                onTap: () {
                  setState(() {
                    selectedStatus = status;
                  });
                  Navigator.of(context).pop();
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  Widget _buildImageSection(BuildContext context) {
    if (widget.imageUrl != null && widget.imageUrl!.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12.h),
          Row(
            children: [
              Icon(Icons.image_outlined, size: 14.sp, color: Colors.grey[600]),
              SizedBox(width: 5.w),
              AText(
                text: "Attachment",
                size: 10,
                fontWeight: FontWeight.w700,
                color: Colors.grey[700],
              ),
            ],
          ),
          SizedBox(height: 8.h),
          GestureDetector(
            onTap: () => _showImageDialog(context, widget.imageUrl!),
            child: Container(
              width: double.infinity,
              height: 120.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: Colors.grey[300]!, width: 1.w),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.asset(
                  widget.imageUrl!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Icon(Icons.broken_image_outlined),
                ),
              ),
            ),
          ),
        ],
      );
    }
    return const SizedBox.shrink();
  }

  void _showImageDialog(BuildContext context, String url) {
    showDialog(
      context: context,
      builder: (ctx) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Stack(
            children: [
              Center(
                child: InteractiveViewer(
                  child: Image.asset(url),
                ),
              ),
              Positioned(
                top: 40.h,
                right: 20.w,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Icon(Icons.close, color: Colors.white, size: 20.sp),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color priorityColor = _getPriorityColor(widget.priority);
    final Color statusColor = _getStatusColor(selectedStatus);

    return ACard(
      margin: EdgeInsets.only(bottom: 20.h),
      border: Border.all(color: Colors.grey[200]!),
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title & Priority
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AText(
                  text: widget.title,
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
                  text: widget.priority,
                  size: 10,
                  fontWeight: FontWeight.w500,
                  color: priorityColor,
                ),
              ),
            ],
          ),

          /// Description
          SizedBox(height: 8.h),
          AText(
            text: widget.description,
            size: 11,
            fontWeight: FontWeight.w400,
            color: Colors.grey[700],
          ),

          /// Image section
          _buildImageSection(context),

          /// Status and Date
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
                      text: selectedStatus,
                      size: 10,
                      fontWeight: FontWeight.w500,
                      color: statusColor,
                    ),
                  ],
                ),
              ),
              AText(
                text: widget.date,
                size: 10,
                fontWeight: FontWeight.w400,
                color: Colors.grey[600],
              ),
            ],
          ),

          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.person_outline, size: 14.sp, color: Colors.grey[600]),
                  SizedBox(width: 5.w),
                  AText(
                    text: "Raised by ${widget.assignee}",
                    size: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[700],
                  ),
                ],
              ),
              SizedBox(width: 10.w),
              AppButton(
                size: 10,
                height: 25.h,
                width: 100.w,
                borderRadius: 5,
                gradient: _getGradientForStatus(selectedStatus),
                text: selectedStatus,
                onPressed: () => _showStatusModal(context),
              ),
            ],
          )


        ],
      ),
    );
  }
}
