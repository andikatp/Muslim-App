import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:jadwal_solat/core/constants/app_sizes.dart';
import 'package:jadwal_solat/features/quran/presentation/bloc/quran_bloc.dart';
import 'package:jadwal_solat/features/quran/presentation/widgets/detail_body.dart';

class QuranDetailPage extends StatelessWidget {
  const QuranDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final id = GoRouterState.of(context).extra! as int;
    context.read<QuranBloc>().add(GetQuranContentEvent(id: id));
    return BlocBuilder<QuranBloc, QuranState>(
      builder: (context, state) {
        if (state is QuranContentLoading) {
          return const Scaffold(
            body: Center(
              child: Text('Loading...'),
            ),
          );
        }
        if (state is QuranContentError) {
          return Scaffold(
            body: Center(
              child: Text(state.message),
            ),
          );
        }
        if (state is QuranContentLoaded) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(state.quran.namaLatin),
              surfaceTintColor: Colors.white,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Iconify(
                    Mdi.book_open_page_variant_outline,
                    color: Colors.black.withOpacity(0.75),
                  ),
                  iconSize: 28,
                ),
              ],
            ),
            body: ListView.separated(
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (_, __) => Gap.h12,
              itemCount: state.quran.ayat.length,
              itemBuilder: (context, index) =>
                  DetailBody(ayat: state.quran.ayat[index]),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
