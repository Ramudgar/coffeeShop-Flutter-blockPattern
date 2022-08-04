import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../Controller/AdminController.dart';
import '../../../Models/Home/ProductHome.dart';

part 'admin_product_event.dart';
part 'admin_product_state.dart';

class AdminProductBloc extends Bloc<AdminProductEvent, AdminProductstate> {
  AdminProductBloc() : super(AdminProductstate());

  @override
  Stream<AdminProductstate> mapEventToState(AdminProductEvent event) async* {
    if (event is AddProductEvent) {
      yield* _mapAddProduct(
        event.product,
      );
    } else if (event is UpdateProductEvent) {
      yield* _mapUpdateProduct(event.product);
    } else if (event is DeleteProductEvent) {
      yield* _mapDeleteProduct(event.id);
    } else if (event is GetProductDetailsByIdEvent) {
      yield* _mapGetProductById(event.id);
    }
  }

  Stream<AdminProductstate> _mapAddProduct(Product product) async* {
    try {
      yield LoadingAddProductstate();
      await Future.delayed(Duration(seconds: 1));
      final data = await adminController.addProduct(product: product);

      if (data.resp)
        yield AddProductsuccessState();
      else
        yield FailureAddProductstate(error: data.msj);
    } catch (e) {
      yield FailureAddProductstate(error: e.toString());
    }
  }

  Stream<AdminProductstate> _mapUpdateProduct(Product product) async* {
    try {
      yield LoadingUpdateProductstate();
      await Future.delayed(Duration(seconds: 2));

      final data = await adminController.updateProduct(product: product);

      if (data.resp) {
        yield UpdateProductsuccessState();
      } else {
        yield FailureUpdateProductstate(error: data.msj);
      }
    } catch (e) {
      yield FailureUpdateProductstate(error: e.toString());
    }
  }

  Stream<AdminProductstate> _mapDeleteProduct(String id) async* {
    try {
      yield DeleteProductLoadingState();
      await Future.delayed(Duration(seconds: 2));

      final data = await adminController.deleteProduct(id: id);
      if (data.resp) {
        yield DeleteProductsuccessState();
      } else {
        yield DeleteProductFailureState(error: data.msj);
      }
    } catch (e) {
      yield DeleteProductFailureState(error: e.toString());
    }
  }

  Stream<AdminProductstate> _mapGetProductById(String id) async* {
    try {
      yield GetProductByIdLoadingState();
      await Future.delayed(Duration(seconds: 2));

      final data = await adminController.getProductById(id: id);
      if (data.resp) {
        yield GetProductByIdSuccessState();
      } else {
        yield GetProductByIdFailureState(error: data.msj);
      }
    } catch (e) {
      yield GetProductByIdFailureState(error: e.toString());
    }
  }
}
