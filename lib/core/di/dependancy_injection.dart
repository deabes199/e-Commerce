import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hero_store_app/core/networking/api/api_services.dart';
import 'package:hero_store_app/core/networking/api/dio_factory.dart';
import 'package:hero_store_app/features/account/logic/cubits/cubit/image_cubit.dart';
import 'package:hero_store_app/features/wishList/logic/cubit/favorites_cubit.dart';
import 'package:hero_store_app/features/products/data/repo/products_repo.dart';
import 'package:hero_store_app/features/products/logic/cubit/category_cubit.dart';
import 'package:hero_store_app/features/login/data/repo/login_repo.dart';
import 'package:hero_store_app/features/login/logic/cubit/login_cubit.dart';
import 'package:hero_store_app/features/home/data/repo/home_repo.dart';
import 'package:hero_store_app/features/home/logic/home_cubit/home_cubit.dart';
import 'package:hero_store_app/features/products/logic/search_cubit/cubit/search_cubit.dart';
import 'package:hero_store_app/features/account/data/profile_repo.dart';
import 'package:hero_store_app/features/account/logic/cubits/profile_info_cubit.dart';
import 'package:hero_store_app/features/signup/data/repo/signup_repo.dart';
import 'package:hero_store_app/features/signup/logic/cubit/signup_cubit.dart';

final getIt = GetIt.instance;

Future<void> setUpGetIt() async {
  //login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo());
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  //signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo());
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

  //api//////
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio));

  //home
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));

  //Products
  getIt.registerLazySingleton<ProductsRepo>(() => ProductsRepo(getIt()));
  getIt.registerFactory<CategoryCubit>(() => CategoryCubit(getIt()));
  getIt.registerFactory<SearchproductCubit>(() => SearchproductCubit(getIt()));

  // profile

  getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepo());
  getIt.registerFactory<ProfileInfoCubit>(() => ProfileInfoCubit(getIt()));
  getIt.registerFactory<ImageCubit>(() => ImageCubit(getIt()));
// favorites

  getIt.registerFactory<FavoritesCubit>(() => FavoritesCubit());
}
