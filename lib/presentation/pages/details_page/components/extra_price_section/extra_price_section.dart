import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idwey/components/extra_price_component/extra_price_component.dart';
import 'package:idwey/presentation/blocs/blocs.dart';

import '../../../../../data/models/extra_price_dto.dart';

class ExtraPriceSection extends StatefulWidget {
  final List<ExtraPrice> extraPrices;

  ExtraPriceSection({Key? key, required this.extraPrices}) : super(key: key);

  @override
  State<ExtraPriceSection> createState() => _ExtraPriceSectionState();
}

class _ExtraPriceSectionState extends State<ExtraPriceSection> {
  List<bool> isCheckedList = [];

  @override
  void initState() {
    // TODO: implement initState
    isCheckedList = List.generate(widget.extraPrices.length, (index) => false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: Text(
            'Prix extra',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        Column(
          children: widget.extraPrices.asMap().entries.map((entry) {
            final int index = entry.key;
            ExtraPrice e = entry.value;
            return ExtraPriceComponent(
              quantity: e.quantity ?? 1,
              isChecked:
                  isCheckedList[index], // Use the individual checked state
              title: e.name ?? "",
              subtitle: e.price ?? "",
              onchange: (int i) {
                /// update quantity inside extra price object
                e = ExtraPrice(
                  name: e.name,
                  price: e.price,
                  quantity: i,
                );
                context
                    .read<DetailsPageBloc>()
                    .add(DetailsPageEvent.onExtraPriceQuantityChanged(e, i));
              },
              onCheck: (bool? v) {
                setState(() {
                  isCheckedList[index] =
                      v ?? false; // Update the individual checked state
                });

                /// if checked == true add the extra price to the list else remove it
                if (v == true) {
                  context
                      .read<DetailsPageBloc>()
                      .add(DetailsPageEvent.onExtraPriceChecked(e));
                } else {
                  context
                      .read<DetailsPageBloc>()
                      .add(DetailsPageEvent.onExtraPriceUnChecked(e));
                }
              },
            );
          }).toList(),
        ),
        Divider(),
      ],
    );
  }
}
