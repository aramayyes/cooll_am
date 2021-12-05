import 'package:carousel_slider/carousel_slider.dart';
import 'package:cooll/api/dtos/product_dto.dart';
import 'package:cooll/extensions/context_extensions.dart';
import 'package:cooll/theme/app_colors.dart';
import 'package:cooll/theme/app_dimens.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final ProductDto product;

  const ProductCard({
    required this.product,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimens.cardBorderRadius),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: AppDimens.blurRadius,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDimens.cardBorderRadius),
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.33,
                viewportFraction: 1,
              ),
              items: product.images.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      color: AppColors.background,
                      child: FancyShimmerImage(
                        imageUrl: i,
                        boxFit: BoxFit.cover,
                        errorWidget: const Icon(
                          Icons.broken_image_outlined,
                          size: 48,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: AppColors.background,
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.year.toString(),
                          style: context.textTheme.caption,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3.0),
                          child: Text(
                            product.name,
                            overflow: TextOverflow.ellipsis,
                            style: context.textTheme.caption!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          context.l.productCardMileage(product.mileage),
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.caption,
                        ),
                        if (product.engineCapacity != null)
                          Text(
                            context.l.productCardEngineCapacity(
                              product.engineCapacity!,
                            ),
                            overflow: TextOverflow.ellipsis,
                            style: context.textTheme.caption,
                          ),
                      ],
                    ),
                    Text(
                      context.l.price(product.price),
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.caption!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
