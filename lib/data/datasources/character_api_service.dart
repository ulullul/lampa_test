import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rnm_t/data/provider/api_provider.dart';

import '../models/character/character_pagination_model.dart';

part 'character_api_service.g.dart';

@RestApi()
abstract class CharacterApiService {
  factory CharacterApiService(ApiProvider dio, {String baseUrl}) =
      _CharacterApiService;

  @GET('/character')
  Future<HttpResponse<CharacterPaginationModel>> getCharacters({
    @Query('page') int? page,
    @Query('name') String? search,
  });
}
