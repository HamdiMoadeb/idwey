import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idwey/components/extra_price_component/extra_price_component.dart';
import 'package:idwey/presentation/blocs/reservation_bloc/reservation_bloc.dart';

import '../../../../data/models/extra_price_dto.dart';

class ExtraPriceSectionDisponibility extends StatelessWidget {
  final List<ExtraPrice> extraPrices;
  const ExtraPriceSectionDisponibility({Key? key, required this.extraPrices})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
          child: Row(
            children: [
              const Icon(Icons.stars),
              SizedBox(width: 10.w),
              const Text('Prix extra',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),
            ],
          ),
        ),
        const Divider(),
        Column(
          children: extraPrices
              .map((e) => ExtraPriceComponent(
                    quantity: e.number ?? 1,
                    title: e.name ?? "",
                    subtitle: e.price ?? "",
                    onchange: (int i) {
                      /// update quantity inside extra price object
                      print("extra price quantity changed");
                      print(i);
                      context.read<ReservationBloc>().add(
                          ReservationEvent.onExtraPriceQuantityChanged(e, i));
                    },
                  ))
              .toList(),
        ),
        Divider(),
      ],
    );
  }
}
