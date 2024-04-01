import 'package:csevent/core/app_export.dart';
import 'package:csevent/dto/api_response.dart';
import 'package:csevent/dto/warehouse.dart';
import 'package:csevent/routes/route_generator.dart';
import 'package:csevent/service/cache_service.dart';
import 'package:csevent/service/warehouse_service.dart';
import 'package:csevent/widgets/custom_dismissible_widget.dart';
import 'package:csevent/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';

class WarehousesScreen extends StatefulWidget {
  const WarehousesScreen({
    super.key,
    required this.organizationId,
  });

  final String organizationId;

  @override
  State<WarehousesScreen> createState() => _WarehousesScreenState();
}

class _WarehousesScreenState extends State<WarehousesScreen> {
  late Future<ApiResponse<List<Warehouse>>> warehousesFuture;

  final WarehouseService warehouseService = GetIt.I<WarehouseService>();

  final CacheService cacheService = GetIt.I<CacheService>();

  @override
  void initState() {
    super.initState();
    warehousesFuture = fetchWarehouses(widget.organizationId);
  }

  void refreshState() {
    setState(() {
      warehousesFuture = fetchWarehouses(widget.organizationId);
    });
  }

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
                  FutureBuilder(
                    future: warehousesFuture,
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
                        List<Warehouse> warehouses = snapshot.data!.data!;
                        return ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: warehouses.length,
                          itemBuilder: (context, index) {
                            Warehouse warehouse = warehouses[index];
                            return _buildDismissibleWarehouse(
                              context,
                              warehouseId: warehouse.id,
                              warehouseName: warehouse.name,
                              warehouseAddress: warehouse.address,
                            );
                          },
                        );
                      } else {
                        return const Center(
                          child: Text('Нет данных'),
                        );
                      }
                    },
                  ),
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
                text: "Добавить новый склад",
                onPressed: () async {
                  final result = await Navigator.of(context).pushNamed(
                    RouteGenerator.addNewWarehouse,
                    arguments: widget.organizationId,
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

  Future<ApiResponse<List<Warehouse>>> fetchWarehouses(
      String organizationId) async {
    String token = await cacheService.loadAuthToken();
    if (token == CacheService.noToken) {
      Fluttertoast.showToast(msg: "Ошибка аутентификации");
    }
    return await warehouseService.getAll(token, organizationId);
  }

  Widget _buildDismissibleWarehouse(
    BuildContext context, {
    required String warehouseId,
    required String warehouseName,
    required String warehouseAddress,
  }) {
    final Key dismissKey = ValueKey(warehouseId);

    return CustomDismissibleWidget(
      keyDismiss: dismissKey,
      direction: DismissDirection.endToStart,
      onDismissed: (direction) async {
        String token = await cacheService.loadAuthToken();
        if (token == CacheService.noToken) {
          Fluttertoast.showToast(msg: "Ошибка аутентификации");
        }
        final result = await warehouseService.delete(
          token,
          widget.organizationId,
          warehouseId,
        );

        if (result.error) {
          Fluttertoast.showToast(msg: result.message!);
        }

        refreshState();
      },
      child: _buildWarehouse(
        context,
        warehouseName,
        warehouseAddress,
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
