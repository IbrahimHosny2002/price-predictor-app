import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:price_predictor_app/core/utils/app_router.dart';
import 'package:price_predictor_app/core/utils/styles.dart';
import 'package:price_predictor_app/core/widgets/custo_text_field.dart';
import 'package:price_predictor_app/core/widgets/custom_buttom.dart';
import 'package:price_predictor_app/core/widgets/custom_text.dart';
import 'package:price_predictor_app/features/home/presentation/view_models/cubit/get_price_cubit.dart';

class FourthViewBody extends StatefulWidget {
  const FourthViewBody({super.key});

  @override
  State<FourthViewBody> createState() => _FourthViewBodyState();
}

class _FourthViewBodyState extends State<FourthViewBody> {
  String? groupValue1 = 'YesOrNo';
  String? groupValue2 = 'YesOrNo';
  GlobalKey<FormState> mykey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: mykey,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1),
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            const CustomText(
              content: 'Fourth',
            ),
            CustomTextField(
              min: 5.0,
              max: 20.0,
              onChanged: (val) {
                BlocProvider.of<GetPriceCubit>(context).scH = val.toString();
              },
              labelText: 'Screen Height of mobile in cm',
              keyboardType: TextInputType.number,
            ),
            CustomTextField(
              min: 0.0,
              max: 19.0,
              onChanged: (val) {
                BlocProvider.of<GetPriceCubit>(context).scW = val.toString();
              },
              labelText: 'Screen Width of mobile in cm',
              keyboardType: TextInputType.number,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Has touch screen or not',
                  style: Styles.textStyle16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio(
                        value: '1',
                        groupValue: groupValue1,
                        onChanged: (val) {
                          setState(() {
                            groupValue1 = val;
                            BlocProvider.of<GetPriceCubit>(context)
                                .touchScreen = val.toString();
                          });
                        }),
                    const Text('Yes'),
                    const SizedBox(
                      width: 30,
                    ),
                    Radio(
                        value: '0',
                        groupValue: groupValue1,
                        onChanged: (val) {
                          setState(() {
                            groupValue1 = val;
                            BlocProvider.of<GetPriceCubit>(context)
                                .touchScreen = val.toString();
                          });
                        }),
                    const Text('No'),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Has wifi or not',
                  style: Styles.textStyle16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio(
                        value: '1',
                        groupValue: groupValue2,
                        onChanged: (val) {
                          setState(() {
                            groupValue2 = val;
                            BlocProvider.of<GetPriceCubit>(context).wifi =
                                val.toString();
                          });
                        }),
                    const Text('Yes'),
                    const SizedBox(
                      width: 30,
                    ),
                    Radio(
                        value: '0',
                        groupValue: groupValue2,
                        onChanged: (val) {
                          setState(() {
                            groupValue2 = val;
                            BlocProvider.of<GetPriceCubit>(context).wifi =
                                val.toString();
                          });
                        }),
                    const Text('No'),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButtom(
              textButtom: 'Finish',
              onTap: () {
                if (mykey.currentState!.validate()) {
                  BlocProvider.of<GetPriceCubit>(context).getPrice();
                  navigatetoOutputscreen(context);
                }
              },
            )
          ],
        ),
      ),
    );
  }

  void navigatetoOutputscreen(context) {
    GoRouter.of(context).push(AppRouter.kOutPutViewViewPath);
  }
}
