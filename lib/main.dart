
import 'package:designapp/Layout/layoutScreen.dart';
import 'package:designapp/Modules/AuthFiles/Login_Design.dart';
import 'package:designapp/Modules/OnBoarding/onboardingscreen.dart';
import 'package:designapp/Services/CubitServices/AuthCubitServices/LoginCubit/LoginCubit.dart';
import 'package:designapp/Services/CubitServices/DataCubitServices/BloodCubit/blood_cubit.dart';
import 'package:designapp/Services/CubitServices/DataCubitServices/CartCubit/cart_cubit.dart';
import 'package:designapp/Services/CubitServices/DataCubitServices/ManageCasesCubit/cases_cubit.dart';
import 'package:designapp/Services/CubitServices/DataCubitServices/SectionsCubit/sections_cubit.dart';
import 'package:designapp/Shared/CacheHelper.dart';
import 'package:designapp/Shared/Cubit/cubit.dart';
import 'package:designapp/Shared/Cubit/state.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Shared/constants.dart';


void main()  async {

  WidgetsFlutterBinding.ensureInitialized();  //????

  Firebase.initializeApp();

  await CacheHelper.init();

  bool? isBoarding = CacheHelper.getBoolean(key: "onBoarding") ;

  //uId =CacheHelper.saveData(key: "uId", value: "wbvx6AKRQ6Q8V0zDc2ckTfEkKDY2");

  runApp(Myapp(isBoarding: isBoarding,));


}

class Myapp extends StatelessWidget{
 

   bool? isBoarding;

   Myapp({
     super.key, 
     required this.isBoarding
  });

  @override
  Widget build (BuildContext context)
  {

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context)=> Cubit_Class()..getUserData()),
          BlocProvider(create: (BuildContext context)=> LoginCubit()),
          BlocProvider(create: (BuildContext context)=> BloodCubit()),
          BlocProvider(create: (BuildContext context)=> SectionsCubit()),
          BlocProvider(create: (BuildContext context)=> CasesCubit()),
          BlocProvider(create: (BuildContext context)=> CartCubit()),
        ],
        child: BlocConsumer<Cubit_Class,State_Class>(
          listener: (context,index){},
          builder: (context,index){
            print(uId);
            return  MaterialApp(
              home:  Directionality(
                textDirection: TextDirection.rtl,
                child: isBoarding == true ?  const LayoutScreen() : const OnBoardingScreen(),
              ),
              theme: ThemeData(
                textTheme:GoogleFonts.cairoTextTheme(),
              ),
              debugShowCheckedModeBanner: false,
            );
          },
        )
    );
  }
}


