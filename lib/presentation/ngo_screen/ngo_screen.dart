import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:meal_connect/core/app_export.dart';
import 'package:meal_connect/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:meal_connect/widgets/app_bar/appbar_title.dart';
import 'package:meal_connect/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:meal_connect/widgets/app_bar/custom_app_bar.dart';
import 'package:meal_connect/widgets/custom_bottom_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NgoScreen extends StatefulWidget {
  const NgoScreen({Key? key}) : super(key: key);

  @override
  _NgoScreenState createState() => _NgoScreenState();
}

class _NgoScreenState extends State<NgoScreen> {
  DatabaseReference _databaseReference =
  FirebaseDatabase.instance.ref().child('verified_ngos');

  List<String> ngoNames = [];
  String location = "";

  @override
  void initState() {
    super.initState();

    _fetchNgoNames();
  }

  // Future<void> _fetchNgoNames() async {
  //   try {
  //     DataSnapshot snapshot = await _databaseReference.get();
  //     dynamic data = snapshot.value;
  //     print(data);
  //
  //     if (data != null && data is Map<dynamic, dynamic>) {
  //       List<String> names = [];
  //       data.forEach((key, value) {
  //         if (value is Map<String, dynamic>) {
  //           String name = value['name'] ?? '';
  //           names.add(name);
  //         }
  //       });
  //
  //       setState(() {
  //         ngoNames = names;
  //       });
  //       print(ngoNames);
  //     }
  //   } catch (error) {
  //     print("Error fetching NGO names: $error");
  //   }
  // }

  Future<void> _fetchNgoNames() async {
    print("called");
    String? result = await fetchData();
    print(result);

    try {
      DataSnapshot snapshot = await _databaseReference.get();
      dynamic data = snapshot.value;

      if (data != null && data is Map<dynamic, dynamic>) {
        List<String> names = [];
        data.forEach((key, value) {
          if (value is Map<String, dynamic>) {
            String name = value['name'] ?? '';
            String ngoLocation = value['area'] ?? '';

            // Check if the NGO's location matches the selected location
            print(location);
            if (result != null && ngoLocation.toLowerCase() == result.toLowerCase()) {
              names.add(name);
            }
          }
        });

        setState(() {
          ngoNames = names;
        });
        print(ngoNames);
      }
    } catch (error) {
      print("Error fetching NGO names: $error");
    }
  }

  Future<String?> fetchData() async {
    print("called2");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userName = prefs.getString('user_email');
    String? location = prefs.getString('selected_location') ?? "";
    print(userName);
    print(location);
    return location;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(  // Wrap the body in SingleChildScrollView
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 49.v),
              _buildUserProfile(context),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 94.v,
      title: Padding(
        padding: EdgeInsets.only(left: 38.h),
        child: Row(
          children: [
            AppbarSubtitleTwo(text: "MEAL\nCONNECT"),
            AppbarTitle(
              text: "NGO’s",
              margin: EdgeInsets.only(left: 39.h, top: 4.v),
            ),
          ],
        ),
      ),
      actions: [
        AppbarTrailingIconbutton(
          imagePath: ImageConstant.imgNgoLogo,
          margin: EdgeInsets.fromLTRB(38.h, 38.v, 38.h, 22.v),
        ),
      ],
      styleType: Style.bgFill,
    );
  }

  Widget _buildUserProfile(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 29.h),
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(height: 26.v);
        },
        itemCount: ngoNames.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              onTapUserProfile(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8.v),
              decoration: AppDecoration.outlineBluegray10002.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgNgoLogo,
                    height: 67.v,
                    width: 70.h,
                    margin: EdgeInsets.only(top: 1.v),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.v),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ngoNames[index],  // Displaying actual NGO name
                          style: CustomTextStyles.titleSmallSemiBold_1,
                        ),
                        SizedBox(height: 9.v),
                        SizedBox(
                          width: 224.h,
                          child: Text(
                            "Quis odio magna aliquet hac est ultrices. Sed ut tincidunt fames nibh.",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: CustomTextStyles.labelMediumMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }


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

  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Explore:
        return AppRoutes.homePageExtendedOneScreen;
      case BottomBarEnum.Ngo:
        return AppRoutes.ngoScreen;
      case BottomBarEnum.Notification:
        return AppRoutes.notificationUserScreen;
      case BottomBarEnum.Profile:
        return AppRoutes.profileUserScreen;
      default:
        return "/";
    }
  }

  onTapUserProfile(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.profileOtherScreen);
  }
}