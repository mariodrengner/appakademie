import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'models/all_breeds_response.dart';
import 'models/dog_response.dart';

part 'dog_api_service.g.dart';

@RestApi(baseUrl: 'https://dog.ceo/api')
abstract class DogApiService {
  factory DogApiService(Dio dio, {String baseUrl}) = _DogApiService;

  @GET('/breeds/image/random')
  Future<DogImageResponse> getRandomDogImage();

  @GET('/breeds/list/all')
  Future<AllBreedsResponse> getAllBreeds();

  @GET('/breed/{breed}/images/random')
  Future<DogImageResponse> getDogImageByBreed(@Path('breed') String breed);

  @GET('/breed/{breed}/{subBreed}/images/random')
  Future<DogImageResponse> getDogImageBySubBreed(
    @Path('breed') String breed,
    @Path('subBreed') String subBreed,
  );
}
