import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/components/Atext.dart';
import 'package:frontend/components/Atextfeild.dart';
import 'package:frontend/components/Abutton.dart';
import 'package:frontend/components/Acard.dart';

class RaiseTicketCard extends StatefulWidget {
  final VoidCallback? closeOnTap;

  const RaiseTicketCard({super.key, this.closeOnTap});

  @override
  State<RaiseTicketCard> createState() => _RaiseTicketCardState();
}

class _RaiseTicketCardState extends State<RaiseTicketCard> {
  String? selectedProject;

  final List<String> availableProjects = [
    "KernalScape Website",
    "Mobile App",
    "Internal Dashboard",
    "Marketing Landing Page",
  ];

  @override
  Widget build(BuildContext context) {
    return ACard(
      padding: EdgeInsets.all(24.w),
      borderRadius: 16.r,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AText(
                  text: "Raise a Ticket",
                  size: 15,
                  fontWeight: FontWeight.w500,
                ),
                GestureDetector(
                  onTap: widget.closeOnTap,
                  child: Icon(Icons.close, color: Colors.grey.shade600),
                ),
              ],
            ),
            Divider(height: 30.h, thickness: 1, color: Colors.grey.shade200),

            AText(
              text: "Select Project *",
              size: 12,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 6.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: Colors.grey.shade300),
                color: Colors.grey.shade50,
              ),
              child: DropdownButton<String>(
                value: selectedProject,
                isExpanded: true,
                underline: SizedBox(),
                hint: AText(
                  text: "Choose a project",
                  size: 12,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w400,
                ),
                items: availableProjects.map((project) {
                  return DropdownMenuItem<String>(
                    value: project,
                    child: AText(
                      text: project,
                      size: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedProject = value;
                  });
                },
              ),
            ),

            SizedBox(height: 16.h),

            AText(text: "Title *", size: 12, fontWeight: FontWeight.w500),
            SizedBox(height: 6.h),
            ATextField(hintText: "Brief description of the issue"),
            SizedBox(height: 16.h),

            AText(text: "Description *", size: 12, fontWeight: FontWeight.w500),
            SizedBox(height: 6.h),
            ATextField(hintText: "Detailed description of the issue or request"),
            SizedBox(height: 16.h),

            AText(
              text: "Attachment (Optional)",
              size: 12,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 6.h),
            Container(
              width: double.infinity,
              height: 120.h,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.upload_file,
                      size: 30.sp,
                      color: Colors.grey.shade600,
                    ),
                    SizedBox(height: 8.h),
                    AText(
                      text: "Click to upload an image",
                      size: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade600,
                    ),
                    AText(
                      text: "PNG, JPG up to 10MB",
                      size: 11,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24.h),

            Row(
              children: [
                Expanded(
                  child: AppButton(
                    height: 50,
                    text: "Cancel",
                    onPressed: widget.closeOnTap ?? () {},
                    color: Colors.red,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: AppButton(
                    text: "Create Ticket",
                    height: 50,
                    onPressed: () {
                      if (selectedProject == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please select a project"),
                          ),
                        );
                        return;
                      }
                    },
                    gradient: const LinearGradient(
                      colors: [Color(0xFF93B2F1), Color(0xFF6D91F1)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
