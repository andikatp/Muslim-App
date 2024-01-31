import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jadwal_solat/core/extensions/context_extension.dart';
import 'package:jadwal_solat/features/quran/presentation/bloc/quran_bloc.dart';

class QuranList extends StatelessWidget {
  const QuranList({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<QuranBloc>().add(const GetQuransEvent());
    return BlocBuilder<QuranBloc, QuranState>(
      builder: (context, state) {
        if (state is QuranLoading) {
          return Center(
            child: SizedBox(
              height: 0.4.sh,
              child: const CupertinoActivityIndicator(),
            ),
          );
        }
        if (state is QuranError) {
          return Text(state.message);
        }
        if (state is QuranLoaded) {
          return ListView.separated(
            itemCount: state.qurans.length,
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 10,
                ),
                child: ListTile(
                  onTap: () => context.push(
                    '/quran/detail',
                    extra: state.qurans[index].nomor,
                  ),
                  leading: CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.black.withOpacity(0.75),
                    child: Text(
                      state.qurans[index].nomor.toString(),
                      style: context.textTheme.labelLarge!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  title: Text(
                    state.qurans[index].namaLatin,
                    style: context.textTheme.titleMedium!
                        .copyWith(color: Colors.black.withOpacity(0.75)),
                  ),
                  subtitle: Text(
                    '${state.qurans[index].arti} '
                    '(${state.qurans[index].jumlahAyat})',
                    style: context.textTheme.bodySmall!
                        .copyWith(color: Colors.black.withOpacity(0.75)),
                  ),
                  trailing: Text(
                    state.qurans[index].nama,
                    style: context.textTheme.headlineSmall!
                        .copyWith(color: Colors.black.withOpacity(0.75)),
                  ),
                ),
              );
            },
            separatorBuilder: (_, __) => Padding(
              padding: REdgeInsets.symmetric(horizontal: 44),
              child: Divider(
                height: 1.h,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
