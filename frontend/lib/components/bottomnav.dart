import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/utils/constants.dart';

class Bottomnav extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  const Bottomnav({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });
  //
  @override
  Widget build(BuildContext context) {
    final items = [
      {'label': 'DashBoard', 'icon': Icons.dashboard, 'badge': 2},
      {'label': 'All Tickets', 'icon': Icons.confirmation_num , 'badge': 1},
      {'label': 'Profile', 'icon': Icons.person , 'badge': 0},

    ];

    return Container(
      padding:  EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 15, offset: Offset(6,6)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          final isSelected = index == selectedIndex;

          return GestureDetector(
            onTap: () => onTabSelected(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Icon(
                      item['icon'] as IconData,
                      size: 25.w,
                      color: isSelected ? Colors.grey[700] : Colors.grey,
                    ),
                    if ((item['badge'] as int) > 0)
                      Positioned(
                        top: -6,
                        right: -6,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          constraints:  BoxConstraints(
                            minWidth: 15.w,
                            minHeight: 15.h,
                          ),
                          child: Center(
                            child: Text(
                              '${item['badge']}',
                              style:  TextStyle(
                                color: Colors.white,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  item['label'] as String,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: isSelected ? Colors.grey[700] : Colors.grey,
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
