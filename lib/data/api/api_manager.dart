import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_comerence_app/data/api/api_Const.dart';
import 'package:e_comerence_app/data/api/failures.dart';
import 'package:e_comerence_app/data/model/requiest/RegisterRequest.dart';
import 'package:e_comerence_app/data/model/response/AddToCartResponseDto.dart';
import 'package:e_comerence_app/data/model/response/AddToWishListResponseDto.dart';
import 'package:e_comerence_app/data/model/response/CategoryOrBrandResponseDto.dart';
import 'package:e_comerence_app/data/model/response/GetCartResponseDto.dart';
import 'package:e_comerence_app/data/model/response/GetWishListResponseDto.dart';
import 'package:e_comerence_app/data/model/response/ProductResponseDto.dart';
import 'package:e_comerence_app/utils/shared_preference_utils.dart';
import 'package:http/http.dart' as http;

import '../model/requiest/LoginRequest.dart';
import '../model/response/LoginResponse.dart';
import '../model/response/RegisterResponseDto.dart';

class ApiManager {
  /*
  https://ecommerce.routemisr.com/api/v1/auth/signup
   */
  ApiManager._();

  /// private constructor
  static ApiManager? _instance;

  static ApiManager getInstance() {
    _instance ??= ApiManager._();
    return _instance!;
  }

