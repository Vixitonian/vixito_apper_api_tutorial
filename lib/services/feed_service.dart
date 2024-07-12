import 'package:vixito_apper/models/api_result.dart';
import 'package:http/http.dart' as http;

class FeedService {
  static Future<ApiResult> fetchPosts() async {
    String url = 'https://testapi.thepivot.ng/api/test-feed/posts/test/36';

    try {
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return ApiResult(
            success: true,
            message: "Post Fetched Successfully",
            response: response);
      } else {
        return ApiResult(
            success: false,
            message: "Failed to fetch Post",
            response: response);
      }
    } catch (e) {
      print("Error: $e");
      return ApiResult(success: false, message: "An Error Occurred");
    }
  }

  static Future<ApiResult> fetchFriends() async {
    String url = 'https://testapi.thepivot.ng/api/test-feed/users';

    try {
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return ApiResult(
            success: true,
            message: "Friends Fetched Successfully",
            response: response);
      } else {
        return ApiResult(
            success: false,
            message: "Failed to fetch friends",
            response: response);
      }
    } catch (e) {
      print("Error: $e");
      return ApiResult(success: false, message: "An Error Occurred");
    }
  }
}
