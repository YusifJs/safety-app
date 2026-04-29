import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:safety_app/features/follow-me/data/routing_response.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://api.openrouteservice.org/v2/")
abstract class MapApiService {
  factory MapApiService(Dio dio, {String baseUrl}) = _MapApiService;

  @GET("directions/driving-car")
  Future<RoutingResponse> getRoute(
    @Query("api_key") String apiKey,
    @Query("start") String start,
    @Query("end") String end,
  );
}
