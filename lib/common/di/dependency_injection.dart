import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:naffith/common/category/Cubit/category_cubit.dart';
import 'package:naffith/common/category/data/repo/category_repo.dart';
import 'package:naffith/common/cities/data/repo/cities_repo.dart';
import 'package:naffith/common/cities/logic/cities_cubit.dart';
import 'package:naffith/common/networking/add_real_estates_api.dart';
import 'package:naffith/common/report/data/repo/report_repo.dart';
import 'package:naffith/common/report/logic/report_cubit.dart';
import 'package:naffith/common/state_list/Cubit/state_cubit.dart';
import 'package:naffith/common/state_list/data/repo/state_repo.dart';
import 'package:naffith/common/users_data/Cubit/get_users_cubit.dart';
import 'package:naffith/common/users_data/Data/repo/get_users_repo.dart';
import 'package:naffith/presentation/screens/about_us_page/Cubit/about_us_cubit.dart';
import 'package:naffith/presentation/screens/about_us_page/data/repo/about_us_repo.dart';
import 'package:naffith/presentation/screens/add_advertisements/Cubit/add_real_estates_cubit.dart';
import 'package:naffith/presentation/screens/add_advertisements/data/repos/add_real_estates_repo.dart';
import 'package:naffith/presentation/screens/advertisements_info/Cubit/one_real_estate_cubit.dart';
import 'package:naffith/presentation/screens/advertisements_info/data/repo/one_real_estate_repo.dart';
import 'package:naffith/presentation/screens/comman_questions_page/Cubit/comman_questions_cubit.dart';
import 'package:naffith/presentation/screens/comman_questions_page/data/repo/comman_questions_repo.dart';
import 'package:naffith/presentation/screens/favorite_advertisements/data/repo/all_favorites_repo.dart';
import 'package:naffith/presentation/screens/favorite_advertisements/logic/all_favorites_cubit.dart';
import 'package:naffith/presentation/screens/filter/data/repo/filter_repo.dart';
import 'package:naffith/presentation/screens/filter/logic/filter_cubit.dart';
import 'package:naffith/presentation/screens/home_page/data/repos/all_real_estates_repo.dart';
import 'package:naffith/presentation/screens/home_page/logic/all_real_estates_cubit.dart';
import 'package:naffith/presentation/screens/home_page/logic/buy/all_real_estates_buy_cubit.dart';
import 'package:naffith/presentation/screens/home_page/logic/delete_from_favorites/delete_favorites_cubit.dart';
import 'package:naffith/presentation/screens/home_page/logic/favorites/add_favorites_cubit.dart';
import 'package:naffith/presentation/screens/login/data/repos/login_repo.dart';
import 'package:naffith/presentation/screens/login/logic/cubit/login_cubit.dart';
import 'package:naffith/presentation/screens/my_advertisements/data/repo/my_real_estates_repo.dart';
import 'package:naffith/presentation/screens/my_advertisements/logic/my_real_estates_cubit.dart';
import 'package:naffith/presentation/screens/my_advertisements/logic/to_sales/my_real_estates_cubit.dart';
import 'package:naffith/presentation/screens/my_advertisements_buy_info/data/repo/change_status_repo.dart';
import 'package:naffith/presentation/screens/my_advertisements_buy_info/data/repo/change_to_buy_repo.dart';
import 'package:naffith/presentation/screens/my_advertisements_buy_info/data/repo/change_to_sale_repo.dart';
import 'package:naffith/presentation/screens/my_advertisements_buy_info/data/repo/delete_real_estate_repo.dart';
import 'package:naffith/presentation/screens/my_advertisements_buy_info/data/repo/hide_real_estate_repo.dart';
import 'package:naffith/presentation/screens/my_advertisements_buy_info/data/repo/update_note_repo.dart';
import 'package:naffith/presentation/screens/my_advertisements_buy_info/logic/chane_status/change_status_cubit.dart';
import 'package:naffith/presentation/screens/my_advertisements_buy_info/logic/delete_real_estate_cubit.dart';
import 'package:naffith/presentation/screens/my_advertisements_buy_info/logic/hide_real_estate/hide_real_estate_cubit.dart';
import 'package:naffith/presentation/screens/my_advertisements_buy_info/logic/update_note/update_note_cubit.dart';
import 'package:naffith/presentation/screens/my_orders/logic/contarctors_buy/contractors_buy_cubit.dart';
import 'package:naffith/presentation/screens/my_orders/logic/contractors/contractors_cubit.dart';
import 'package:naffith/presentation/screens/my_orders/logic/my_order_buy/my_order_buy_cubit.dart';
import 'package:naffith/presentation/screens/order_steps/data/repo/create_order_repo.dart';
import 'package:naffith/presentation/screens/order_steps/logic/create_order/create_order_cubit.dart';
import 'package:naffith/presentation/screens/privacy_policy_page/Cubit/privay_policy_cubit.dart';
import 'package:naffith/presentation/screens/privacy_policy_page/data/repo/privacy_policy_repo.dart';
import 'package:naffith/presentation/screens/profile/data/repo/delete_faal_repo.dart';
import 'package:naffith/presentation/screens/profile/data/repo/get_faal_repo.dart';
import 'package:naffith/presentation/screens/profile/data/repo/update_faal_repo.dart';
import 'package:naffith/presentation/screens/profile/logic/delete_faal_cubit.dart';
import 'package:naffith/presentation/screens/profile/logic/get_faal_cubit.dart';
import 'package:naffith/presentation/screens/profile/logic/update_faal_cubit.dart';
import 'package:naffith/presentation/screens/profile/logic/upload_faal_cubit.dart';
import 'package:naffith/presentation/screens/social_media_page/Cubit/social_media_cubit.dart';
import 'package:naffith/presentation/screens/social_media_page/data/repo/social_media_repo.dart';
import 'package:naffith/presentation/screens/ticket_page/data/repo/add_ticket_repo.dart';
import 'package:naffith/presentation/screens/ticket_page/logic/add_ticket_cubit.dart';
import 'package:naffith/presentation/screens/ticket_page/logic/all_tickets/all_tickets_cubit.dart';
import 'package:naffith/presentation/screens/user_terms_page/Cubit/user_terms_cubit.dart';
import 'package:naffith/presentation/screens/user_terms_page/data/repo/user_terms_repo.dart';
import '../../presentation/screens/home_page/logic/all_real_estate/all_real_estates_list_cubit.dart';
import '../../presentation/screens/my_advertisements_buy_info/logic/change_to_buy/change_to_buy_cubit.dart';
import '../../presentation/screens/my_advertisements_buy_info/logic/change_to_sale/change_to_sale_cubit.dart';
import '../../presentation/screens/my_orders/data/repo/order_sale_repo.dart';
import '../../presentation/screens/my_orders/logic/order_sale_cubit.dart';
import '../../presentation/screens/profile/data/repo/upload_faal_repo.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  getIt.registerLazySingleton<AddRealApiService>(() => AddRealApiService());

  // Add realEstates
  getIt.registerLazySingleton<AddRealEstatesRepo>(() => AddRealEstatesRepo(getIt()));
  getIt.registerLazySingleton<AddRealEstatesCubit>(() => AddRealEstatesCubit(getIt()));
  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));
  // get all real estates
  getIt.registerLazySingleton<AllRealEstatesRepo>(() => AllRealEstatesRepo(getIt()));
  getIt.registerLazySingleton<AllRealEstatesCubit>(() => AllRealEstatesCubit(getIt()));
  getIt.registerLazySingleton<AllRealEstatesBuyCubit>(() => AllRealEstatesBuyCubit(getIt()));
  // get user favorite
  getIt.registerLazySingleton<AllFavoritesRepo>(() => AllFavoritesRepo(getIt()));
  getIt.registerLazySingleton<AllFavoritesCubit>(() => AllFavoritesCubit(getIt()));
  // get user real estates
  getIt.registerLazySingleton<MyRealEstatesRepo>(() => MyRealEstatesRepo(getIt()));
  getIt.registerLazySingleton<MyRealEstatesCubit>(() => MyRealEstatesCubit(getIt()));
  // get social media links
  getIt.registerLazySingleton<SocialMediaRepo>(() => SocialMediaRepo(getIt()));
  getIt.registerLazySingleton<SocialMediaCubit>(() => SocialMediaCubit(getIt()));
  // Common Questions
  getIt.registerLazySingleton<CommanQuestionsRepo>(() => CommanQuestionsRepo(getIt()));
  getIt.registerLazySingleton<CommanQuestionsCubit>(() => CommanQuestionsCubit(getIt()));
  // Privacy Policy
  getIt.registerLazySingleton<PrivacyPolicyCubit>(() => PrivacyPolicyCubit(getIt()));
  getIt.registerLazySingleton<PrivacyPolicyRepo>(() => PrivacyPolicyRepo(getIt()));
  // about us
  getIt.registerLazySingleton<AboutUsRepo>(() => AboutUsRepo(getIt()));
  getIt.registerLazySingleton<AboutUsCubit>(() => AboutUsCubit(getIt()));
  // User Term
  getIt.registerLazySingleton<UserTermsRepo>(() => UserTermsRepo(getIt()));
  getIt.registerLazySingleton<UserTermsCubit>(() => UserTermsCubit(getIt()));
  // Upload Faal
  getIt.registerLazySingleton<FileRepository>(() => FileRepository(getIt()));
  getIt.registerLazySingleton<UploadFaalCubit>(() => UploadFaalCubit(getIt()));
  // Update Faal
  getIt.registerLazySingleton<UpdateFaalRepo>(() => UpdateFaalRepo(getIt()));
  getIt.registerLazySingleton<UpdateFaalCubit>(() => UpdateFaalCubit(getIt()));
  // Delete Faal
  getIt.registerLazySingleton<DeleteFaalRepo>(() => DeleteFaalRepo(getIt()));
  getIt.registerLazySingleton<DeleteFaalCubit>(() => DeleteFaalCubit(getIt()));
  // get Category List
  getIt.registerLazySingleton<CategoryCubit>(() => CategoryCubit(getIt()));
  getIt.registerLazySingleton<CategoryRepo>(() => CategoryRepo(getIt()));
  // get One Real Estate
  getIt.registerLazySingleton<OneRealEstateRepo>(() => OneRealEstateRepo(getIt()));
  getIt.registerLazySingleton<OneRealEstateCubit>(() => OneRealEstateCubit(getIt()));
  // get my Real Estate to Sales
  getIt.registerLazySingleton<MyRealEstatesToSaleCubit>(() => MyRealEstatesToSaleCubit(getIt()));
  // Delete One Real Estate
  getIt.registerLazySingleton<DeleteRealEstateRepo>(() => DeleteRealEstateRepo(getIt()));
  getIt.registerLazySingleton<DeleteRealEstateCubit>(() => DeleteRealEstateCubit(getIt()));
  // get Faal
  getIt.registerLazySingleton<GetFaalRepo>(() => GetFaalRepo(getIt()));
  getIt.registerLazySingleton<GetFaalCubit>(() => GetFaalCubit(getIt()));
  // update Note
  getIt.registerLazySingleton<UpdateNoteRepo>(() => UpdateNoteRepo(getIt()));
  getIt.registerLazySingleton<UpdateNoteCubit>(() => UpdateNoteCubit(getIt()));
  // change Real estate to sale
  getIt.registerLazySingleton<ChangeToSaleRepo>(() => ChangeToSaleRepo(getIt()));
  getIt.registerLazySingleton<ChangeToSaleCubit>(() => ChangeToSaleCubit(getIt()));
  // change Real estate to Buy
  getIt.registerLazySingleton<ChangeToBuyRepo>(() => ChangeToBuyRepo(getIt()));
  getIt.registerLazySingleton<ChangeToBuyCubit>(() => ChangeToBuyCubit(getIt()));
  // change Real estate Status
  getIt.registerLazySingleton<ChangeStatusRepo>(() => ChangeStatusRepo(getIt()));
  getIt.registerLazySingleton<ChangeStatusCubit>(() => ChangeStatusCubit(getIt()));
  // Hide Real estate adv
  getIt.registerLazySingleton<HideRealEstateCubit>(() => HideRealEstateCubit(getIt()));
  getIt.registerLazySingleton<HideRealEstateRepo>(() => HideRealEstateRepo(getIt()));
  // create order
  getIt.registerLazySingleton<CreateOrderCubit>(() => CreateOrderCubit(getIt()));
  getIt.registerLazySingleton<CreateOrderRepo>(() => CreateOrderRepo(getIt()));
  // get users
  getIt.registerLazySingleton<GetUsersCubit>(() => GetUsersCubit(getIt()));
  getIt.registerLazySingleton<GetUsersRepo>(() => GetUsersRepo(getIt()));
  // add tickets
  getIt.registerLazySingleton<AddTicketCubit>(() => AddTicketCubit(getIt()));
  getIt.registerLazySingleton<AddTicketRepo>(() => AddTicketRepo(getIt()));

  // get States
  getIt.registerLazySingleton<StateCubit>(() => StateCubit(getIt()));
  getIt.registerLazySingleton<StateRepo>(() => StateRepo(getIt()));
  // get Cities
  getIt.registerLazySingleton<CitiesCubit>(() => CitiesCubit(getIt()));
  getIt.registerLazySingleton<CitiesRepo>(() => CitiesRepo(getIt()));
  // get order sale list
  getIt.registerLazySingleton<OrderSaleCubit>(() => OrderSaleCubit(getIt()));
  getIt.registerLazySingleton<OrderSaleRepo>(() => OrderSaleRepo(getIt()));
  getIt.registerLazySingleton<MyOrderBuyCubit>(() => MyOrderBuyCubit(getIt()));
  getIt.registerLazySingleton<ContractorCubit>(() => ContractorCubit(getIt()));
  getIt.registerLazySingleton<ContractorBuyCubit>(() => ContractorBuyCubit(getIt()));
  // report real estates
  getIt.registerLazySingleton<ReportRealEstatesCubit>(() => ReportRealEstatesCubit(getIt()));
  getIt.registerLazySingleton<ReportRealEstatesRepo>(() => ReportRealEstatesRepo(getIt()));
  // add to favorites
  getIt.registerLazySingleton<AddFavoritesCubit>(() => AddFavoritesCubit(getIt()));
  // delete from favorites
  getIt.registerLazySingleton<DeleteFavoritesCubit>(() => DeleteFavoritesCubit(getIt()));
  // all real estate list
  getIt.registerLazySingleton<AllRealEstatesListCubit>(() => AllRealEstatesListCubit(getIt()));
  // filter real estates
  getIt.registerLazySingleton<EstateFilterCubit>(() => EstateFilterCubit(getIt()));
  getIt.registerLazySingleton<EstateFilterRepo>(() => EstateFilterRepo(getIt()));
  // all tickets
  getIt.registerLazySingleton<AllTicketsCubit>(() => AllTicketsCubit(getIt()));
}