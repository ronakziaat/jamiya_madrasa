import 'package:flutter/material.dart';
import 'package:get/get.dart';

/*class ParentAttendanceController extends GetxController{
  DateTime? month;

  String monthDisplay(DateTime date) {
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year.toString();
    return "$month/$year";
  }
  RxInt count=0.obs;
  var selectedValue = "Select an option".obs; // Default selected value
  List<String> items = ["Child 1", "Child 2", "Child 3", "Child 4"];

  void setSelected(String value) {
    selectedValue.value = value;
  }

}*/


class ParentAttendanceController extends GetxController {
  Rxn<DateTime> month = Rxn<DateTime>(); // ✅ Make it reactive


  Rx<DateTime> selectedMonth = DateTime.now().obs;
  RxList<int> attendanceDays = <int>[].obs;
  RxList<int> leaveDays = <int>[].obs;

  void setMonth(DateTime newMonth) {
    selectedMonth.value = newMonth;
    loadAttendanceData();
  }

  void loadAttendanceData() {
    // if (selectedMonth.value.month == DateTime.now().month) {
      attendanceDays.value = [1, 3, 5, 10, 12, 15, 20];
      leaveDays.value=[2,9,14];
    // } else {
    //   attendanceDays.clear();
    //   leaveDays.clear();
    // }
  }





  String monthDisplay(DateTime date) {
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year.toString();
    return "$month/$year";
  }
  RxInt count=0.obs;
  var selectedValue = "Select an option".obs; // Default selected value
  List<String> items = ["Child 1", "Child 2", "Child 3", "Child 4"];


 /* void setMonth(DateTime selectedMonth) {
    month.value = selectedMonth; // ✅ Update value reactively
  }*/
  void setSelected(String value) {
    selectedValue.value = value;
  }

  final GlobalKey buttonKey = GlobalKey();
  RxString selectedView = "Child 1".obs;
  List<String> popupMenuItems = [
    "Child 1",
    "Child 2",
    "Child 3",
    "Child 4",
    "Child 5",
    "Child 6",
  ];

  void showPopupMenu({required BuildContext context}) {
    Future.delayed(Duration.zero, () {
      final BuildContext? buttonContext = buttonKey.currentContext;
      if (buttonContext == null) {
        print("Button context is null");
        return;
      }
      final RenderBox? renderBox =
      buttonContext.findRenderObject() as RenderBox?;
      if (renderBox == null) {
        print("RenderBox is null");
        return;
      }
      final RenderBox overlay =
      Overlay.of(context).context.findRenderObject() as RenderBox;
      final Offset position = renderBox.localToGlobal(
        Offset.zero,
        ancestor: overlay,
      );
      showMenu(
        context: context,
        position: RelativeRect.fromLTRB(
          position.dx,
          position.dy + renderBox.size.height,
          position.dx + renderBox.size.width,
          position.dy + renderBox.size.height + 200,
        ),
        elevation: 8.0,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        items:
        popupMenuItems.asMap().entries.map((entry) {
          return PopupMenuItem<String>(
            value: entry.value,
            child: Row(
              children: [
                const SizedBox(width: 10),
                Text(entry.value),
              ],
            ),
          );
        }).toList(),
      ).then((value) {
        if (value != null) {
          selectedView.value = value;
          update();
        }
      });
    });
  }

}

