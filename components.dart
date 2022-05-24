import 'package:flutter/material.dart';

DefaultTextField({
  required String label,
  IconData? prefixIcon,
  IconData? suffixIcon,
  TextInputType? keyboard,
  bool obscurePassword = false,
  Function()? onPressedSuffix,
  Function()? onTap,
  TextEditingController? controller,
  FormFieldValidator? validate,
  required Color? colorText,
  required Color colorBorder,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: keyboard,
      validator: validate,
      onTap: onTap,
      obscureText: obscurePassword,
      decoration: InputDecoration(
        labelText: '$label ...',
        labelStyle: TextStyle(fontSize: 17, color: colorText),
        contentPadding: const EdgeInsets.only(left: 10),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: suffixIcon != null
            ? IconButton(onPressed: onPressedSuffix, icon: Icon(suffixIcon))
            : null,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colorBorder, width: .5),
        ),
      ),
    );

DefaultButton(
        {required String text,
        required Function()? onPressedFunction,
        double width = double.infinity,
        Color color = Colors.blue}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      width: width,
      height: 60,
      child: MaterialButton(
        onPressed: onPressedFunction,
        child: Text(
          text.toUpperCase(),
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );

Widget bulidTaskItem(Map model) => 

Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      color: Color.fromARGB(255, 197, 197, 197),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${model['title']}',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '${model['description']}',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
