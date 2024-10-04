import 'package:flutter/material.dart';
import 'package:quantum_sharks/constants/colors.dart';
import 'package:quantum_sharks/server/api_services.dart';
import 'package:quantum_sharks/view/page/booking_offline.dart';
import 'package:quantum_sharks/view/widget/slot_widget.dart';

class BookingOnline extends StatefulWidget {
  const BookingOnline({super.key});

  @override
  State<BookingOnline> createState() => _BookingOnlineState();
}

class _BookingOnlineState extends State<BookingOnline> {
  String selectedDate = 'Wed';
  String selectedSlot = '10:00 am';

  bool isLoading = false;

  final List<Tab> tabs = [
    const Tab(
      text: 'Morning',
    ),
    const Tab(text: 'Afternoon'),
    const Tab(text: 'Evening'),
  ];

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
        type: "online",
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
    return DefaultTabController(
      length: 3,
      child: SafeArea(
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
              "Online Consult",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          body: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    const MonthSelectorWidget(),
                    daySelectWidget(),
                    Expanded(
                      child: Container(
                        color: secondaryColor,
                        child: Column(
                          children: [
                            const ListTile(
                              leading: Icon(Icons.av_timer),
                              title: Text('Availabel Slots'),
                            ),
                            TabBar(
                              tabs: tabs,
                              indicatorSize: TabBarIndicatorSize.label,
                              indicatorColor: appBarBackgroundColor,
                              labelColor: Colors.black,
                              labelStyle: const TextStyle(fontSize: 18),
                              unselectedLabelColor: Colors.black,
                            ),
                            Expanded(
                              child: Container(
                                color: secondaryColor,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: TabBarView(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 20.0),
                                            child: morningSlotsOnline(),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 20.0),
                                            child: morningSlotsOnline(),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 20.0),
                                            child: morningSlotsOnline(),
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        _bookAppointment(context);
                                      },
                                      child: Container(
                                        height: 50,
                                        width: 250,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6),
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
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }

  Wrap morningSlotsOnline() {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 30,
      runSpacing: 30,
      children: [
        SlotWidget(
          isSelectedSlot: selectedSlot == '10:00 am',
          isOnline: true,
          time: '10:00 am',
          onTap: () {
            if (selectedSlot != '10:00 am') {
              setState(() {
                selectedSlot = '10:00 am';
              });
            }
          },
        ),
        SlotWidget(
          isSelectedSlot: selectedSlot == '10:10 am',
          isOnline: true,
          time: '10:10 am',
          onTap: () {
            if (selectedSlot != '10:10 am') {
              setState(() {
                selectedSlot = '10:10 am';
              });
            }
          },
        ),
        SlotWidget(
          isSelectedSlot: selectedSlot == '10:20 am',
          isOnline: true,
          time: '10:20 am',
          onTap: () {
            if (selectedSlot != '10:20 am') {
              setState(() {
                selectedSlot = '10:20 am';
              });
            }
          },
        ),
        SlotWidget(
          isSelectedSlot: selectedSlot == '10:30 am',
          isOnline: true,
          time: '10:30 am',
          onTap: () {
            if (selectedSlot != '10:30 am') {
              setState(() {
                selectedSlot = '10:30 am';
              });
            }
          },
        ),
        SlotWidget(
          isSelectedSlot: selectedSlot == '10:40 am',
          isOnline: true,
          time: '10:40 am',
          onTap: () {
            if (selectedSlot != '10:40 am') {
              setState(() {
                selectedSlot = '10:40 am';
              });
            }
          },
        ),
        SlotWidget(
          isSelectedSlot: selectedSlot == '10:50 am',
          isOnline: true,
          time: '10:50 am',
          onTap: () {
            if (selectedSlot != '10:50 am') {
              setState(() {
                selectedSlot = '10:50 am';
              });
            }
          },
        ),
        SlotWidget(
          isSelectedSlot: selectedSlot == '11:00 am',
          isOnline: true,
          time: '11:00 am',
          onTap: () {
            if (selectedSlot != '11:00 am') {
              setState(() {
                selectedSlot = '11:00 am';
              });
            }
          },
        ),
        SlotWidget(
          isSelectedSlot: selectedSlot == '11:10 am',
          isOnline: true,
          time: '11:10 am',
          onTap: () {
            if (selectedSlot != '11:10 am') {
              setState(() {
                selectedSlot = '11:10 am';
              });
            }
          },
        ),
        SlotWidget(
          isSelectedSlot: selectedSlot == '11:20 am',
          isOnline: true,
          time: '11:20 am',
          onTap: () {
            if (selectedSlot != '11:20 am') {
              setState(() {
                selectedSlot = '11:20 am';
              });
            }
          },
        ),
        SlotWidget(
          isSelectedSlot: selectedSlot == '11:30 am',
          isOnline: true,
          time: '11:30 am',
          onTap: () {
            if (selectedSlot != '11:30 am') {
              setState(() {
                selectedSlot = '11:30 am';
              });
            }
          },
        ),
        SlotWidget(
          isSelectedSlot: selectedSlot == '11:40 am',
          isOnline: true,
          time: '11:40 am',
          onTap: () {
            if (selectedSlot != '11:40 am') {
              setState(() {
                selectedSlot = '11:40 am';
              });
            }
          },
        ),
        SlotWidget(
          isSelectedSlot: selectedSlot == '11:50 am',
          isOnline: true,
          time: '11:50 am',
          onTap: () {
            if (selectedSlot != '11:50 am') {
              setState(() {
                selectedSlot = '11:50 am';
              });
            }
          },
        ),
      ],
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
