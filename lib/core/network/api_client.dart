import 'package:fin_uslugi/features/loans/data/models/response_data.dart';
import 'package:fin_uslugi/features/local_notifications/data/models/chat_request_body.dart';
import 'package:fin_uslugi/features/local_notifications/data/models/response_message_model.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:fin_uslugi/core/network/api_path.dart';
part 'api_client.g.dart';

@injectable
@RestApi(baseUrl: ApiPath.baseUrl)
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @GET(ApiPath.creditSearch)
  Future<ResponseData> searchCredit(@Path('searchString') String searchString,
      @Path('query') String query, @Path('page') int page);

  @POST(ApiPath.getLastMessage)
  Future<MessagesResponse> getBackgroundNotification(@Body() JsonMap body);
}
