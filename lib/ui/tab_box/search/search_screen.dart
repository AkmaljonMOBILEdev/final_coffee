import 'package:final_coffee/cubits/coffee/coffee_cubit.dart';
import 'package:final_coffee/ui/app_routes.dart';
import 'package:final_coffee/ui/tab_box/search/widgets/holder.dart';
import 'package:final_coffee/ui/tab_box/search/widgets/search_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../../cubits/search/search_cubit.dart';
import '../../../utils/icons.dart';
import '../../../utils/size_extensions.dart';
import '../../widgets/text_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = '';
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("What you need?"),
      ),
      body: Column(
        children: [
          // Static part
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Stack(
              children: [
                GlobalTextField(
                  hintText: "Search",
                  controller: controller,
                  onChanged: (v) {
                    if(v.isEmpty){
                      BlocProvider.of<SearchCubit>(context).changeState(SearchInitial());
                    }
                    setState(() {
                      query = v;
                    });
                  },
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: SearchButton(onSearch: () {
                      context.read<SearchCubit>().search(query);
                    })),
              ],
            ),
          ),

          // Dynamic part
          Expanded(
            child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
              if (state is SearchInitial) {
                return buildSearchInitial(context);
              } else if (state is SearchSuccess) {
                return buildSearchSuccess(state);
              } else if (state is SearchNotFound) {
                return buildSearchNotFound(context);
              }
              return const SizedBox();
            }),
          ),
        ],
      ),
    );
  }

  Widget buildSearchInitial(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: editH(260),
            width: editW(260),
            child: Lottie.asset(AppIcons.searching)),
        Text(
          "Achieve your dreams!",
          style: Theme.of(context).textTheme.titleMedium,
        )
      ],
    );
  }

  Widget buildSearchSuccess(SearchSuccess state) {
    return GridView.count(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      crossAxisCount: 2,
      mainAxisSpacing: 20.h,
      crossAxisSpacing: 0.w,
      childAspectRatio: childAspectRatio,
      children: [
        ...List.generate(state.items.length, (index) {
          return SearchedCoffee(
            coffeeModel: state.items[index],
            onAdd: () {
            },
            onMove: () {
              Navigator.pushNamed(
                context,
                RouteNames.detailed,
                arguments: state.items[index],
              );
            },
          );
        }),
      ],
    );
  }

  Widget buildSearchNotFound(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: editH(260),
          width: editW(260),
          child: Lottie.asset(AppIcons.notFound),
        ),
        Text(
          "Not found!",
          style: Theme.of(context).textTheme.titleMedium,
        )
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
