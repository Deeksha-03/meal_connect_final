import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:meal_connect/core/app_export.dart';
//import 'package:meal_connect/presentation/ngo_order_list_page/ngo_order_list_page.dart';
import 'package:meal_connect/presentation/ngo_order_list_screen/ngo_order_list_screen.dart';
import 'package:meal_connect/presentation/profile_other_screen/profile_other_screen.dart';
import 'package:meal_connect/widgets/app_bar/appbar_subtitle_three.dart';
import 'package:meal_connect/widgets/app_bar/appbar_title.dart';
import 'package:meal_connect/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:meal_connect/widgets/app_bar/custom_app_bar.dart';
import 'package:meal_connect/widgets/custom_bottom_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/custom_outlined_button.dart';

class NotificationsNoNotiScreen extends StatefulWidget {
  NotificationsNoNotiScreen({Key? key}) : super(key: key);

  @override
  _NotificationsNoNotiScreenState createState() =>
      _NotificationsNoNotiScreenState();
}


class _NotificationsNoNotiScreenState extends State<NotificationsNoNotiScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  String orderAddress = '';

  @override
  void initState() {
    super.initState();
    fetchData(); // Call your fetchData function when the screen initializes.
  }
  String orderId = '';
  String address = '';
  String contributor = '';
  String date = '';
  String meals = '';
  String phno = '';
  String ngoName = '';
  String time = '';
  int orderLength = 0;

  void fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? regNo = prefs.getString('reg_no');
    String? ngo_name = prefs.getString('ngo_name');
    print(regNo);
    print(ngo_name);

    DatabaseReference reference = FirebaseDatabase.instance.ref();
    Query query =
    reference.child('Order').orderByChild('ngoName').equalTo(ngo_name);

    DatabaseEvent event = await query.once();
    print(event);

    if (event.snapshot.value == null) {
      if (mounted) {
        setState(() {
          orderLength = 0;
        });
      }
    } else {
      Map<String, dynamic> orderData =
      event.snapshot.value as Map<String, dynamic>;

      if (mounted) {
        setState(() {
          orderLength = orderData.length;
          print("length");
          print(orderLength);
          orderData.forEach((key, value) {
            orderId = key;
            address = value['address'];
            contributor = value['contributor'];
            date = value['date'];
            meals = value['meals'];
            ngoName = value['ngoName'];
            phno = value['phno'];
            time = value['time'];

            // Access the specific fields
            print('Order ID: $orderId');
            print('Address: $address');
            print('Contributor: $contributor');
            print('Date: $date');
            print('Meals: $meals');
            print('Ngo Name: $ngoName');
            print('Phone Number: $phno');
            print('Time: $time');
          });
        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(top: 149.v),
          child: orderLength == 0
              ? _buildNoNotificationWidget()
              : _buildOrderDetailsWidget(),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  Widget _buildNoNotificationWidget() {
    return Column(
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgGroup2180Primary,
          height: 188.v,
          width: 194.h,
        ),
        SizedBox(height: 44.v),
        Text(
          "You have no notification.",
          style: CustomTextStyles.headlineSmallGray500,
        ),
        SizedBox(height: 5.v),
      ],
    );
  }

  Widget _buildOrderDetailsWidget() {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
        children: [
          _buildText(),
        ],
      ),
    );
  }

  Widget _buildText() {
    return Container(
      padding: EdgeInsets.all(8.0), // Adjust vertical padding as needed
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.0), // Border around the entire text container
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
        children: [
          _buildTextItem('Order ID: $orderId'),
          _buildTextItem('Address: $address'),
          _buildTextItem('Contributor: $contributor'),
          _buildTextItem('Date: $date'),
          _buildTextItem('Meals: $meals'),
          _buildTextItem('Phone Number: $phno'),
          _buildTextItem('Time: $time'),
          SizedBox(height: 16.0), // Add some space between text and button
          _buildButton(),
        ],
      ),
    );
  }

  Widget _buildTextItem(String text) {
    return Text(
      text,
      style: TextStyle(color: Colors.black), // Set text color to black
    );
  }

  Widget _buildButton() {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.black, width: 1.0)), // Top border for the button
      ),
      child: CustomOutlinedButton(
        height: 34.v,
        width: 120.h,
        text: "Pending",
        margin: EdgeInsets.only(left: 12.h, top: 5.v, bottom: 7.v),
        buttonStyle: CustomButtonStyles.outlinePrimary,
        onPressed: () async {
          // Handle button click
          await deleteOrder(); // Call the function to delete the order
        },

      ),
    );
  }



  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: Padding(
        padding: EdgeInsets.only(left: 38.h),
        child: Row(
          children: [
            AppbarSubtitleThree(
              text: "MEAL\nCONNECT",
            ),
            AppbarTitle(
              text: "Notifiication",
              margin: EdgeInsets.only(
                left: 38.h,
                top: 4.v,
              ),
            ),
          ],
        ),
      ),
      actions: [
        AppbarTrailingIconbutton(
          imagePath: ImageConstant.imgMoreVertical,
          margin: EdgeInsets.symmetric(
            horizontal: 38.h,
            vertical: 11.v,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onTap: (BottomBarEnum type) {
        Navigator.pushNamed(
          context,
          getCurrentRoute(type),

        );
      },
    );
  }
  Future<void> deleteOrder() async {
    DatabaseReference reference = FirebaseDatabase.instance.ref();

    // Assuming orderId is the unique identifier for the order you want to delete
    await reference.child('Order').child(orderId).remove();

    // Optionally, you can update the UI or perform any additional tasks after deletion
    if (mounted) {
      setState(() {
        // Update the UI if needed
        orderLength = 0; // Set orderLength to 0 to reflect the order deletion
      });
    }
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Explore:
        return AppRoutes.ngoOrderListScreen;
      case BottomBarEnum.Ngo:
        return AppRoutes.profileOtherOneScreen;
      case BottomBarEnum.Notification:
        return AppRoutes.notificationsNoNotiScreen;
      case BottomBarEnum.Profile:
        return AppRoutes.profileOtherOneScreen;
      default:
        return "/";
    }
  }

  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.ngoOrderListScreen:
        return NgoOrderListScreen();
      case AppRoutes.profileOtherOneScreen:
        return ProfileOtherScreen();
      case AppRoutes.notificationsNoNotiScreen:
        return NotificationsNoNotiScreen();
      default:
        return DefaultWidget();
    }
  }
}
