import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:designapp/Modules/ShopCart/shopCartScreen.dart';
import 'package:designapp/Shared/Components.dart';
import 'package:designapp/Shared/Cubit/cubit.dart';
import 'package:designapp/Shared/Cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var paymentController = TextEditingController();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocConsumer<Cubit_Class, State_Class>(
        listener: (context, state) {},
        builder: (context, state) {
          Cubit_Class c = Cubit_Class.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                backgroundColor: Colors.white,
                body: c.screens[c.currentScreen],
                bottomNavigationBar: BottomNavyBar(
                  selectedIndex: c.currentScreen,
                  items: Cubit_Class.get(context).bottomNavItems,
                  onItemSelected: (value) {
                    if (value == 2) {
                      showModalBottomSheet(
                        shape: const OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                topLeft: Radius.circular(15)),
                            borderSide: BorderSide(color: Colors.transparent)),
                        isScrollControlled: false,
                        context: context,
                        builder: (BuildContext context) => Container(
                          height: 450,
                          width: double.infinity,
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(20.0),
                                    child: Text(
                                      "تبرع سريع",
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: InkWell(
                                            onTap: () {
                                              if (c.isclicked == false) {
                                                paymentController.text =
                                                    c.PressedPayment(
                                                        "Paymentcontanier1");
                                              }
                                              c.isclicked = false;
                                            },
                                            child: Container(
                                              height: 100,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: HexColor("#BCE0FD")),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        blurRadius: 5,
                                                        color: HexColor("#000000")
                                                            .withOpacity(0.16),
                                                        blurStyle: BlurStyle.outer)
                                                  ]),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "50",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: HexColor("#707070")),
                                                  ),
                                                  Text(
                                                    "د.ل",
                                                    style: TextStyle(
                                                        color: HexColor("#707070")),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: InkWell(
                                            onTap: () {
                                              if (c.isclicked == false) {
                                                paymentController.text =
                                                    c.PressedPayment(
                                                        "Paymentcontanier2");
                                              }
                                              c.isclicked = false;
                                            },
                                            child: Container(
                                              height: 100,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: HexColor("#BCE0FD")),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        blurRadius: 5,
                                                        color: HexColor("#000000")
                                                            .withOpacity(0.16),
                                                        blurStyle: BlurStyle.outer)
                                                  ]),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "100",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: HexColor("#707070")),
                                                  ),
                                                  Text(
                                                    "د.ل",
                                                    style: TextStyle(
                                                        color: HexColor("#707070")),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: InkWell(
                                            onTap: () {
                                              if (c.isclicked == false) {
                                                paymentController.text =
                                                    c.PressedPayment(
                                                        "Paymentcontanier3");
                                              }

                                              c.isclicked = false;
                                            },
                                            child: Container(
                                              height: 100,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: HexColor("#BCE0FD")),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        blurRadius: 5,
                                                        color: HexColor("#000000")
                                                            .withOpacity(0.16),
                                                        blurStyle: BlurStyle.outer)
                                                  ]),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "200",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: HexColor("#707070")),
                                                  ),
                                                  Text(
                                                    "د.ل",
                                                    style: TextStyle(
                                                        color: HexColor("#707070")),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  DefaultTextField(
                                    label: "المبلغ",
                                    prefixicon: Icons.payment,
                                    textcontroller: paymentController,
                                    function: (value) {
                                      return null;
                                    },
                                  ),
                                  const Text("سيذهب تبرعب للحالات الأشد احتياجا"),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  DefaultButton(
                                    Function: () {},
                                    ButtonText: "تبرع لأن",
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                      return;
                    }
                    else {
                      c.changeScreen(value);
                    }
                  },
                ),
              ),
            ),
            theme: ThemeData(
              textTheme:GoogleFonts.cairoTextTheme(),
               appBarTheme:  AppBarTheme(
                  centerTitle: true,
                  elevation: 0,
                  iconTheme: IconThemeData(
                      color: HexColor("#f6f6f6"),
                  )
              ),
            ),
          );
        },
      ),
    );
  }
}

