import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:syne_portfolio_app/models/syne.dart';

class ApiCall {
  bool isLoading = false;
  http.Client client = http.Client();
  Future<Syne> getSyneData() async {
    final responseSyneData = await client.get(
        'https://sheet.best/api/sheets/8cf27984-4c22-44c0-9bd0-f3ed8fad928a',
        headers: {'Accept': 'application/json'});
    if (responseSyneData.statusCode == 200) {
      return Syne.fromJson(json.decode(responseSyneData.body)[0]);
    } else {}
  }
}
