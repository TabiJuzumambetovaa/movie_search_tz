import 'package:dio/dio.dart';
import '../../config/dio_settings.dart';
import '../models/uni_search_model.dart';
import 'consts/consts.dart';

class MovieRepo {
  final Dio dio = DioSettings().dio;

  Future<UniSearch> searchMovies({
    String? query,
    int page = 1,
    int limit = 10,
    List<String>? selectFields,
    List<String>? notNullFields,
    List<String>? sortField,
    List<String>? sortType,
    List<String>? id,
  }) async {
    try {
      final Response response = await dio.get(
        "${AppConsts.apiUrl}movie?type=movie",
        queryParameters: {
          if (query != null) "query": query,
          "page": page,
          "limit": limit,
          if (selectFields != null && selectFields.isNotEmpty)
            "selectFields": selectFields,
          if (notNullFields != null && notNullFields.isNotEmpty)
            "notNullFields": notNullFields,
          if (sortField != null && sortField.isNotEmpty) "sortField": sortField,
          if (sortType != null && sortType.isNotEmpty) "sortType": sortType,
          if (id != null && id.isNotEmpty) "id": id,
        },
        options: Options(
          headers: {
            'X-API-KEY': 'X70MJXZ-6HA4ZQ6-KPE0TAV-VR3RP3D',
          },
        ),
      );

      if (response.statusCode == 200) {
        return UniSearch.fromJson(response.data);
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      throw Exception('Failed to load movies: $e');
    }
  }
}
