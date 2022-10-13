import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:jadwal_solat/bloc/prayer_cubit.dart';
import 'package:jadwal_solat/models/jadwal_solat_model.dart';
import 'package:jadwal_solat/services/prayer_service.dart';
import 'package:jadwal_solat/widget/date_picker_v2_widget.dart';
import '../widget/appbar_widget.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:intl/intl.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;

  final pages = [
    const MainScreen(),
  ];
  DateTime selectedDate = DateTime.now();

  void getPrayerTime() {
    PrayerService().getPrayerTime();
  }

  @override
  void initState() {
    super.initState();
    context.read<PrayerCubit>().getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: ListView(
        children: [
          SizedBox(
            height: 182,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDate = DateTime(
                                selectedDate.year,
                                selectedDate.month - 1,
                                selectedDate.day,
                                selectedDate.hour);
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: const Icon(Icons.chevron_left),
                        ),
                      ),
                      Text(
                        DateFormat.MMMM().format(selectedDate).toString(),
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDate = DateTime(
                                selectedDate.year,
                                selectedDate.month + 1,
                                selectedDate.day,
                                selectedDate.hour);
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: const Icon(Icons.chevron_right),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                DateV2Picker(
                  () {
                    var dateNow =
                        DateTime(selectedDate.year, selectedDate.month, 1);

                    return dateNow;
                  }(),
                  locale: "id_ID",
                  daysCount: () {
                    var dateEnd =
                        DateTime(selectedDate.year, selectedDate.month + 1, 0);
                    return dateEnd.day;
                  }(),
                  initialSelectedDate: DateTime.now(),
                  selectionColor: const Color(0xFF2FD9E3).withOpacity(0.12),
                  selectedTextColor: const Color(0xFF2FD9E3),
                  onDateChange: (date) {
                    // New date selected
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 29),
            decoration: const BoxDecoration(
              color: Color(0xFFF2F1EF),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(40),
              ),
            ),
            child: BlocBuilder<PrayerCubit, PrayerState>(
              builder: (context, state) {
                var jadwalSolat = state.JadwalShalat;
                String notFound = 'Not Found';

                final List<JadwalSolatModel> listJadwalSholat = [
                  JadwalSolatModel(
                    icon: Ri.notification_3_line,
                    prayerSchedule: 'Imsak',
                    prayerTime: jadwalSolat.imsak ?? notFound,
                  ),
                  JadwalSolatModel(
                    icon: Ph.sun_horizon_light,
                    prayerSchedule: 'Subuh',
                    prayerTime: jadwalSolat.subuh ?? notFound,
                  ),
                  JadwalSolatModel(
                    icon: Ph.sun_light,
                    prayerSchedule: 'Dzuhur',
                    prayerTime: jadwalSolat.dzuhur ?? notFound,
                  ),
                  JadwalSolatModel(
                    icon: Ph.cloud_sun_light,
                    prayerSchedule: 'Ashar',
                    prayerTime: jadwalSolat.ashar ?? notFound,
                  ),
                  JadwalSolatModel(
                    icon: Ph.cloud_moon_light,
                    prayerSchedule: 'Magrib',
                    prayerTime: jadwalSolat.maghrib ?? notFound,
                  ),
                  JadwalSolatModel(
                    icon: Bi.moon_stars,
                    prayerSchedule: 'Isya',
                    prayerTime: jadwalSolat.isya ?? notFound,
                  ),
                ];
                return Column(
                  children: listJadwalSholat.map(
                    (e) {
                      bool _isActive = false;
                      final String angka = e.prayerTime;
                      String jam = angka.substring(0, 2);
                      String menit = angka.substring(3, 5);
                      TimeOfDay waktuSolat = TimeOfDay(
                          hour: int.parse(jam), minute: int.parse(menit));
                      TimeOfDay waktuSekarang = TimeOfDay.now();
                      int waktuSekarangDalamMenit = toMinute(waktuSekarang);
                      int waktuSolatDalamMenit = toMinute(waktuSolat);
                      if (waktuSekarangDalamMenit < waktuSolatDalamMenit) {
                        _isActive = true;
                      }

                      return Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 8,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 17),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: _isActive ? Color(0xFF2FD9E3) : Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 2),
                                blurRadius: 0.9,
                              ),
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Iconify(e.icon,
                                    color: _isActive
                                        ? Colors.white
                                        : Colors.black),
                                const SizedBox(
                                  width: 14,
                                ),
                                Text(
                                  e.prayerSchedule,
                                  style: GoogleFonts.poppins(
                                    color:
                                        _isActive ? Colors.white : Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              e.prayerTime,
                              style: GoogleFonts.poppins(
                                  color:
                                      _isActive ? Colors.white : Colors.black,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      );
                    },
                  ).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  int toMinute(TimeOfDay timeOfDay) {
    return timeOfDay.hour * 60 + timeOfDay.minute;
  }
}
