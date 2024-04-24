
import 'package:http/http.dart' as http;
class NetworkHelper {
  NetworkHelper({required this.url });
  String url;
  Future<String> getData() async {
    http.Response response = await http.get(Uri.parse(url));
    String data = response.body;
    if (response.statusCode == 200) {
      print('Okay');
    } else{
      print(response.statusCode);
    }
    return data;
  }
}