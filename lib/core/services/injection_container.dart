import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:jadwal_solat/core/network_info/network_info.dart';
import 'package:jadwal_solat/features/prayer_time/data/datasources/prayer_time_remote_data_source.dart';
import 'package:jadwal_solat/features/prayer_time/data/repositories/prayer_time_repo_impl.dart';
import 'package:jadwal_solat/features/prayer_time/domain/repositories/prayer_time_repo.dart';
import 'package:jadwal_solat/features/prayer_time/domain/usecases/get_prayer_time.dart';
import 'package:jadwal_solat/features/prayer_time/presentation/bloc/prayer_time_bloc.dart';

part 'injection_container.main.dart';
