// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:covid_19_app/src/tools/constants.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../models/http_service_response.dart';

class HttpService {
  String url = constants.domain;
  String timeoutMessage =
      'We couldn\'t connect to our servers. Try again in a moment.';

  Future<HttpServiceResponse> get(
      {required String endpoint, http.Client? client}) async {
    http.Client? httpClient = client ?? http.Client();

    try {
      Response response =
          await httpClient.get(Uri.parse("$url$endpoint"), headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        // if (await token() != null)
        //   HttpHeaders.authorizationHeader: "Bearer ${await token()}",
      }).timeout(
        const Duration(seconds: 10),
        onTimeout: (() => throw TimeoutException("{'error': 'Timeout'}")),
      );
      return validateResponse(response);
    } on TimeoutException catch (_) {
      return HttpServiceResponse(success: false, message: timeoutMessage);
    } catch (e) {
      return HttpServiceResponse(success: false, message: "$e");
    }
  }

// Se necesita estos argumentos para realizar las peticiones de retanqueo
  // ignore: long-parameter-list
  Future<HttpServiceResponse> post({
    required String endpoint,
    required Map<String, dynamic> body,
    bool? needAuth = true,
    http.Client? client,
  }) async {
    log('[http-service] [post]'
        '\nbody: ${json.encode(body)}');
    http.Client? httpClient = client ?? http.Client();
    try {
      Response response = await httpClient
          .post(Uri.parse("$url$endpoint"), body: json.encode(body), headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        // if (needAuth!)
        //   if (await token() != null)
        //     HttpHeaders.authorizationHeader: "Bearer ${await token()}",
      }).timeout(
        const Duration(seconds: 250),
        onTimeout: (() => throw TimeoutException("{'error': 'Timeout'}")),
      );
      return await validateResponse(response);
    } on SocketException catch (_) {
      return HttpServiceResponse(
          success: false,
          errorCode: 250,
          message:
              "Parece que no tienes internet. Revisa tu conexión e inténtalo de nuevo.");
    } on TimeoutException catch (_) {
      return HttpServiceResponse(success: false, message: timeoutMessage);
    } catch (e) {
      return HttpServiceResponse(
          success: false, body: "$e", message: "Error: $e");
    }
  }

  /// Necesario para validar la respuesta que se obtiene desde el back
  // ignore: long-method
  Future<HttpServiceResponse> validateResponse(Response response) async {
    bool success = false;
    String res = response.request?.method != "GET"
        ? '\n[response]: ${response.body}'
        : "";
    log(
      '[http-service] [validateResponse]'
      '$res'
      '\ncode: ${response.statusCode}'
      '\nrequest: ${response.request}',
    );

    switch (response.statusCode) {
      case 200:
      case 201:
      case 202:
        success = true;
        break;
      case 401:
      case 404:
      case 408:
      case 500:
      case 503:
        success = false;
        break;

      default:
        return HttpServiceResponse(
            success: false,
            errorCode: 100,
            message:
                "Parece que no tienes internet. Revisa tu conexión e inténtalo de nuevo.");
    }

    return HttpServiceResponse(
        success: success, message: response.body, body: response.body);
  }
}

final HttpService httpService = HttpService();
