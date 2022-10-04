import 'package:http/http.dart' as http;

class RESTService {
  static Future<http.Response> performPOSTRequest({
    required String httpUrl,
    bool isAuth = false,
    String contentType = 'application/json',
    String? body,
    Map<String, String>? header,
    Map<String, String> param = const {},
  }) async {
    if (param.isNotEmpty) {
      httpUrl += paramParser(param: param);
    }

    final request = http.Request('POST', Uri.parse(httpUrl));
    final Map<String, String> headers = {
      'Content-Type': contentType,
    };
    // if (isAuth) {
    //   final token = await FirebaseAuth.instance.currentUser!.getIdToken(true);
    //   headers['Authorization'] = 'Bearer $token';
    //   if (header != null) {
    //     headers.addAll(header);
    //   }
    // }
    if (body != null) {
      request.body = body;
    }
    request.followRedirects = false;
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final resultResponse = await http.Response.fromStream(response);
      return resultResponse;
    } else {
      final resultResponse = await http.Response.fromStream(response);
      throw resultResponse;
    }
  }

  static Future<http.Response> performGETRequest({
    required String httpUrl,
    bool isAuth = false,
    String defaultToken = '',
    Map<String, String>? header,
    Map<String, String> param = const {},
  }) async {
    if (param.isNotEmpty) {
      httpUrl += paramParser(param: param);
    }

    final request = http.Request('GET', Uri.parse(httpUrl));
    final Map<String, String> headers = {'Access-Control-Allow-Origin': '*'};
    // if (isAuth) {
    //   String token;
    //   if (defaultToken.isEmpty) {
    //     token = await FirebaseAuth.instance.currentUser!.getIdToken(true);
    //   } else {
    //     token = defaultToken;
    //   }
    //   headers['Authorization'] = 'Bearer $token';
    //   if (header != null) {
    //     headers.addAll(header);
    //   }
    // }
    request.followRedirects = false;
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    
    if (response.statusCode == 200) {
      final resultResponse = await http.Response.fromStream(response);
      return resultResponse;
    } else {
      final resultResponse = await http.Response.fromStream(response);
      throw resultResponse;
    }
  }

  static String paramParser({required Map<String, String> param}) {
    String parameter = '';
    for (String key in param.keys) {
      if (parameter.contains('?')) {
        parameter +=
            param[key] == null || param[key] == 'null' || param[key] == ''
                ? ''
                : '&$key=${param[key]}';
      } else {
        parameter +=
            param[key] == null || param[key] == 'null' || param[key] == ''
                ? ''
                : '?$key=${param[key]}';
      }
    }
    return parameter;
  }
}
