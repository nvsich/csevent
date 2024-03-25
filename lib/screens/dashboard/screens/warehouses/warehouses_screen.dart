import 'package:csevent/core/app_export.dart';
import 'package:csevent/routes/route_generator.dart';
import 'package:csevent/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class WarehousesScreen extends StatelessWidget {
  const WarehousesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: 3.v),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildWarehouse(context, "Валера", "г. Троицк"),
                  _buildWarehouse(context, "Беляево", "ул. Профсоюзная 228"),
                  _buildWarehouse(context, "Покра", "Покровский бульвар 11"),
                  _buildWarehouse(context, "Валера", "г. Троицк"),
                  _buildWarehouse(context, "Беляево", "ул. Профсоюзная 228"),
                  _buildWarehouse(context, "Покра", "Покровский бульвар 11"),
                  _buildWarehouse(context, "Валера", "г. Троицк"),
                  _buildWarehouse(context, "Беляево", "ул. Профсоюзная 228"),
                  _buildWarehouse(context, "Покра", "Покровский бульвар 11"),
                  _buildWarehouse(context, "Валера", "г. Троицк"),
                  _buildWarehouse(context, "Беляево", "ул. Профсоюзная 228"),
                  _buildWarehouse(context, "Покра", "Покровский бульвар 11"),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20.0,
            left: 50,
            right: 50,
            child: Center(
              child: CustomElevatedButton(
                text: "Добавить новый склад",
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(RouteGenerator.addNewWarehouse);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWarehouse(
    BuildContext context,
    String warehouseName,
    String warehouseAddress,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          RouteGenerator.warehouseDetails,
          arguments: warehouseName,
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 2.h),
        padding: EdgeInsets.all(17.h),
        decoration: AppDecoration.outlineBlack900,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 2.v),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    warehouseName,
                    style: theme.textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 5.v,
                  ),
                  Text(
                    warehouseAddress,
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 33.v),
              child: Text(
                "Что на складе?",
                style: theme.textTheme.labelLarge,
              ),
            )
          ],
        ),
      ),
    );
  }
}
