import 'package:flutter/material.dart';
import 'package:virtulab/widgets/custom_text.dart';
import 'package:virtulab/widgets/custom_text_from_field.dart';

class ChangePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Change Password"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              CustomText(
                fontSize: 22,
                text: "Current Password",
                fontWeight: FontWeight.w600,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 30),
                child: CustomTextFormField(
                  hintText: "enter current password",
                  onChange: (v) {},
                ),
              ),
              CustomText(
                fontSize: 22,
                text: "New Password",
                fontWeight: FontWeight.w600,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 30),
                child: CustomTextFormField(
                  hintText: "enter new password",
                  onChange: (v) {},
                ),
              ),
              CustomText(
                fontSize: 22,
                text: "Confirm New Password",
                fontWeight: FontWeight.w600,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 30),
                child: CustomTextFormField(
                  hintText: "enter new password",
                  onChange: (v) {},
                ),
              ),
              SizedBox(height: 20,),
              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(15,)),
                  height: 60,
                  child: TextButton(
                      onPressed: () {},
                      child: CustomText(
                        fontSize: 22,
                        text: "Update Password",
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
