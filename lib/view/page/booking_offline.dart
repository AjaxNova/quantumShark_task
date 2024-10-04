import 'package:flutter/material.dart';
import 'package:quantum_sharks/constants/colors.dart';
import 'package:quantum_sharks/view/widget/slot_widget.dart';

import '../../server/api_services.dart';

class BookingAppointment extends StatefulWidget {
  const BookingAppointment({super.key});

  @override
  State<BookingAppointment> createState() => _BookingAppointmentState();
}

class _BookingAppointmentState extends State<BookingAppointment> {
  String selectedDate = 'Wed';
  String selectedSlot = '10:10 am';
  bool isLoading = false;

  void _bookAppointment(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    final apiService = ApiService();

    try {
      final response = await apiService.bookAppointment(
        patientID: "STP20240927-0001",
        name: "praveen test",
        appointmentDate: "2024-08-30",
        time: "10.30AM",
        type: "offline",
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.data['message']),
            duration: const Duration(seconds: 3),
          ),
        );
        setState(() {
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Something Went Wrong'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      final snackBar = SnackBar(
        content: Text(e.toString()),
        duration: const Duration(seconds: 3),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appBarBackgroundColor,
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Image(
                height: 25,
                width: 15,
                image: AssetImage('assets/appbar_arrowback.png')),
          ),
          title: const Text(
            "Booking Appoinment",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  ///month selecting container
                  const MonthSelectorWidget(),
                  // date selecting
                  daySelectWidget(),
                  ////slots
                  morningSlot(),
                  //afternoonSlots
                  afternoonSlots(),
                  ////evening slots
                  eveningSlots(),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      _bookAppointment(context);
                    },
                    child: Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: appBarBackgroundColor),
                      child: const Center(
                        child: Text(
                          'Confirm Appointment',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
      ),
    );
  }

  SizedBox eveningSlots() {
    return SizedBox(
      height: 130,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Evening  Slots",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Wrap(
                spacing: 30,
                runSpacing: 10,
                children: [
                  SlotWidget(
                    onTap: () {
                      if (selectedSlot != '04:00 pm') {
                        setState(() {
                          selectedSlot = '04:00 pm';
                        });
                      }
                    },
                    isSelectedSlot: selectedSlot == '04:00 pm',
                    time: '04:00 pm',
                  ),
                  SlotWidget(
                    onTap: () {
                      if (selectedSlot != '04:10 pm') {
                        setState(() {
                          selectedSlot = '04:10 pm';
                        });
                      }
                    },
                    isSelectedSlot: selectedSlot == '04:10 pm',
                    time: '04:10 pm',
                  ),
                  SlotWidget(
                    onTap: () {
                      if (selectedSlot != '04:20 pm') {
                        setState(() {
                          selectedSlot = '04:20 pm';
                        });
                      }
                    },
                    isSelectedSlot: selectedSlot == '04:20 pm',
                    time: '04:20 pm',
                  ),
                  SlotWidget(
                    onTap: () {
                      if (selectedSlot != '04:30 pm') {
                        setState(() {
                          selectedSlot = '04:30 pm';
                        });
                      }
                    },
                    isSelectedSlot: selectedSlot == '04:30 pm',
                    time: '04:30 pm',
                  ),
                  SlotWidget(
                    onTap: () {
                      if (selectedSlot != '04:40 pm') {
                        setState(() {
                          selectedSlot = '04:40 pm';
                        });
                      }
                    },
                    isSelectedSlot: selectedSlot == '04:40 pm',
                    time: '04:40 pm',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  SizedBox afternoonSlots() {
    return SizedBox(
      height: 90,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Afternoon Slots",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Wrap(
                spacing: 30,
                runSpacing: 10,
                children: [
                  SlotWidget(
                    time: '12:00 pm',
                    isSelectedSlot: selectedSlot == '12:00 pm',
                    onTap: () {
                      if (selectedSlot != '12:00 pm') {
                        setState(() {
                          selectedSlot = '12:00 pm';
                        });
                      }
                    },
                  ),
                  SlotWidget(
                    time: '12:10 pm',
                    isSelectedSlot: selectedSlot == '12:10 pm',
                    onTap: () {
                      if (selectedSlot != '12:10 pm') {
                        setState(() {
                          selectedSlot = '12:10 pm';
                        });
                      }
                    },
                  ),
                  SlotWidget(
                    time: '12:20 pm',
                    isSelectedSlot: selectedSlot == '12:20 pm',
                    onTap: () {
                      if (selectedSlot != '12:20 pm') {
                        setState(() {
                          selectedSlot = '12:20 pm';
                        });
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  SizedBox morningSlot() {
    return SizedBox(
      height: 130,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Morning Slots",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Wrap(
                spacing: 30,
                runSpacing: 10,
                children: [
                  SlotWidget(
                    isSelectedSlot: selectedSlot == '10:00 am',
                    onTap: () {
                      if (selectedSlot != '10:00 am') {
                        setState(() {
                          selectedSlot = '10:00 am';
                        });
                      }
                    },
                    time: '10:00 am',
                  ),
                  SlotWidget(
                    isSelectedSlot: selectedSlot == '10:10 am',
                    onTap: () {
                      if (selectedSlot != '10:10 am') {
                        setState(() {
                          selectedSlot = '10:10 am';
                        });
                      }
                    },
                    time: '10:10 am',
                  ),
                  SlotWidget(
                    isSelectedSlot: selectedSlot == '10:20 am',
                    onTap: () {
                      if (selectedSlot != '10:20 am') {
                        setState(() {
                          selectedSlot = '10:20 am';
                        });
                      }
                    },
                    time: '10:20 am',
                  ),
                  SlotWidget(
                    isSelectedSlot: selectedSlot == '10:30 am',
                    onTap: () {
                      if (selectedSlot != '10:30 am') {
                        setState(() {
                          selectedSlot = '10:30 am';
                        });
                      }
                    },
                    time: '10:30 am',
                  ),
                  SlotWidget(
                    isSelectedSlot: selectedSlot == '10:40 am',
                    onTap: () {
                      if (selectedSlot != '10:40 am') {
                        setState(() {
                          selectedSlot = '10:40 am';
                        });
                      }
                    },
                    time: '10:40 am',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container daySelectWidget() {
    return Container(
      decoration:
          const BoxDecoration(border: Border(bottom: BorderSide(width: .1))),
      height: 120,
      child: Padding(
        padding: const EdgeInsets.only(left: 14.0),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                if (selectedDate != 'Sun') {
                  setState(() {
                    selectedDate = 'Sun';
                  });
                }
              },
              child: DateContainer(
                isSelected: selectedDate == 'Sun',
                date: '01',
                day: 'Sun',
              ),
            ),
            GestureDetector(
              onTap: () {
                if (selectedDate != 'Mon') {
                  setState(() {
                    selectedDate = 'Mon';
                  });
                }
              },
              child: DateContainer(
                isSelected: selectedDate == 'Mon',
                date: '02',
                day: 'Mon',
              ),
            ),
            GestureDetector(
              onTap: () {
                if (selectedDate != 'Tue') {
                  setState(() {
                    selectedDate = 'Tue';
                  });
                }
              },
              child: DateContainer(
                isSelected: selectedDate == 'Tue',
                date: '03',
                day: 'Tue',
              ),
            ),
            GestureDetector(
              onTap: () {
                if (selectedDate != 'Wed') {
                  setState(() {
                    selectedDate = 'Wed';
                  });
                }
              },
              child: DateContainer(
                isSelected: selectedDate == 'Wed',
                date: '04',
                day: 'Wed',
              ),
            ),
            GestureDetector(
              onTap: () {
                if (selectedDate != 'Thu') {
                  setState(() {
                    selectedDate = 'Thu';
                  });
                }
              },
              child: DateContainer(
                isSelected: selectedDate == 'Thu',
                date: '05',
                day: 'Thu',
              ),
            ),
            GestureDetector(
              onTap: () {
                if (selectedDate != 'Fri') {
                  setState(() {
                    selectedDate = 'Fri';
                  });
                }
              },
              child: DateContainer(
                isSelected: selectedDate == 'Fri',
                date: '06',
                day: 'Fri',
              ),
            ),
            GestureDetector(
              onTap: () {
                if (selectedDate != 'Sat') {
                  setState(() {
                    selectedDate = 'Sat';
                  });
                }
              },
              child: DateContainer(
                isSelected: selectedDate == 'Sat',
                date: '07',
                day: 'Sat',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MonthSelectorWidget extends StatelessWidget {
  const MonthSelectorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: secondaryColor,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.calendar_today,
              color: Colors.grey,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "August",
                style: TextStyle(
                    color: appBarBackgroundColor,
                    fontSize: 21,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Image(image: AssetImage('assets/arrow_down_small.png'))
          ],
        ),
      ),
    );
  }
}

class DateContainer extends StatefulWidget {
  const DateContainer(
      {super.key,
      required this.day,
      required this.date,
      this.isSelected = false});
  final bool isSelected;

  final String day;
  final String date;

  @override
  State<DateContainer> createState() => _DateContainerState();
}

class _DateContainerState extends State<DateContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: widget.isSelected ? appBarBackgroundColor : null,
      ),
      height: 90,
      width: widget.isSelected ? 60 : 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            widget.day,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: widget.isSelected ? Colors.white : null),
          ),
          Text(
            widget.date,
            style: TextStyle(
              color: widget.isSelected ? Colors.white : dayTextColor,
              fontSize: 18,
            ),
          )
        ],
      ),
    );
  }
}
