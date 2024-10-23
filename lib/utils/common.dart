import 'dart:io';

import 'package:MovieDiscoveryApp/utils/validator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import 'package:pin_code_fields/pin_code_fields.dart';
import 'app_colors.dart';
import 'font_textstyle.dart';

class Common {

  static bool onChatScreen = false;
  static displayHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double displayWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static void removeFocus(BuildContext context) {
    var removeFocus = FocusScope.of(context).requestFocus(FocusNode());
    return removeFocus;
  }

 static String hideUsername(String username) {
    if (username == 'null' || username.isEmpty) {
      return ''; // Handle empty or null username
    }

    // Determine the number of visible characters at the start and end of the username
    int visibleCharsCount = 1; // Number of visible characters at the start (e.g., 'J')
    int hiddenCharsCount = username.length - visibleCharsCount; // Number of hidden characters

    // Create a masked username string using substring and string interpolation
    String maskedUsername = '${username.substring(0, visibleCharsCount)}${'*' * hiddenCharsCount}';

    return maskedUsername;
  }

  static OutlineInputBorder textFieldOutlinedInputBorder = OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(12.0),
  );

  static OutlineInputBorder errordOutlinedInputBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      color: Colors.white,
      width: 2,
    ),
    borderRadius: BorderRadius.circular(12.0),
  );

  static backButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: const Image(
        image: AssetImage(""),
        width: 20,
        height: 20,
      ),
    );
  }

  static OutlineInputBorder inputBorder = const OutlineInputBorder(
    // borderSide: BorderSide(color: Colors.textFieldBorder),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  );

  static LinearGradient linearGradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    // stops: [0.1, 0.4, 0.6, 0.9],
    colors: [AppColors.orangeLinearGradient, AppColors.purpleLinearGradient],
  );

  static LinearGradient linearGradientForButtonOrange = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    // stops: [0.1, 0.4, 0.6, 0.9],
    colors: [AppColors.purple, AppColors.purple],
  );

  static LinearGradient linearGradientForButtonBlue = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    // stops: [0.1, 0.4, 0.6, 0.9],
    colors: [
      AppColors.elevatedButtonLinGrad2,
      AppColors.elevatedButtonLinGrad1
    ],
  );

  static LinearGradient linearGradientForButtonDisable = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    // stops: [0.1, 0.4, 0.6, 0.9],
    colors: [
      AppColors.lightGrey,
      AppColors.lightGrey
    ],
  );

  static LinearGradient linearGradientForButtonBlack = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    // stops: [0.1, 0.4, 0.6, 0.9],
    colors: [AppColors.elevatedButtonblack, AppColors.elevatedButtonblack],
  );

  static LinearGradient linearGradientForButtonPink = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    // stops: [0.1, 0.4, 0.6, 0.9],
    colors: [AppColors.purpleLinearGradient, AppColors.purpleLinearGradient],
  );

  static pinCodeTextField(
      BuildContext context, TextEditingController controller) {
    return PinCodeTextField(
      keyboardType: TextInputType.number,
      inputFormatters: [Validations.numbersFilterFormat],
      length: 6,
      obscureText: false,
      animationType: AnimationType.fade,
      textStyle: FontTextStyle.textStyle18bold(AppColors.textWhite),
      pinTheme: PinTheme(
        activeColor: Colors.white,
        borderWidth: 1,
        disabledColor: Colors.white,
        inactiveColor: Colors.white,
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 60,
        fieldWidth: 45,
        selectedFillColor: Colors.white,
        activeFillColor: AppColors.elevatedButtonLinGrad2,
        inactiveFillColor: Colors.transparent,
      ),
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      cursorColor: Colors.deepPurple,
      controller: controller,
      onCompleted: (v) {
        // print("Completed");
      },
      onChanged: (value) {
        // print(value);
        // setState(() {
        //   currentText = value;
        // });
      },
      appContext: context,
      // validator: (value) {
      //   return Validations.otp4Validator(value!, controller.text);
      // },
    );
  }

  static showSnackBar(String message, BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(
            label: 'close',
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            }),
      ),
    );
  }

  static Image appIcon(BuildContext context) {
    return Image(
      image: const AssetImage(""),
      width: Common.displayWidth(context) * 0.35,
      height: Common.displayWidth(context) * 0.35,
    );
  }

  static Container elevatedButton1(BuildContext context, String text,
      LinearGradient linearGradient, VoidCallback onPressed, {TextStyle? style}) {
    return Container(
      width: double.infinity,
      // height: height,
      decoration: BoxDecoration(
        gradient: linearGradient,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
              side: const BorderSide(
                width: 1,
                color: AppColors.borderWhite,
              ),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
          child: Text(text,
              style: style ?? FontTextStyle.textStyle16bold(AppColors.textWhite)),
        ),
      ),
    );
  }

  static Container elevatedButtonShort(BuildContext context, String text,
      LinearGradient linearGradient, VoidCallback onPressed, {TextStyle? style} ) {
    return Container(
      // width: double.infinity,
      // height: height,
      decoration: BoxDecoration(
        gradient: linearGradient,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
              side: const BorderSide(
                width: 1,
                color: AppColors.borderWhite,
              ),
            ),
          ),
        ),
        child: Text(
          text,
          style: style ?? FontTextStyle.textStyle10bold(AppColors.textWhite),
        ),
      ),
    );
  }

  static ElevatedButton elevatedButtonNonLinear(
      BuildContext context, String text, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(color),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            // side: BorderSide(
            //   width: 1,
            //   color: AppColors.borderWhite,
            // ),
          ),
        ),
      ),
      child: Text(
        text,
        style: FontTextStyle.textStyle10sem(AppColors.textWhite),
      ),
    );
  }

  static ElevatedButton elevatedButtonWithBorder({String? text, Color? textColor,
    Color? borderColor, Color? color, VoidCallback? onPressed, TextStyle? textStyle}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        elevation: WidgetStateProperty.all(0),
        backgroundColor: WidgetStateProperty.all(color),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0),
            side: BorderSide(
              width: 2,
              color: borderColor!,
            ),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text!,
          style: textStyle ?? FontTextStyle.textStyle12bold(textColor!),
        ),
      ),
    );
  }

  static AlertDialog alertDialog(BuildContext context, String title,
      String buttonText1, String buttonText2, VoidCallback onTap) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 17)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: onTap,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.textWhite, width: 2),
                  gradient: Common.linearGradientForButtonBlue,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.dropShadow1.withOpacity(0.2),
                      spreadRadius: 4,
                      blurRadius: 4,
                      offset: const Offset(0, 3),
                    )
                  ]),
              child: Center(
                child: Text(
                  buttonText1,
                  textAlign: TextAlign.left,
                  style: FontTextStyle.textStyle14sem(AppColors.textWhite),
                ),
              ),
            ),
          ),
          SizedBox(height: Common.displayHeight(context) * 0.02),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Text(
              buttonText2,
              // textAlign: TextAlign.left,
              style: FontTextStyle.textStyle14sem(AppColors.textBlack),
            ),
          ),
        ],
      ),
    );
  }


  static Container elevatedButtonRounded(BuildContext context, String text,
      Color color, VoidCallback onPressed, {TextStyle? style} ) {
    return Container(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
            backgroundColor: const Color(0xffcc3300),
            shape: const StadiumBorder(),
            textStyle: FontTextStyle.textStyle10bold(AppColors.textWhite)),
        child: Text(
          text,
          style: style ?? FontTextStyle.textStyle18reg(AppColors.textWhite),
        ),
      ),
    );
  }

  static AlertDialog alertDialogProfile(BuildContext context, String title,
      String buttonText1, String buttonText2, VoidCallback onTap) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text(title, textAlign: TextAlign.center),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: onTap,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.textWhite, width: 2),
                  gradient: Common.linearGradientForButtonBlue,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.dropShadow1.withOpacity(0.2),
                      spreadRadius: 4,
                      blurRadius: 4,
                      offset: const Offset(0, 3),
                    )
                  ]),
              child: Center(
                child: Text(
                  buttonText1,
                  textAlign: TextAlign.left,
                  style: FontTextStyle.textStyle14sem(AppColors.textWhite),
                ),
              ),
            ),
          ),
          SizedBox(height: Common.displayHeight(context) * 0.02),
          // GestureDetector(
          //   onTap: () {
          //     Navigator.of(context).pop();
          //   },
          //   child: Text(
          //     buttonText2,
          //     // textAlign: TextAlign.left,
          //     style: FontTextStyle.textStyle14bold(AppColors.textBlack),
          //   ),
          // ),
          SizedBox(
            height: Common.displayHeight(context) * 0.043,
            width: Common.displayWidth(context) * 0.34,
            child: Common.elevatedButtonShort(
              context,
              'nahIAmGood'.tr(),
              Common.linearGradientForButtonBlue,
                  () {
                Navigator.of(context).pop();
              },
              style: TextStyle(
                fontSize: Common.displayWidth(context) * 0.022,
                color: AppColors.textWhite,
                fontFamily: FontTextStyle.fontFamily,
                fontWeight: FontTextStyle.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }


  static AlertDialog alertDialogUploadImage(BuildContext context, String title,
      String buttonText1, String buttonText2,File? image, VoidCallback onTap) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text(title, textAlign: TextAlign.center),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(child:Material(
  elevation: 10,
  borderRadius: BorderRadius.circular(1000),
  child: CircleAvatar(
    backgroundColor: Colors.white,
    radius: Common.displayWidth(context) * 0.152,
    child: CircleAvatar(
      radius: Common.displayWidth(context) * 0.15,
      child: ClipOval(
        child: FadeInImage(
          placeholder: const AssetImage(""),
          image: FileImage(image!),
          width: 200,
          height: 200,
          fit: BoxFit.cover,
        ),
      ),
    ),
  ),
),),
          SizedBox(height: Common.displayHeight(context) * 0.02),
          InkWell(
            onTap: onTap,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.textWhite, width: 2),
                  gradient: Common.linearGradientForButtonBlue,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.dropShadow1.withOpacity(0.2),
                      spreadRadius: 4,
                      blurRadius: 4,
                      offset: const Offset(0, 3),
                    )
                  ]),
              child: Center(
                child: Text(
                  buttonText1,
                  textAlign: TextAlign.left,
                  style: FontTextStyle.textStyle14sem(AppColors.textWhite),
                ),
              ),
            ),
          ),
          SizedBox(height: Common.displayHeight(context) * 0.02),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Text(
              buttonText2,
              // textAlign: TextAlign.left,
              style: FontTextStyle.textStyle14bold(AppColors.textBlack),
            ),
          ),
        ],
      ),
    );
  }


  static AlertDialog alertDialogFilterdistance(BuildContext context, String title,
      String buttonText1, String buttonText2, List<String> itemList, void Function(int)? onItemSelected, VoidCallback onTap) {
    int selectedItemIndex = 0; // Track the selected item index

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text(title, textAlign: TextAlign.center),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: Common.displayHeight(context) * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // List with radio buttons
              Container(
                width: 200,
                height: 200,// Set a specific width
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: itemList.length,
                  itemBuilder: (context, index) {
                    return RadioListTile<int>(
                      title: Text(itemList[index]),
                      value: index,
                      groupValue: selectedItemIndex,
                      onChanged: (int? value) {
                        if (value != null) {
                          //selectedItemIndex = value;
                          onItemSelected?.call(value);
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: Common.displayHeight(context) * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Yes button
              InkWell(
                onTap: onTap,
                child: Container(
                  height: 60,
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.textWhite, width: 2),
                    gradient: Common.linearGradientForButtonBlue,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.dropShadow1.withOpacity(0.2),
                        spreadRadius: 4,
                        blurRadius: 4,
                        offset: const Offset(0, 3),
                      )
                    ],
                  ),
                  child: Center(
                    child: Text(
                      buttonText1,
                      style: FontTextStyle.textStyle14sem(AppColors.textWhite),
                    ),
                  ),
                ),
              ),
              SizedBox(width: Common.displayWidth(context) * 0.02),
              // No button
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  buttonText2,
                  style: FontTextStyle.textStyle14bold(AppColors.textBlack),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }



  static AlertDialog alertDialogOneButton(BuildContext context, String title,
      String buttonText1, VoidCallback onTap) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text(title, textAlign: TextAlign.center),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          InkWell(
            onTap: onTap,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.textWhite, width: 2),
                  gradient: Common.linearGradientForButtonBlue,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.dropShadow1.withOpacity(0.2),
                      spreadRadius: 4,
                      blurRadius: 4,
                      offset: const Offset(0, 3),
                    )
                  ]),
              child: Center(
                child: Text(
                  buttonText1,
                  textAlign: TextAlign.left,
                  style: FontTextStyle.textStyle14sem(AppColors.textWhite),
                ),
              ),
            ),
          ),
          SizedBox(height: Common.displayHeight(context) * 0.02),
        ],
      ),
    );
  }

  static AlertDialog alertDialogThreeBuyButton(BuildContext context, String title,
      String buttonText1,String title2,String buttonText2, VoidCallback onTap,VoidCallback onTap2) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text(title, textAlign: TextAlign.center,style: const TextStyle(fontSize: 16),),
      content:
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          InkWell(
            onTap: onTap,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.textWhite, width: 2),
                  gradient: Common.linearGradientForButtonBlue,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.dropShadow1.withOpacity(0.2),
                      spreadRadius: 4,
                      blurRadius: 4,
                      offset: const Offset(0, 3),
                    )
                  ]),
              child: Center(
                child: Text(
                  buttonText1,
                  textAlign: TextAlign.left,
                  style: FontTextStyle.textStyle14sem(AppColors.textWhite),
                ),
              ),
            ),
          ),
          SizedBox(height: Common.displayHeight(context) * 0.02),
         Center(child: Text("OR",style: TextStyle(fontSize: 16,fontWeight: BasicSans.bold),),),
          SizedBox(height: Common.displayHeight(context) * 0.02),
           Text(title2,style: const TextStyle(fontSize: 16)),
          SizedBox(height: Common.displayHeight(context) * 0.02),
          InkWell(
            onTap: onTap2,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.textWhite, width: 2),
                  gradient: Common.linearGradientForButtonBlue,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.dropShadow1.withOpacity(0.2),
                      spreadRadius: 4,
                      blurRadius: 4,
                      offset: const Offset(0, 3),
                    )
                  ]),
              child: Center(
                child: Text(
                  buttonText2,
                  textAlign: TextAlign.left,
                  style: FontTextStyle.textStyle14sem(AppColors.textWhite),
                ),
              ),
            ),
          ),
          SizedBox(height: Common.displayHeight(context) * 0.02),
          SizedBox(
            height: Common.displayHeight(context) * 0.043,
            width: Common.displayWidth(context) * 0.34,
            child: Common.elevatedButtonShort(
              context,
              'nahIAmGood'.tr(),
              Common.linearGradientForButtonBlue,
                  () {
                Navigator.of(context).pop();
              },
              style: TextStyle(
                fontSize: Common.displayWidth(context) * 0.022,
                color: AppColors.textWhite,
                fontFamily: FontTextStyle.fontFamily,
                fontWeight: FontTextStyle.bold,
              ),
            ),
          ),
        ],
      ),

    );
  }


  static AlertDialog alertDialogPurchasePlan(BuildContext context, String title,
      String buttonText1, String buttonText2, VoidCallback onTap) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text(title, textAlign: TextAlign.center,style: const TextStyle(fontSize: 16),),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: onTap,
            child: Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.textWhite, width: 2),
                  gradient: Common.linearGradientForButtonBlue,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.dropShadow1.withOpacity(0.2),
                      spreadRadius: 4,
                      blurRadius: 4,
                      offset: const Offset(0, 3),
                    )
                  ]),
              child: Center(
                child: Text(
                  buttonText1,
                  textAlign: TextAlign.left,
                  style: FontTextStyle.textStyle14sem(AppColors.textWhite),
                ),
              ),
            ),
          ),
          SizedBox(height: Common.displayHeight(context) * 0.02),
      SizedBox(
        height: Common.displayHeight(context) * 0.043,
        width: Common.displayWidth(context) * 0.34,
        child: Common.elevatedButtonShort(
          context,
          'nahIAmGood'.tr(),
          Common.linearGradientForButtonBlue,
              () {
            Navigator.of(context).pop();
          },
          style: TextStyle(
            fontSize: Common.displayWidth(context) * 0.022,
            color: AppColors.textWhite,
            fontFamily: FontTextStyle.fontFamily,
            fontWeight: FontTextStyle.bold,
          ),
        ),
      ),
        ],
      ),
    );
  }

  static AlertDialog alertDialogTwoBuyButton(BuildContext context, String title,
      String buttonText,VoidCallback onTap) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text(title, textAlign: TextAlign.center,style: const TextStyle(fontSize: 16),),
      content:
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: Common.displayHeight(context) * 0.02),
          InkWell(
            onTap: onTap,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.textWhite, width: 2),
                  gradient: Common.linearGradientForButtonBlue,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.dropShadow1.withOpacity(0.2),
                      spreadRadius: 4,
                      blurRadius: 4,
                      offset: const Offset(0, 3),
                    )
                  ]),
              child: Center(
                child: Text(
                  buttonText,
                  textAlign: TextAlign.left,
                  style: FontTextStyle.textStyle14sem(AppColors.textWhite),
                ),
              ),
            ),
          ),
          SizedBox(height: Common.displayHeight(context) * 0.03),
          SizedBox(
            height: Common.displayHeight(context) * 0.043,
            width: Common.displayWidth(context) * 0.34,
            child: Common.elevatedButtonShort(
              context,
              'nahIAmGood'.tr(),
              Common.linearGradientForButtonBlue,
                  () {
                Navigator.of(context).pop();
              },
              style: TextStyle(
                fontSize: Common.displayWidth(context) * 0.022,
                color: AppColors.textWhite,
                fontFamily: FontTextStyle.fontFamily,
                fontWeight: FontTextStyle.bold,
              ),
            ),
          ),
        ],
      ),

    );
  }

  //Loading indicator
  static Widget loadingIndicator() {
    return  const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
              child: SizedBox(
            height: 80.0,
            width: 80.0,
            child: LoadingIndicator(
                indicatorType: Indicator.ballSpinFadeLoader,

                /// Required, The loading type of the widget
                colors: [
                  AppColors.pinkColor,
                  AppColors.purpleLinearGradient,
                  AppColors.elevatedButtonLinGrad2,
                  AppColors.orangeLinearGradient,
                ],

                /// Optional, The color collections
                strokeWidth: 5,

                /// Optional, The stroke of the line, only applicable to widget which contains line
                backgroundColor: Colors.transparent,

                /// Optional, Background of the widget
                pathBackgroundColor: Colors.blue

                /// Optional, the stroke backgroundColor
                ),
          )),
        ]);
  }



  static openCustomDialog(
      BuildContext context, String title, String message, VoidCallback func) {
    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: Platform.isIOS
                  ? CupertinoAlertDialog(
                      title: Center(
                        child: Text(title,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold)),
                      ),
                      content: Text(message),
                      actions: <Widget>[
                        TextButton(
                          onPressed: func,
                          child: const Text(
                            'Ok',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.orange,
                            ),
                          ),
                        ),
                      ],
                    )
                  : AlertDialog(
                      title: Center(
                        child: Text(title,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold)),
                      ),
                      content: Text(message),
                      actions: <Widget>[
                        TextButton(
                          onPressed: func,
                          child: const Text(
                            'Ok',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
        barrierDismissible: false,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {
          return const Text("");
        });
  }

  cardAddedDialog(context, String? title, VoidCallback onTap) {
    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
                opacity: a1.value,
                child: Dialog(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 18),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child:  const Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.close,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(title!,
                                  style: FontTextStyle.textStyle16med(
                                      Colors.white),
                                  textAlign: TextAlign.center),
                              const SizedBox(height: 20),
                              Column(
                                children: [
                                  SizedBox(
                                    width: 150,
                                    child: elevatedButtonShort(context, 'ok', linearGradient, () { }),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
        barrierDismissible: false,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {
          return const Text("");
        },
    );
  }

  static List<String> reportList = [
    'Scam',
    'Inappropriate for user view',
    'Potentially harmful for use',
    'Others',
  ];
  static int? isSelectedValue = -1;
  static String? reportReason;

  static reportCustomDialog(
      BuildContext context, dynamic data, int index, VoidCallback onTap) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (BuildContext context,
              StateSetter setState /*You can rename this!*/) {
            return Container(
              height: Common.displayHeight(context) / 2,
              color: Colors.transparent,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Common.displayWidth(context) * 0.03),
                child: Column(
                  children: [
                    SizedBox(height: Common.displayWidth(context) * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: Common.displayWidth(context) * 0.01),
                        Text(
                          'Choose Reason',
                          style: FontTextStyle.textStyle16bold(Colors.black),
                        ),
                        CupertinoButton(
                          onPressed: onTap,

                          // if (reportReason != null) {
                          //   BlocProvider.of<ReportRemarkBloc>(context).add(ReportRemarkRefreshEvent(
                          //     data.postreview![index].id.toString(),
                          //     reportReason,
                          //     index,
                          //   ));
                          // } else {
                          //   Fluttertoast.showToast(msg: Constants.pleaseSelectReportReason);
                          // }

                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 5.0,
                          ),
                          child: const Text('Done'),
                        ),
                      ],
                    ),
                    SizedBox(height: Common.displayWidth(context) * 0.03),
                    Expanded(
                      child: ListView.builder(
                          itemCount: reportList.length,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                ListTile(
                                  leading: IconButton(
                                    icon: isSelectedValue == index
                                        ? const Icon(Icons.check_box,
                                            color: Colors.black)
                                        : const Icon(
                                            Icons.check_box_outline_blank,
                                            color: Colors.black),
                                    onPressed: () {
                                      setState(() {
                                        isSelectedValue = index;
                                        reportReason = reportList[index];
                                      });
                                    },
                                  ),
                                  title: Text(reportList[index]).tr(),
                                ),
                                const Divider()
                              ],
                            );
                          }),
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }

}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}
