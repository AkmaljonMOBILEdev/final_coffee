import 'package:final_coffee/cubits/coffee/coffee_cubit.dart';
import 'package:final_coffee/cubits/order/order_cubit.dart';
import 'package:final_coffee/cubits/tab/tab_state.dart';
import 'package:final_coffee/cubits/user/user_cubit.dart';
import 'package:final_coffee/data/models/coffee_model/coffee_field_keys.dart';
import 'package:final_coffee/data/models/coffee_model/coffee_model.dart';
import 'package:final_coffee/data/models/user_model/user_field_keys.dart';
import 'package:final_coffee/data/network/user_repository.dart';
import 'package:final_coffee/services/service_locator/service_locator.dart';
import 'package:final_coffee/ui/tab_box/home/widgets/coffee_holder.dart';
import 'package:final_coffee/ui/tab_box/home/widgets/promotion.dart';
import 'package:final_coffee/ui/tab_box/home/widgets/searcher_widget.dart';
import 'package:final_coffee/ui/tab_box/home/widgets/sliver_appbar.dart';
import 'package:final_coffee/ui/tab_box/home/widgets/type_holder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../cubits/tab/tab_cubit.dart';
import '../../../data/models/type_model/type_model.dart';
import '../../../utils/colors.dart';
import '../../../utils/size_extensions.dart';
import '../../app_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TabCubit, TabState>(
        builder: (context, state) {
          return StreamBuilder<List<CoffeeModel>>(
              stream: getIt
                  .get<FirebaseRepository>()
                  .getAllCoffees(type: context.watch<TabCubit>().state.type),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error.toString()}'),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text('No coffee data available.'),
                  );
                }
                return CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: <Widget>[
                    const HomeSliverAppBar(),
                    SliverToBoxAdapter(
                      child: SearcherWidget(onSearch: () {
                        context.read<TabCubit>().changeTabIndex(1);
                      }),
                    ),
                    const SliverToBoxAdapter(
                      child: PromotionHolder(),
                    ),

                    SliverPersistentHeader(
                      pinned: true,
                      delegate: SliverAppBarDelegate(
                        minHeight: 130,
                        maxHeight: 135,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 24.h),
                          color: AppColors.white,
                          child: ListView(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            children: [
                              for (int i = 0; i < coffeeTypes.length; i++)
                                CoffeeTypeHolder(
                                  image: coffeeTypes[i].image,
                                  title: coffeeTypes[i].title,
                                  onTap: () {
                                    context
                                        .read<TabCubit>()
                                        .changeSelectedIndex(i);
                                    context
                                        .read<TabCubit>()
                                        .changeType(coffeeTypes[i].title);
                                  },
                                  isSelected: i ==
                                      context
                                          .watch<TabCubit>()
                                          .state
                                          .selectedIndex,
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // List of coffee items
                    SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return CoffeeHolder(
                            coffeeModel: snapshot.data![index],
                            onAdd: () {
                              context.read<OrderCubit>().addOrder(snapshot.data![index]);
                            },
                            onMove: () {
                              Navigator.pushNamed(context, RouteNames.detailed,
                                  arguments: snapshot.data![index]);
                            },
                          );
                        },
                        childCount: snapshot.data!.length,
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20.h,
                        crossAxisSpacing: 0.w,
                        childAspectRatio: childAspectRatio,
                      ),
                    ),
                  ],
                );
              });
        },
      ),
    );
  }
}
