import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  Future<String> getTokenInsee() async {
    var headers = {
      'Authorization': 'Basic NFBYS1VWUjVHQVEzTDlRU1NxcFNKRmVDOUVRYTplcFAzSTBmeWZNNzZyNEhWU1JGNlRtUjNuVThh',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          'INSEE=rd4o00000000000000000000ffff0ac348b1o9443; pdapimgateway=rd4o00000000000000000000ffff0ac348ado8280'
    };
    var request = http.Request('POST', Uri.parse('https://api.insee.fr/token'));
    request.bodyFields = {'grant_type': 'client_credentials'};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return await response.stream.bytesToString();
    } else {
      print(response.reasonPhrase);
    }
    return "400";
  }

  Future<int> infoSiren(String siren) async {
    String json = await getTokenInsee();
    if (json != "400") {
      final data = jsonDecode(json);
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${data["access_token"]}',
        'Cookie':
            'INSEE=rd4o00000000000000000000ffff0ac34808o80; pdapimgateway=rd4o00000000000000000000ffff0ac348ado8280'
      };
      var request = http.Request('GET', Uri.parse('https://api.insee.fr/entreprises/sirene/V3/siren/$siren'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        return response.statusCode;
      } else {
        print(response.reasonPhrase);
      }
    } else {
      print("error");
    }
    return 400;
  }
}
