import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:intl/intl.dart';
import 'package:jadwal_solat/bloc/nama_quran_cubit.dart';
import 'package:jadwal_solat/bloc/prayer_cubit.dart';
import 'package:jadwal_solat/features/prayer_time/data/models/prayer_time_model.dart';
import 'package:jadwal_solat/models/jadwal_solat_model.dart';
import 'package:jadwal_solat/widget/date_picker_v2_widget.dart';
import 'package:jadwal_solat/features/prayer_time/presentation/widgets/app_bar_jadwal_widget.dart';

class JadwalSolatScreen extends StatefulWidget {
  const JadwalSolatScreen({super.key});

  @override
  State<JadwalSolatScreen> createState() => _JadwalSolatScreenState();
}

class _JadwalSolatScreenState extends State<JadwalSolatScreen> {
  int pageIndex = 0;

  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    selectedDate = context.read<PrayerCubit>().selectedDate ?? DateTime.now();
    context.read<PrayerCubit>().getTime(
          bulan: selectedDate.month,
          tahun: selectedDate.year,
          tanggal: selectedDate.day,
          date: selectedDate,
        );
    context.read<NamaQuranCubit>().getData();
  }

  bool _isActive = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarJadwalWidget(),
      body: ListView(
        children: [
          SizedBox(
            height: 182,
            child: Column(
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
                              selectedDate.hour,
                            );
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black.withOpacity(0.25),
                            ),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: const Icon(Icons.chevron_left),
                        ),
                      ),
                      Text(
                        DateFormat.MMMM().format(selectedDate),
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
                              selectedDate.hour,
                            );
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black.withOpacity(0.25),
                            ),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: const Icon(Icons.chevron_right),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: DateV2Picker(
                    () {
                      final dateNow =
                          DateTime(selectedDate.year, selectedDate.month);
                      return dateNow;
                    }(),
                    height: 67,
                    width: 32,
                    locale: 'id_ID',
                    daysCount: () {
                      final dateEnd = DateTime(
                        selectedDate.year,
                        selectedDate.month + 1,
                        0,
                      );
                      return dateEnd.day;
                    }(),
                    initialSelectedDate: selectedDate,
                    dayTextStyle: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    dateTextStyle: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    selectionColor: const Color(0xFF2FD9E3).withOpacity(0.12),
                    selectedTextColor: const Color(0xFF2FD9E3),
                    onDateChange: (date) {
                      // New date selected
                      context.read<PrayerCubit>().getTime(
                            bulan: date.month,
                            tahun: date.year,
                            tanggal: date.day,
                            date: date,
                          );
                      _isActive = false;
                    },
                  ),
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
                final jadwalSolat = state.jadwalShalat.ashar.isEmpty
                    ? const PrayerTimeModel.empty()
                    : state.jadwalShalat;
                print(jadwalSolat);
                final listJadwalSholat = <JadwalSolatModel>[
                  JadwalSolatModel(
                    icon: Ri.notification_3_line,
                    prayerSchedule: 'Imsak',
                    prayerTime: jadwalSolat.imsak,
                  ),
                  JadwalSolatModel(
                    icon: Ph.sun_horizon_light,
                    prayerSchedule: 'Subuh',
                    prayerTime: jadwalSolat.subuh,
                  ),
                  JadwalSolatModel(
                    icon: Ph.sun_light,
                    prayerSchedule: 'Dzuhur',
                    prayerTime: jadwalSolat.dzuhur,
                  ),
                  JadwalSolatModel(
                    icon: Ph.cloud_sun_light,
                    prayerSchedule: 'Ashar',
                    prayerTime: jadwalSolat.ashar,
                  ),
                  JadwalSolatModel(
                    icon: Ph.cloud_moon_light,
                    prayerSchedule: 'Magrib',
                    prayerTime: jadwalSolat.maghrib,
                  ),
                  JadwalSolatModel(
                    icon: Bi.moon_stars,
                    prayerSchedule: 'Isya',
                    prayerTime: jadwalSolat.isya,
                  ),
                ];

                return Column(
                  children: listJadwalSholat.map(
                    (e) {
                      var tempActive = false;
                      final angka = e.prayerTime;
                      final jam = angka.substring(0, 2);
                      final menit = angka.substring(3, 5);
                      var waktuIsya = 20;
                      waktuIsya = int.parse(jadwalSolat.isya.substring(0, 2));
                      if (angka != 'Not Found' && _isActive == false) {
                        final waktuSolat = TimeOfDay(
                          hour: int.parse(jam),
                          minute: int.parse(menit),
                        );
                        final now = DateTime.now();
                        DateTime timeSholat;
                        if (now.hour >= waktuIsya) {
                          timeSholat = DateTime(
                            now.year,
                            now.month,
                            now.day + 1,
                            waktuSolat.hour,
                            waktuSolat.minute,
                          );
                        } else {
                          timeSholat = DateTime(
                            now.year,
                            now.month,
                            now.day,
                            waktuSolat.hour,
                            waktuSolat.minute,
                          );
                        }
                        if (timeSholat.isAfter(now)) {
                          _isActive = true;
                          tempActive = true;
                        }
                      }

                      return Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 8,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 17,
                        ),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: tempActive
                              ? const Color(0xFF2FD9E3)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 2),
                              blurRadius: 0.9,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Iconify(
                                  e.icon,
                                  color:
                                      tempActive ? Colors.white : Colors.black,
                                ),
                                const SizedBox(
                                  width: 14,
                                ),
                                Text(
                                  e.prayerSchedule,
                                  style: GoogleFonts.poppins(
                                    color: tempActive
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              e.prayerTime,
                              style: GoogleFonts.poppins(
                                color: tempActive ? Colors.white : Colors.black,
                                fontSize: 12,
                              ),
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
}
