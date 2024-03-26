import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';
import 'package:naffith/global.dart';
import 'package:naffith/presentation/screens/add_advertisements/data/models/add_real_estates_request_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class AddRealApiService {
  final Dio _dio;

  AddRealApiService() : _dio = Dio(){
    // If a token is provided, set it in the Dio instance

      _dio.options.headers['Authorization'] = 'Bearer ${Global.storageService.getUserToken()}';
      _dio.options.headers['Accept'] = 'application/json';
      _dio.options.headers['Content-Type'] = 'application/json';
      _dio.interceptors.add(PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),);

  }


  Future<Response<Map<String, dynamic>>> addRealEstates(AddRealEstatesRequest addRealEstatesRequest, List<File> images) async {
    try {
      FormData formData = FormData();

      // Add non-null fields to the FormData object
      formData.fields.add(MapEntry('goal', addRealEstatesRequest.goal));
      formData.fields.add(MapEntry('price', addRealEstatesRequest.price));
      formData.fields.add(MapEntry('area', addRealEstatesRequest.area));
      formData.fields.add(MapEntry('water_meter', addRealEstatesRequest.water_meter));
      formData.fields.add(MapEntry('number_streets', addRealEstatesRequest.number_streets));
      formData.fields.add(MapEntry('street_spaces', addRealEstatesRequest.street_spaces));
      if (addRealEstatesRequest.number_bedrooms != null) {
        formData.fields.add(MapEntry('number_bedrooms', addRealEstatesRequest.number_bedrooms!));
      }
      if (addRealEstatesRequest.floor != null) {
        formData.fields.add(MapEntry('floor', addRealEstatesRequest.floor!));
      }
      if (addRealEstatesRequest.number_floors != null) {
        formData.fields.add(MapEntry('number_floors', addRealEstatesRequest.number_floors!));
      }
      if (addRealEstatesRequest.age != null) {
        formData.fields.add(MapEntry('age', addRealEstatesRequest.age!));
      }
      formData.fields.add(MapEntry('electricity_meter', addRealEstatesRequest.electricity_meter));
      formData.fields.add(MapEntry('adjective_advertiser', addRealEstatesRequest.adjective_advertiser));
      formData.fields.add(MapEntry('type', addRealEstatesRequest.type));
      formData.fields.add(MapEntry('sub_type', addRealEstatesRequest.sub_type));
      formData.fields.add(MapEntry('state_id', addRealEstatesRequest.state_id));
      formData.fields.add(MapEntry('city_id', addRealEstatesRequest.city_id));
      formData.fields.add(MapEntry('data_validity', addRealEstatesRequest.data_validity));
      formData.fields.add(MapEntry('private_note', addRealEstatesRequest.private_note));
      formData.fields.add(MapEntry('note', addRealEstatesRequest.note));
      formData.fields.add(MapEntry('financing_type', addRealEstatesRequest.financing_type));
      formData.fields.add(MapEntry('market_price', addRealEstatesRequest.market_price));
      formData.fields.add(MapEntry('bathroom', addRealEstatesRequest.bathroom));

      // Add images if the images list is not empty
      if (images.isNotEmpty) {
        for (int i = 0; i < images.length; i++) {
          formData.files.add(
            MapEntry(
              'images[$i]',
              MultipartFile.fromFileSync(
                images[i].path,
                filename: images[i].uri.pathSegments.last,
                contentType: MediaType('image', 'jpeg'), // Adjust content type as needed
              ),
            ),
          );
        }
      }

      // Add interface
      for (int i = 0; i < addRealEstatesRequest.interface.length; i++) {
        formData.fields.add(MapEntry('interface[$i]', addRealEstatesRequest.interface[i]));
      }

      // Make the API call using Dio
      Response<Map<String, dynamic>> response = await _dio.post(
        "https://naffith.osoolsys.sa/public/api/v1/real-estates",
        data: formData,
        // Add any other options as needed
      );
      var responseBody = response.data;
      // Check the status code
      if (response.statusCode == 201) {
        // Status code is 201 (Created)
        // Place your code here to handle the success case
        print('Request was successful');
      } else {
        // Status code is not 201
        // Place your code here to handle other status codes
        print('Request failed with status code: ${response.statusCode}');
      }
      print(responseBody);
      return response;
    } catch (error) {
      // Handle errors
      print('$error');
      throw error; // You might want to handle errors more gracefully
    }
  }
}