  Future<Either<Failures, RegisterResponseDto>> register(String name,
      String email, String password, String rePassword, String phone) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.registerApi);
      var requestBody = RegisterRequest(
          name: name,
          email: email,
          password: password,
          rePassword: rePassword,
          phone: phone);
      var response = await http.post(url, body: requestBody.toJson());
      var registerResponse =
          RegisterResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        //success
        return Right(registerResponse);
      } else {
        return Left(Failures(
            errorMessage: registerResponse.error?.msg,
           ));
      }
    } else {
      return Left(
          Failures(errorMessage: 'Check Internet Connection', ));
    }
  }

  Future<Either<Failures, LoginResponse>> login(
      String password, String email) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.loginApi);
      var requestBody = LoginRequest(
        password: password,
        email: email,
      );
      var response = await http.post(url, body: requestBody.toJson());
      var loginResponse = LoginResponse.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        //success
        return Right(loginResponse);
      } else {
        return Left(Failures(
            errorMessage: loginResponse.message, ));
      }
    } else {
      return Left(
          Failures(errorMessage: 'Check Internet Connection', ));
    }
  }

  Future<Either<Failures, CategoryOrBrandResponseDto>> getCategories() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url =
          Uri.https(ApiConstants.baseUrl, ApiConstants.getAllCategoriesApi);
      var response = await http.get(url);
      var categoryResponse =
          CategoryOrBrandResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        //success
        return Right(categoryResponse);
      } else {
        return Left(ServerError(
            errorMessage: categoryResponse.message,
           ));
      }
    } else {
      return Left(NetworkError(
          errorMessage: 'Check Internet Connection', ));
    }
  }

  Future<Either<Failures, CategoryOrBrandResponseDto>> getBrands() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.getAllBrandsApi);
      var response = await http.get(url);
      var brandResponse =
          CategoryOrBrandResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        //success
        return Right(brandResponse);
      } else {
        return Left(ServerError(
            errorMessage: brandResponse.message,));
      }
    } else {
      return Left(NetworkError(
          errorMessage: 'Check Internet Connection',));
    }
  }

  Future<Either<Failures, ProductResponseDto>> getProducts() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.getAllProductsApi);
      var response = await http.get(url);
      var productResponse =
          ProductResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        //success
        return Right(productResponse);
      } else {
        return Left(ServerError(
            errorMessage: productResponse.message,
           ));
      }
    } else {
      return Left(NetworkError(
          errorMessage: 'Check Internet Connection',));
    }
  }

  Future<Either<Failures, GetCartResponseDto>> deleteItemInCart(
      String productId) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var token = SharedPreferenceUtils.getData("Token");
      Uri url = Uri.https(
          ApiConstants.baseUrl, "${ApiConstants.addToCartApi}/$productId");
      var response =
          await http.delete(url, headers: {'token': token.toString()});
      var deleteItemInCartResponse =
          GetCartResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        //success
        return Right(deleteItemInCartResponse);
      } else if (response.statusCode == 401) {
        return Left(Failures(
            errorMessage: deleteItemInCartResponse.message,
            ));
      } else {
        return Left(ServerError(
            errorMessage: deleteItemInCartResponse.message,
            ));
      }
    } else {
      return Left(NetworkError(
          errorMessage: 'Check Internet Connection', ));
    }
  }

  Future<Either<Failures, GetCartResponseDto>> updateCountInCart(
      String productId, int count) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var token = SharedPreferenceUtils.getData("Token");
      Uri url = Uri.https(
          ApiConstants.baseUrl, "${ApiConstants.addToCartApi}/$productId");
      var response = await http.put(url,
          headers: {'token': token.toString()}, body: {'count': "$count"});
      var updateCountInCartResponse =
          GetCartResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        //success
        return Right(updateCountInCartResponse);
      } else if (response.statusCode == 401) {
        return Left(Failures(
            errorMessage: updateCountInCartResponse.message,
            ));
      } else {
        return Left(ServerError(
            errorMessage: updateCountInCartResponse.message,
           ));
      }
    } else {
      return Left(NetworkError(
          errorMessage: 'Check Internet Connection',));
    }
  }

  Future<Either<Failures, AddToCartResponseDto>> addToCart(
      String productId) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var token = SharedPreferenceUtils.getData('Token');
      // print('Token:$token');
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.addToCartApi);
      var response = await http.post(url,
          body: {'productId': productId}, headers: {'token': token.toString()});
      //  print("response body:${response.body}");
      var addToCartResponse =
          AddToCartResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        //success
        return Right(addToCartResponse);
      } else if (response.statusCode == 401) {
        return Left(Failures(
            errorMessage: addToCartResponse.message,
            ));
      } else {
        return Left(ServerError(
            errorMessage: addToCartResponse.message,
            ));
      }
    } else {
      return Left(NetworkError(
          errorMessage: 'Check Internet Connection', ));
    }
  }

  Future<Either<Failures, AddToWishListResponseDto>> addToWishList(
      String productId) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var token = SharedPreferenceUtils.getData('Token');
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.addToWishListApi);
      var response = await http.post(url,
          body: {'productId': productId}, headers: {'token': token.toString()});
      var addToWishListResponse =
          AddToWishListResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        //success
        return Right(addToWishListResponse);
      } else if (response.statusCode == 401) {
        return Left(Failures(
            errorMessage: addToWishListResponse.message,
            ));
      } else {
        return Left(ServerError(
            errorMessage: addToWishListResponse.message,
            ));
      }
    } else {
      return Left(NetworkError(
          errorMessage: 'Check Internet Connection',));
    }
  }

  Future<Either<Failures, GetCartResponseDto>> getCart() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var token = SharedPreferenceUtils.getData("Token");
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.getCartApi);
      var response = await http.get(url, headers: {'token': token.toString()});
      var getCartResponse =
          GetCartResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        //success
        return Right(getCartResponse);
      } else if (response.statusCode == 401) {
        return Left(Failures(
            errorMessage: getCartResponse.message,
            ));
      } else {
        return Left(ServerError(
            errorMessage: getCartResponse.message,
            ));
      }
    } else {
      return Left(NetworkError(
          errorMessage: 'Check Internet Connection',));
    }
  }

  Future<Either<Failures, GetWishListResponseDto>> getWishList() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var token = SharedPreferenceUtils.getData("Token");
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.getWishListApi);
      var response = await http.get(url, headers: {'token': token.toString()});
      var getWishListResponse =
          GetWishListResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        //success
        return Right(getWishListResponse);
      } else if (response.statusCode == 401) {
        return Left(Failures(
            errorMessage: getWishListResponse.message,
            ));
      } else {
        return Left(ServerError(
            errorMessage: getWishListResponse.message,
            ));
      }
    } else {
      return Left(NetworkError(
          errorMessage: 'Check Internet Connection', ));
    }
  }

}
