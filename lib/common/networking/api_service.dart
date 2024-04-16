import 'dart:io';
import 'package:dio/dio.dart' hide Headers;
import 'package:naffith/common/cities/data/models/cities_response.dart';
import 'package:naffith/common/report/data/models/report_response.dart';
import 'package:naffith/presentation/screens/about_us_page/data/models/about_us_response.dart';
import 'package:naffith/presentation/screens/comman_questions_page/data/models/comman_questions_response.dart';
import 'package:naffith/presentation/screens/my_advertisements/data/models/my_real_estates_model.dart';
import 'package:naffith/presentation/screens/my_orders/data/models/contractors_response_body.dart';
import 'package:naffith/presentation/screens/profile/data/models/get_faal_response.dart';
import 'package:naffith/presentation/screens/social_media_page/data/models/social_media_response_body.dart';
import 'package:naffith/presentation/screens/user_terms_page/data/models/user_terms_response.dart';
import 'package:retrofit/retrofit.dart';
import '../../presentation/screens/advertisements_info/data/models/one_real_estate_response.dart';
import '../../presentation/screens/home_page/data/models/all_real_estates_response_body.dart';
import '../../presentation/screens/home_page/data/models/favorites/add_to_favorites_response.dart';
import '../../presentation/screens/login/data/models/login_request_body.dart';
import '../../presentation/screens/login/data/models/login_response.dart';
import '../../presentation/screens/my_orders/data/models/order_response_goal.dart';
import '../../presentation/screens/order_steps/data/models/create_order_response_body.dart';
import '../../presentation/screens/privacy_policy_page/data/models/privacy_policy_response.dart';
import '../../presentation/screens/profile/data/models/upload_faal_response.dart';
import '../../presentation/screens/ticket_page/data/models/add_ticket_response_body.dart';
import '../../presentation/screens/ticket_page/data/models/all_tickets_response_body.dart';
import '../category/data/models/category_response_body.dart';
import '../state_list/data/models/state_response.dart';
import '../users_data/Data/models/users_response_body.dart';
import 'api_constants.dart';
import '../../presentation/screens/filter/data/models/filter_real_estate_respone.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  // final String token = Global.storageService.getUserToken();
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

///////////////////////////////////////////////////////////////////////////////////
  // Login endpoint
  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );

  //////////////////////////////////////////////////////////////////////////////////////
  // Get ALL Real Estates Endpoint
  @GET('real-estates/public/goal/sale')
  Future<AllRealEstatesResponseBody> getAllRealEstatesSale();

  @GET('real-estates/public/goal/buy')
  Future<AllRealEstatesResponseBody> getAllRealEstatesBuy();

  @GET('real-estates')
  Future<AllRealEstatesResponseBody> getAllRealEstates();

  ////////////////////////////////////////////////////////////////////////////////////////////////////
  // Get user Favorites
  @GET(ApiConstants.allFavorites)
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    //'Authorization' : 'Bearer '
  })
  Future<AllRealEstatesResponseBody> getAllFavorites(
      @Header('Authorization') String Bearer);

  ////////////////////////////////////////////////////////////////////
  // Get user Real Estates Buy
  @GET(ApiConstants.myRealEstatesBuy)
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    // 'Authorization' : 'Bearer $token'
  })
  Future<MyRealEstatesResponse> getMyRealEstatesBuy(
      @Header('Authorization') String Bearer);

  ////////////////////////////////////////////////////////////////////
  // Get user Real Estates Sales
  @GET(ApiConstants.myRealEstatesSales)
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    // 'Authorization' : 'Bearer $token'
  })
  Future<MyRealEstatesResponse> getMyRealEstatesSales(
      @Header('Authorization') String Bearer);

  ///////////////////////////////////////////////////////////////////
  // Get Social Media links
  @GET(ApiConstants.socialMedia)
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  })
  Future<SocialMediaResponseBody> getSocialMedia();
////////////////////////////////////////////////////////////////////////////
// get comman-questions
  @GET(ApiConstants.commanQuestions)
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  })
  Future<CommanQuestionsResponseBody> getCommanQuestions();

  ////////////////////////////////////////////////////////////////////////////
// get user_terms
  @GET(ApiConstants.userTerms)
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  })
  Future<UserTermsResponseBody> getUserTerms();
  ////////////////////////////////////////////////////////////////////////////
