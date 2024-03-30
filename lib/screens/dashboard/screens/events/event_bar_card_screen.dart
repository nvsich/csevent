import 'package:csevent/core/app_export.dart';
import 'package:csevent/dto/api_response.dart';
import 'package:csevent/dto/cocktail_with_ingredients_response.dart';
import 'package:csevent/dto/enum/cocktail_type.dart';
import 'package:csevent/routes/route_generator.dart';
import 'package:csevent/service/cache_service.dart';
import 'package:csevent/service/cocktail_service.dart';
import 'package:csevent/widgets/app_bar/appbar_leading_image.dart';
import 'package:csevent/widgets/app_bar/appbar_title.dart';
import 'package:csevent/widgets/app_bar/custom_app_bar_image.dart';
import 'package:csevent/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';

class EventBarCardScreen extends StatefulWidget {
  const EventBarCardScreen({
    super.key,
    required this.organizationId,
    required this.eventId,
  });

  final String organizationId;

  final String eventId;

  @override
  State<EventBarCardScreen> createState() => _EventBarCardScreenState();
}

class _EventBarCardScreenState extends State<EventBarCardScreen> {
  final CocktailService cocktailService = GetIt.I<CocktailService>();

  final CacheService cacheService = GetIt.I<CacheService>();

  late Future<ApiResponse<List<CocktailWithIngredientsResponse>>>
      cocktailsFuture;

  @override
  void initState() {
    super.initState();
    cocktailsFuture = fetchCoctails(
      widget.organizationId,
      widget.eventId,
    );
  }

  void refreshState() {
    setState(() {
      cocktailsFuture = fetchCoctails(
        widget.organizationId,
        widget.eventId,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: 3.v),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FutureBuilder(
                    future: cocktailsFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return const Center(
                          child: Text('Ошибка загрузки'),
                        );
                      } else if (snapshot.hasData) {
                        var cocktails = snapshot.data!.data!;
                        return ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: cocktails.length,
                          itemBuilder: (context, index) {
                            var cocktail = cocktails[index];
                            return _buildDrink(
                              context,
                              drinkName: cocktail.name,
                              cocktailType: cocktail.type,
                            );
                          },
                        );
                      } else {
                        return const Center(
                          child: Text('Нет данных'),
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 20.0,
                left: 50,
                right: 50,
              ),
              child: CustomElevatedButton(
                text: "Добавить коктейль",
                onPressed: () async {
                  var result = await Navigator.of(context).pushNamed(
                    RouteGenerator.addCocktail,
                    arguments: <String, String>{
                      'organizationId': widget.organizationId,
                      'eventId': widget.eventId,
                    },
                  );
                  if (result == true) {
                    refreshState();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<ApiResponse<List<CocktailWithIngredientsResponse>>> fetchCoctails(
    String organizationId,
    String eventId,
  ) async {
    String token = await cacheService.loadAuthToken();
    if (token == CacheService.noToken) {
      Fluttertoast.showToast(msg: "Ошибка аутентификации");
    }
    return await cocktailService.getAll(
      token,
      organizationId,
      eventId,
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 45.h,
      leading: AppbarLeadingImage(
        onTap: () async {
          Navigator.of(context).pop();
        },
        imagePath: ImageConstant.backButton,
        margin: EdgeInsets.only(
          left: 18.h,
          top: 16.v,
          bottom: 19.v,
        ),
      ),
      centerTitle: true,
      title: const AppbarTitle(
        text: "Барная карта",
      ),
    );
  }

  Widget _buildDrink(
    BuildContext context, {
    required String drinkName,
    required CocktailType cocktailType,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          RouteGenerator.cocktailDetails,
          arguments: drinkName,
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 1.h),
        padding: EdgeInsets.symmetric(vertical: 11.v),
        decoration: AppDecoration.outlineBlack900,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageView(
              imagePath: switch (cocktailType) {
                CocktailType.SHOT => ImageConstant.shotDrink,
                CocktailType.HIGHBALL => ImageConstant.longDrink
              },
              height: 66.adaptSize,
              width: 66.adaptSize,
              margin: EdgeInsets.only(left: 17.h),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 15.h,
                  top: 9.v,
                  bottom: 9.v,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      drinkName,
                      style: theme.textTheme.titleLarge,
                    ),
                    SizedBox(
                      height: 7.v,
                    ),
                    Wrap(
                      runSpacing: 10.v,
                      spacing: 10.h,
                      children: List<Widget>.generate(
                          3, (index) => _buildTagsrowItemWidget()),
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

  Widget _buildTagsrowItemWidget() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 6.h,
        vertical: 2.v,
      ),
      decoration: AppDecoration.fillBlue.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder3,
      ),
      child: Text(
        "Белый ром",
        style: theme.textTheme.bodySmall,
      ),
    );
  }
}
