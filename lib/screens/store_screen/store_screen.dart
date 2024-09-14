// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hope/common_widgets.dart/my_grid_view.dart';
import 'package:hope/common_widgets.dart/myproduct_card.dart';
import 'package:hope/screens/store_screen/my_nested_scrollview.dart';
import 'package:hope/screens/store_screen/store_constants/store_constant.dart';
import 'package:hope/utiles/mytext_field.dart';

import 'store_widgets/chip_wrap_widget.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
          appBar: AppBar(
              actions: [Icon(Icons.shopping_cart)], title: Text("Boutique")),
          body: MyNestedScrollview(
              headerSliverBuilder: (_, bool) {
                return [
                  SliverAppBar(
                      automaticallyImplyLeading: false,
                      expandedHeight: 300,
                      floating: true,
                      pinned: true,
                      flexibleSpace: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            children: [
                              SizedBox(
                                height: 24,
                              ),
                              MyTextField(
                                text: " Search",
                                suffix: Icon(Icons.search),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              ChipWrapWidget(),
                              SizedBox(
                                height: 24,
                              ),
                            ]),
                      ),
                      bottom:
                          TabBar(isScrollable: true, tabs: StoreConstant.tabs))
                ];
              },
              body: TabBarView(children: StoreConstant.tabView))),
    );
  }
}
