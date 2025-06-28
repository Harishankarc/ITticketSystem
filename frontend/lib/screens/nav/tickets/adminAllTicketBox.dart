import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/components/Acard.dart';
import 'package:frontend/components/Atext.dart';

class AdminAllTicketBox extends StatefulWidget {
  final String title;
  final String description;
  final String status;
  final String priority;
  final String date;
  final String assignee;
  final String projectname;
  final String? imageUrl;

  const AdminAllTicketBox({
    super.key,
    required this.title,
    required this.description,
    required this.status,
    required this.priority,
    required this.date,
    required this.assignee,
    required this.projectname,
    this.imageUrl,
  });

  @override
  State<AdminAllTicketBox> createState() => _AdminAllTicketBoxState();
}

class _AdminAllTicketBoxState extends State<AdminAllTicketBox> {
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

  void _showImageDialog(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      barrierColor: Colors.black87,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Stack(
          children: [
            Center(
              child: InteractiveViewer(
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.contain,
                ),
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
      ),
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
                      Icon(Icons.broken_image_outlined, size: 28.sp, color: Colors.grey),
                ),
              ),
            ),
          ),
        ],
      );
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    final Color priorityColor = _getPriorityColor(widget.priority);
    final Color statusColor = _getStatusColor(selectedStatus);

    return ACard(
      margin: EdgeInsets.only(bottom: 20.h),
      border: Border.all(color: Colors.grey[200]!, width: 1.w),
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AText(
            text: widget.projectname,
            fontWeight: FontWeight.bold,
            size: 18,
            color: Colors.black,
          ),

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

          SizedBox(height: 8.h),

          /// Description
          AText(
            text: widget.description,
            size: 11,
            fontWeight: FontWeight.w400,
            color: Colors.grey[700],
          ),

          /// Image
          _buildImageSection(context),

          SizedBox(height: 12.h),

          /// Status & Date
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => _showStatusModal(context),
                child: Container(
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

          /// Assignee
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
        ],
      ),
    );
  }
}