// get Privacy Policy
  @GET(ApiConstants.privacyPolicy)
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  })
  Future<PrivacyPolicyResponseBody> getPrivacyPolicy();
  ////////////////////////////////////////////////////////////////////////////
// get About Us
  @GET(ApiConstants.aboutUs)
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  })
  Future<AboutUsResponseBody> getAboutUs();
  /////////////////////////////////////////////////////////////////////////////
// upload faal
  @POST(ApiConstants.uploadFaal)
  @MultiPart()
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
    "Content-Type": "multipart/form-data"
  })
  Future<UploadFaalResponseBody> uploadPdf(
      @Part() File faal_document, @Header('Authorization') String Bearer);
  ///////////////////////////////////////////////////////////////////////////////////
  // Update Faal
  @POST(ApiConstants.updateFaal)
  @MultiPart()
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
    "Content-Type": "multipart/form-data",
    '_method': 'PUT'
  })
  Future<void> updateFaal(@Part() File faal_document, @Part() String _method,
      @Header('Authorization') String Bearer);
  ///////////////////////////////////////////////////////////////////////////////////
  // Delete Faal
  @POST(ApiConstants.deleteFaal)
  @MultiPart()
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
    "Content-Type": "multipart/form-data",
    '_method': 'DELETE'
  })
  Future<void> deleteFaal(
      @Part() String _method, @Header('Authorization') String Bearer);
//////////////////////////////////////////////////////////////////////////////////////
// Get Category List
  @GET(ApiConstants.categoryList)
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
    "Content-Type": "multipart/form-data"
  })
  Future<CategoryResponseBody> getCategory();
  /////////////////////////////////////////////////////////////////////////////////////
// Get State List
  @GET('states')
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
    "Content-Type": "multipart/form-data"
  })
  Future<StateResponse> getStatesList();

////////////////////////////////////////////////////////////////////////////////////////
// Get One RealEstate Data
  @GET('${ApiConstants.getOneRealEstate}/{id}')
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
    "Content-Type": "multipart/form-data"
  })
  Future<OneRealEstateResponse> getOneRealEstate(@Path('id') String id);

  ///////////////////////////////////////////////////////////////////////////////////
  // Delete Real Estate
  @POST("${ApiConstants.deleteRealEstate}/{id}")
  @MultiPart()
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
    "Content-Type": "multipart/form-data",
    '_method': 'DELETE'
  })
  Future<void> deleteRealEstate(@Path('id') String id, @Part() String _method,
      @Header('Authorization') String Bearer);

  //////////////////////////////////////////////////////////////////////////////////////////
// Get  Faal Data
  @GET(ApiConstants.getFaal)
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
    "Content-Type": "multipart/form-data"
  })
  Future<GetFaalResponseBody> getFaal(@Header('Authorization') String Bearer);

  /////////////////////////////////////////////////////////////////////////////////////////////////
// update Note
  @POST("real-estates/{id}/private-note")
  @MultiPart()
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
    "Content-Type": "multipart/form-data",
    '_method': 'PATCH'
  })
  Future<void> updateNote(@Path('id') String id, @Part() String _method,
      @Part() String private_note, @Header('Authorization') String Bearer);

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  // change to Sale
  @GET("real-estates/{id}/to-sale")
  @MultiPart()
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
    "Content-Type": "multipart/form-data",
  })
  Future<void> chaneToSale(
      @Path('id') String id, @Header('Authorization') String Bearer);

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  // change to Buy
  @GET("real-estates/{id}/to-buy")
  @MultiPart()
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
    "Content-Type": "multipart/form-data",
  })
  Future<void> chaneToBuy(
      @Path('id') String id, @Header('Authorization') String Bearer);

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  // change to Buy
  @POST("orders/{id}/change-status")
  @MultiPart()
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
    "Content-Type": "multipart/form-data",
    '_method': 'PATCH'
  })
  Future<void> chaneStatus(
      @Path('id') String id,
      @Part() String _method,
      @Part() String order_status,
      @Header('Authorization') String Bearer);
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  // make real estate un available
  @GET("real-estates/{id}/hide")
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
    "Content-Type": "multipart/form-data",
  })
  Future<void> hideRealEstate(
      @Path('id') String id, @Header('Authorization') String Bearer);

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  // make real estate un available
  @POST(ApiConstants.createOrder)
  @MultiPart()
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
    "Content-Type": "multipart/form-data",
  })
  Future<CreateOrderResponseBody> createOrder(
      @Part() String real_estate_id, @Header('Authorization') String Bearer);

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  // get users
  @GET('users')
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
    "Content-Type": "multipart/form-data"
  })
  Future<List<UsersResponseBody>> getUsers();

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  // add Ticket
  @POST('tickets/store')
  @MultiPart()
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
    "Content-Type": "multipart/form-data"
  })
  Future<AddTicketResponseBody> addTicket(
      @Part() String type,
      @Part() String body,
      @Part() int agent_id,
      @Header('Authorization') String Bearer);

  // Get State List
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////
  // get Cities
  @GET('states/{id}')
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
    "Content-Type": "multipart/form-data"
  })
  Future<CitiesResponseBody> getCitiesList(
    @Path('id') String id,
  );

  ////////////////////////////////////////////
  // get order type sale
  @GET('orders/goal/sale')
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
    "Content-Type": "application/json"
  })
  Future<OrderResponseGoal> getOrderSaleList(
      @Header('Authorization') String Bearer);

