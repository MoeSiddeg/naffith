import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naffith/common/category/Cubit/category_cubit.dart';
import 'package:naffith/common/cities/logic/cities_cubit.dart';
import 'package:naffith/common/report/logic/report_cubit.dart';
import 'package:naffith/common/state_list/Cubit/state_cubit.dart';
import 'package:naffith/common/users_data/Cubit/get_users_cubit.dart';
import 'package:naffith/presentation/screens/add_advertisements/Cubit/add_real_estates_cubit.dart';
import 'package:naffith/presentation/screens/advertisements_info/Cubit/one_real_estate_cubit.dart';
import 'package:naffith/presentation/screens/application/application_page.dart';
import 'package:naffith/presentation/screens/application/bloc/app_blocs.dart';
import 'package:naffith/presentation/screens/favorite_advertisements/logic/all_favorites_cubit.dart';
import 'package:naffith/presentation/screens/home_page/logic/all_real_estates_cubit.dart';
import 'package:naffith/presentation/screens/home_page/logic/buy/all_real_estates_buy_cubit.dart';
import 'package:naffith/presentation/screens/home_page/logic/delete_from_favorites/delete_favorites_cubit.dart';
import 'package:naffith/presentation/screens/home_page/logic/favorites/add_favorites_cubit.dart';
import 'package:naffith/presentation/screens/login/logic/cubit/login_cubit.dart';
import 'package:naffith/presentation/screens/my_advertisements/logic/my_real_estates_cubit.dart';
import 'package:naffith/presentation/screens/my_advertisements/logic/to_sales/my_real_estates_cubit.dart';
import 'package:naffith/presentation/screens/my_advertisements_buy_info/logic/chane_status/change_status_cubit.dart';
import 'package:naffith/presentation/screens/my_advertisements_buy_info/logic/change_to_buy/change_to_buy_cubit.dart';
import 'package:naffith/presentation/screens/my_advertisements_buy_info/logic/change_to_sale/change_to_sale_cubit.dart';
import 'package:naffith/presentation/screens/my_advertisements_buy_info/logic/delete_real_estate_cubit.dart';
import 'package:naffith/presentation/screens/my_advertisements_buy_info/logic/hide_real_estate/hide_real_estate_cubit.dart';
import 'package:naffith/presentation/screens/my_advertisements_buy_info/logic/update_note/update_note_cubit.dart';
import 'package:naffith/presentation/screens/my_orders/logic/contarctors_buy/contractors_buy_cubit.dart';
import 'package:naffith/presentation/screens/my_orders/logic/contractors/contractors_cubit.dart';
import 'package:naffith/presentation/screens/my_orders/logic/my_order_buy/my_order_buy_cubit.dart';
import 'package:naffith/presentation/screens/my_orders/logic/order_sale_cubit.dart';
import 'package:naffith/presentation/screens/order_steps/logic/create_order/create_order_cubit.dart';
import 'package:naffith/presentation/screens/profile/logic/delete_faal_cubit.dart';
import 'package:naffith/presentation/screens/profile/logic/get_faal_cubit.dart';
import 'package:naffith/presentation/screens/profile/logic/update_faal_cubit.dart';
import 'package:naffith/presentation/screens/social_media_page/Cubit/social_media_cubit.dart';
import 'package:naffith/presentation/screens/ticket_page/logic/add_ticket_cubit.dart';
import '../../global.dart';
import '../../presentation/screens/add_advertisements/BloC/add_post_bloc.dart';
import '../../presentation/screens/add_advertisements/add_advertisement_page.dart';
import '../../presentation/screens/home_page/logic/all_real_estate/all_real_estates_list_cubit.dart';
import '../../presentation/screens/profile/logic/upload_faal_cubit.dart';
import '../../presentation/screens/sign_in/bloc/sing_in_bloc.dart';
import '../../presentation/screens/sign_in/sign_in.dart';
import '../../presentation/screens/welcome/bloc/welcome_blocs.dart';
import '../../presentation/screens/welcome/welcome.dart';
import '../di/dependency_injection.dart';
import 'names.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
          route: AppRoutes.INITIAL,
          page: Welcome(),
          bloc: BlocProvider(
            create: (_) => WelcomeBloc(),
          )),
      PageEntity(
          route: AppRoutes.SING_IN,
          page: const SignIn(),
          bloc: BlocProvider(
            create: (_) => SingInBloc(),
          )),
      PageEntity(
          route: AppRoutes.APPLICATION,
          page: const ApplicationPage(),
          bloc: BlocProvider(
            create: (_) => AppBlocs(),
          )),
      PageEntity(
          route: AppRoutes.ADD_APPLICATION,
          page: const AddAdvertisementPage(),
          bloc: BlocProvider(
            create: (_) => StageBloc(),
          )),
      PageEntity(
          route: AppRoutes.ADD_APPLICATION,
          page: const AddAdvertisementPage(),
          bloc: BlocProvider(
            create: (_) => getIt<LoginCubit>(),
          )),
      PageEntity(
          route: AppRoutes.ADD_APPLICATION,
          page: const AddAdvertisementPage(),
          bloc: BlocProvider(
            create: (_) => getIt<AllFavoritesCubit>(),
          )),
      PageEntity(
          route: AppRoutes.ADD_APPLICATION,
          page: const AddAdvertisementPage(),
          bloc: BlocProvider(
            create: (_) => getIt<AllRealEstatesCubit>(),
          )),
      PageEntity(
          route: AppRoutes.ADD_APPLICATION,
          page: const AddAdvertisementPage(),
          bloc: BlocProvider(
            create: (_) => getIt<MyRealEstatesCubit>(),
          )),
      PageEntity(
          route: AppRoutes.ADD_APPLICATION,
          page: const AddAdvertisementPage(),
          bloc: BlocProvider(
            create: (_) => getIt<UploadFaalCubit>(),
          )),
      PageEntity(
          route: AppRoutes.ADD_APPLICATION,
          page: const AddAdvertisementPage(),
          bloc: BlocProvider(
            create: (_) => getIt<UpdateFaalCubit>(),
          )),
      PageEntity(
          route: AppRoutes.ADD_APPLICATION,
          page: const AddAdvertisementPage(),
          bloc: BlocProvider(
            create: (_) => getIt<DeleteFaalCubit>(),
          )),
      PageEntity(
          route: AppRoutes.ADD_APPLICATION,
          page: const AddAdvertisementPage(),
          bloc: BlocProvider(
            create: (_) => getIt<CategoryCubit>(),
          )),
      PageEntity(
          route: AppRoutes.ADD_APPLICATION,
          page: const AddAdvertisementPage(),
          bloc: BlocProvider(
            create: (_) => getIt<AddRealEstatesCubit>(),
          )),
      PageEntity(
          route: AppRoutes.ADD_APPLICATION,
          page: const AddAdvertisementPage(),
          bloc: BlocProvider(
            create: (_) => getIt<OneRealEstateCubit>(),
          )),
      PageEntity(
          route: AppRoutes.ADD_APPLICATION,
          page: const AddAdvertisementPage(),
          bloc: BlocProvider(
            create: (_) => getIt<MyRealEstatesToSaleCubit>(),
          )),
      PageEntity(
          route: AppRoutes.ADD_APPLICATION,
          page: const AddAdvertisementPage(),
          bloc: BlocProvider(
            create: (_) => getIt<DeleteRealEstateCubit>(),
          )),
      PageEntity(
          route: AppRoutes.ADD_APPLICATION,
          page: const AddAdvertisementPage(),
          bloc: BlocProvider(
            create: (_) => getIt<GetFaalCubit>(),
          )),
      PageEntity(
          route: AppRoutes.ADD_APPLICATION,
          page: const AddAdvertisementPage(),
          bloc: BlocProvider(
            create: (_) => getIt<UpdateNoteCubit>(),
          )),
      PageEntity(
          route: AppRoutes.ADD_APPLICATION,
          page: const AddAdvertisementPage(),
          bloc: BlocProvider(
            create: (_) => getIt<ChangeToSaleCubit>(),
          )),
      PageEntity(
          route: AppRoutes.ADD_APPLICATION,
          page: const AddAdvertisementPage(),
          bloc: BlocProvider(
            create: (_) => getIt<ChangeToBuyCubit>(),
          )),
      PageEntity(
          route: AppRoutes.ADD_APPLICATION,
          page: const AddAdvertisementPage(),
          bloc: BlocProvider(
            create: (_) => getIt<ChangeStatusCubit>(),
          )),
      PageEntity(
          route: AppRoutes.ADD_APPLICATION,
          page: const AddAdvertisementPage(),
          bloc: BlocProvider(
            create: (_) => getIt<HideRealEstateCubit>(),
          )),
      PageEntity(
          route: AppRoutes.ADD_APPLICATION,
          page: const AddAdvertisementPage(),
          bloc: BlocProvider(
            create: (_) => getIt<CreateOrderCubit>(),
          )),
      PageEntity(
          route: AppRoutes.ADD_APPLICATION,
          page: const AddAdvertisementPage(),
          bloc: BlocProvider(
            create: (_) => getIt<GetUsersCubit>(),
          )),
      PageEntity(
          route: AppRoutes.ADD_APPLICATION,
          page: const AddAdvertisementPage(),
          bloc: BlocProvider(
            create: (_) => getIt<AddTicketCubit>(),
          )),
      PageEntity(
          route: AppRoutes.ADD_APPLICATION,
          page: const AddAdvertisementPage(),
          bloc: BlocProvider(
            create: (_) => getIt<StateCubit>(),
          )),
      PageEntity(
          route: AppRoutes.ADD_APPLICATION,
          page: const AddAdvertisementPage(),
          bloc: BlocProvider(
            create: (_) => getIt<CitiesCubit>(),
          )),
      PageEntity(
          route: AppRoutes.ADD_APPLICATION,
          page: const AddAdvertisementPage(),
          bloc: BlocProvider(
            create: (_) => getIt<OrderSaleCubit>(),
          )),
      PageEntity(
          route: AppRoutes.ADD_APPLICATION,
          page: const AddAdvertisementPage(),
          bloc: BlocProvider(
            create: (_) => getIt<MyOrderBuyCubit>(),
          )),
      PageEntity(
          route: AppRoutes.ADD_APPLICATION,
          page: const AddAdvertisementPage(),
          bloc: BlocProvider(
            create: (_) => getIt<ContractorCubit>(),
          )),
      PageEntity(
          route: AppRoutes.ADD_APPLICATION,
          page: const AddAdvertisementPage(),
          bloc: BlocProvider(
            create: (_) => getIt<ReportRealEstatesCubit>(),
          )),
      PageEntity(
          route: AppRoutes.ADD_APPLICATION,
          page: const AddAdvertisementPage(),
          bloc: BlocProvider(
            create: (_) => getIt<AllRealEstatesBuyCubit>(),
          )),
      PageEntity(
          route: AppRoutes.ADD_APPLICATION,
          page: const AddAdvertisementPage(),
          bloc: BlocProvider(
            create: (_) => getIt<AddFavoritesCubit>(),
          )),
      PageEntity(
          route: AppRoutes.ADD_APPLICATION,
          page: const AddAdvertisementPage(),
          bloc: BlocProvider(
            create: (_) => getIt<DeleteFavoritesCubit>(),
          )),
      PageEntity(
          route: AppRoutes.ADD_APPLICATION,
          page: const AddAdvertisementPage(),
          bloc: BlocProvider(
            create: (_) => getIt<ContractorBuyCubit>(),
          )),
      PageEntity(
          route: AppRoutes.ADD_APPLICATION,
          page: const AddAdvertisementPage(),
          bloc: BlocProvider(
            create: (_) => getIt<SocialMediaCubit>(),
          )),
      PageEntity(
          route: AppRoutes.ADD_APPLICATION,
          page: const AddAdvertisementPage(),
          bloc: BlocProvider(
            create: (_) => getIt<AllRealEstatesListCubit>(),
          )),
    ];
  }

  //return all the bloc providers
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      //check for route name macthing when navigator gets triggered.
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
          bool isLoggedin = Global.storageService.getIsLoggedIn();
          if (isLoggedin) {
            return MaterialPageRoute(
                builder: (_) => const ApplicationPage(), settings: settings);
          }
          return MaterialPageRoute(
              builder: (_) => const SignIn(), settings: settings);
        }
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    return MaterialPageRoute(
        builder: (_) => const SignIn(), settings: settings);
  }
}

//unify BlocProvider and routes and pages
class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, this.bloc});
}
