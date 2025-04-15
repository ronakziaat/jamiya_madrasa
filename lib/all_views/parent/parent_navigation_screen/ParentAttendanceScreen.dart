import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jamia_madrasa/all_controllers/ParentAttendanceController.dart';
import 'package:jamia_madrasa/themes/app_them_data.dart';
import 'package:month_selector/month_selector.dart';

class ParentAttendanceScreen extends StatelessWidget {
  const ParentAttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final AttendanceController controller1 = Get.put(AttendanceController());

    return GetX<ParentAttendanceController>(
        init: ParentAttendanceController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppThemeData.pageBg,
            body: SafeArea(
              child: Container(
                decoration: BoxDecoration(
                  gradient: AppThemeData.firstAppGradient,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 30),

                    // Dropdown for selecting child
                    Center(
                      child: Container(

                        padding: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.black,width: 0.5,)
                        ),
                        child: GestureDetector(
                          key: controller.buttonKey,
                            onTap: (){
                              controller.showPopupMenu(context: context);
                              },
                            child: Container(
                            padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                                child: Text(controller.selectedView.value)
                            )),
                      ),
                    ),

                    SizedBox(height: 15),

                    // Month Picker Button
                    Row(
                      children: [
                        SizedBox(width: 20,),
                        GestureDetector(
                            onTap: () {
                              _showMonthPicker(context, controller);
                            },
                            child:  Text(
                                "${DateFormat.yMMMM().format(controller.selectedMonth.value)}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,fontWeight: FontWeight.bold
                                ),
                              ),

                          ),
                      ],
                    ),


                    // Calendar View
                    Expanded(
                      child: Obx(
                            () => CalendarWidget(
                          month: controller.selectedMonth.value,
                          attendanceDays: controller.attendanceDays,
                              leaveDays: controller.leaveDays,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  void _showMonthPicker(BuildContext context, ParentAttendanceController controller) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 250,
          color: Color.fromRGBO(254,250,189,0.2),
          child: Column(
            children: [
              // Done Button
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text("Done", style: TextStyle(fontSize: 18,color: Colors.blue)),
                  ),
                ),
              ),

              // Cupertino Date Picker for Month & Year ONLY
              Expanded(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.monthYear, // Month & Year Only
                  initialDateTime: controller.selectedMonth.value,
                  minimumDate: DateTime(2020, 1),
                  maximumDate: DateTime.now(),
                  onDateTimeChanged: (DateTime newDate) {
                    controller.setMonth(newDate);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// Calendar Widget
class CalendarWidget extends StatelessWidget {
  final DateTime month;
  final List<int> attendanceDays;
  final List<int> leaveDays;

  const CalendarWidget({required this.month, required this.attendanceDays,required this.leaveDays});

  @override
  Widget build(BuildContext context) {
    int daysInMonth = DateTime(month.year, month.month + 1, 0).day;
    int firstWeekday = DateTime(month.year, month.month, 1).weekday % 7;
    int today = DateTime.now().day;
    int currentMonth = DateTime.now().month;
    int currentYear = DateTime.now().year;
    List<String> weekDays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    List<int> sundayLeaveDays = [];
    for (int day = 1; day <= daysInMonth; day++) {
      if (DateTime(month.year, month.month, day).weekday == DateTime.sunday) {
        sundayLeaveDays.add(day);
      }
    }
    return Container(
      height: 300,
      decoration: BoxDecoration(color: Colors.white,border: Border.all(color: Colors.black,width: 1),borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.only(bottom: 10,left: 10,right: 10,top: 5),
      child: Column(
        children: [
          // Weekday Row
          Padding(
            padding: const EdgeInsets.only(top: 5,left: 15,right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: weekDays
                  .map((day) => Expanded(
                child: Text(
                  day,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              )).toList(),
            ),
          ),

          // Calendar Grid
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.only(left: 20,right: 20,top: 5),
              itemCount: daysInMonth + firstWeekday, // Adjust for empty spaces
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7, // 7 columns for days of the week
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemBuilder: (context, index) {
                if (index < firstWeekday) {
                  return Container(); // Empty container for spacing
                }

                int day = index - firstWeekday + 1;
                bool attended = attendanceDays.contains(day);
                bool leave = leaveDays.contains(day);
                bool isToday =
                (day == today && month.month == currentMonth && month.year == currentYear);

                return Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isToday
                        ? Colors.blue[300] // Highlight today
                        : leave
                        ? Colors.red[300] // Leave days
                        : attended
                        ? Colors.green[300] // Attended days
                        : Colors.white, // Non-attended days
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    day.toString(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: attended || isToday || leave ? Colors.white : Colors.black,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

