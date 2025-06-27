import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/components/Abutton.dart';
import 'package:frontend/components/Atext.dart';
import 'package:frontend/components/Atextfeild.dart';
import 'package:frontend/screens/nav/dashboard/dashboard.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AText(text: "Welcome,", fontWeight: FontWeight.w700, size: 30,),
            AText(text: "Login to Continue!", fontWeight: FontWeight.w700, size: 20,color: Colors.grey[500],),
            SizedBox(height: 50.h,),
            AText(text: "Email", fontWeight: FontWeight.w400, size: 12,color: Colors.grey[600],),
            SizedBox(height: 5.h,),
            ATextField(hintText: "Email", keyboardType: TextInputType.emailAddress,icon: Icons.mail,),
            SizedBox(height: 20.h,),
            AText(
              text: "Password",
              fontWeight: FontWeight.w400,
              size: 12,
              color: Colors.grey[600],
            ),
            SizedBox(height: 5.h),
            ATextField(hintText: "Password", isObscure: true,icon: Icons.lock,),
            SizedBox(height: 10.h),
            Align(alignment: Alignment.centerRight,child: AText(text: "Forgot Password?", fontWeight: FontWeight.w500, size: 12,color: Colors.grey[800],)),
            SizedBox(height: 30.h),
            AppButton(
            height: 60,
            text: "Login", onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> DashBoard()));
            },
            gradient: const LinearGradient(
                colors: [
                  Color(0xFFFF5F6D),
                  Color(0xFFFFC371),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),

            SizedBox(height: 50.h,),
          ],
        ),
      )
    );
  }
}