/////////////////////////////////////////////////////////////////////////
  @GET('orders/goal/buy')
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
    "Content-Type": "application/json"
  })
  Future<OrderResponseGoal> getMyOrderBuyList(
      @Header('Authorization') String Bearer);

  //////////////////////////////////////////////////////////////////////////////////////
// Get One RealEstate Data
  @GET('${ApiConstants.getOneRealEstate}/{id}/contractors')
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
    "Content-Type": "multipart/form-data"
  })
  Future<ContractorsResponseBody> getContractors(
      @Path('id') String id, @Header('Authorization') String Bearer);

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  // report Real Estate
  @POST("real-estate/ticket")
  @MultiPart()
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
    "Content-Type": "application/json",
  })
  Future<ReportResponseBody> reportRealEstate(
      @Part() String text,
      @Part() String real_estate_id,
      @Part() String type,
      @Header('Authorization') String Bearer);

  /////////////////////////////////////////////////////////////////////////
  @GET('seller/orders/goal/sale')
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
    "Content-Type": "application/json"
  })
  Future<OrderResponseGoal> getUsersSaleOrderList(
      @Header('Authorization') String Bearer);
  ///////////////////////////
  @GET('seller/orders/goal/buy')
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
    "Content-Type": "application/json"
  })
  Future<OrderResponseGoal> getUsersBuyOrderList(
      @Header('Authorization') String Bearer);

  /////////////////////////////////////////////////////////////////////////////
// add to favorites
  @POST('favorites')
  @MultiPart()
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
    "Content-Type": "application/json",
  })
  Future<AddToFavoritesResponse> addToFavorites(
      @Part() String real_estate_id, @Header('Authorization') String Bearer);

  ///////////////////////////////////////////////////////////////////////////////////
  // Delete from favorites
  @POST('favorites/delete')
  @MultiPart()
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
    "Content-Type": "multipart/form-data",
    '_method': 'DELETE'
  })
  Future<void> deleteFromFavorites(
      @Part() String real_estate_id,
      @Part() String _method,
      @Header('Authorization') String Bearer);
  /////////////////////////////////////////////////////////////
// Filter
  @GET("/real-estates/filter/params")
  Future<FilterRealEstateResponse> getFilteredRealEstates({
    @Query('goal') String? goal,
    @Query('state_id') int? stateId,
    @Query('city_id') int? cityId,
    @Query('price_from') int? priceFrom,
    @Query('price_to') int? priceTo,
    @Query('area_from') int? areaFrom,
    @Query('area_to') int? areaTo,
    @Query('price_direction') String? price_direction,
    @Query('area_direction') String? area_direction,
    @Query('market_price') int? market_price,
  });
  /////////////////////////////////////////////////////////
// all tickets
 @GET('tickets')
 @Headers(<String, dynamic>{
   'Accept': 'application/json',
   "Content-Type": "application/json",
 })
  Future<AllTicketsResponseBody> getAllTickets( @Header('Authorization') String Bearer);
}
