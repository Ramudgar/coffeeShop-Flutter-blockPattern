part of 'admin_product_bloc.dart';

@immutable
class AdminProductstate {
  final String id;
  final String Product;
  final String picture;

  AdminProductstate({this.id, this.Product, this.picture});

  AdminProductstate copyWith({String id, String Product, String picture}) =>
      AdminProductstate(
        id: id ?? this.id,
        Product: Product ?? this.Product,
        picture: id ?? this.picture,
      );
}

// --------------------------------------------------//
class AddProductstate extends AdminProductstate {}

class LoadingAddProductstate extends AdminProductstate {}

class AddProductsuccessState extends AdminProductstate {}

class FailureAddProductstate extends AdminProductstate {
  final String error;

  FailureAddProductstate({this.error});
}

// -------------------------------------------------//
class LoadingUpdateProductstate extends AdminProductstate {}

class UpdateProductsuccessState extends AdminProductstate {}

class FailureUpdateProductstate extends AdminProductstate {
  final String error;

  FailureUpdateProductstate({this.error});
}

// --------------- delete state -------------------
class DeleteProductLoadingState extends AdminProductstate {}

class DeleteProductsuccessState extends AdminProductstate {}

class DeleteProductFailureState extends AdminProductstate {
  final String error;

  DeleteProductFailureState({this.error});
}

// --------------- get Product details by id state -------------------
class GetProductByIdLoadingState extends AdminProductstate {}

class GetProductByIdSuccessState extends AdminProductstate {}

class GetProductByIdFailureState extends AdminProductstate {
  final String error;

  GetProductByIdFailureState({this.error});
}
