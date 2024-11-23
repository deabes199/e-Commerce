// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      products: (json['products'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'products': instance.products,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      (json['reviews'] as List<dynamic>)
          .map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      category: json['category'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      rating: (json['rating'] as num?)?.toDouble(),
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      stock: (json['stock'] as num?)?.toInt(),
      brand: json['brand'] as String?,
      mainImage: json['thumbnail'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'price': instance.price,
      'rating': instance.rating,
      'images': instance.images,
      'stock': instance.stock,
      'brand': instance.brand,
      'thumbnail': instance.mainImage,
      'reviews': instance.reviews,
    };

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
      comment: json['comment'] as String,
      reviewerName: json['reviewerName'] as String,
      rating: (json['rating'] as num).toDouble(),
      reviewerEmail: json['reviewerEmail'] as String,
      date: json['date'] as String,
    );

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'comment': instance.comment,
      'reviewerName': instance.reviewerName,
      'rating': instance.rating,
      'reviewerEmail': instance.reviewerEmail,
      'date': instance.date,
    };
