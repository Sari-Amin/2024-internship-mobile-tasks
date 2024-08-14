import 'package:first_application/core/network/network_info.dart';
import 'package:first_application/features/product/data/data_sources/remote_data_source.dart';
import 'package:first_application/features/product/data/repositories/product_repositorie_impl.dart';
import 'package:first_application/features/product/domain/repositories/product_repository.dart';
import 'package:first_application/features/product/domain/use%20cases/delete_product_usecase.dart';
import 'package:first_application/features/product/domain/use%20cases/get_all_products_usecase.dart';
import 'package:first_application/features/product/domain/use%20cases/insert_product_usecase.dart';
import 'package:first_application/features/product/domain/use%20cases/update_product_usecase.dart';
import 'package:first_application/features/product/presentation/bloc/product_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'features/product/data/data_sources/local_data_source.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // fearure - product
  //bloc
  sl.registerFactory(() => ProductBloc(sl()));
  //use cases
  sl.registerLazySingleton(() => DeleteProductUsecase(sl()));
  sl.registerLazySingleton(() => GetAllProductsUsecase(sl()));
  sl.registerLazySingleton(() => GetAllProductsUsecase(sl()));
  sl.registerLazySingleton(() => UpdateProductUsecase(sl()));
  sl.registerLazySingleton(() => InsertProductUsecase(sl()));

  //repository
  sl.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(productRemoteDataSource: sl()));
  //data scources
  sl.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<ProductLocalDataSource>(
    () => ProductLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );

  //core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      sl(),
    ),
  );
  //external
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
