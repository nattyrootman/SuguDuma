// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hope/screens/profile_screen/user_adress/user_adress.dart';
import 'package:hope/utiles/strings.dart';

import '../../../features/items_orders/item_orders.dart';
import 'setting_list_titlte.dart';

class SettingListItems extends StatelessWidget {
  const SettingListItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(ConstantStrings.accountSettingsTitle,
              style: Theme.of(context).textTheme.titleMedium),
          SizedBox(height: 24),
          SettingListTitle(
              title: "Mon Adress",
              subtile: ConstantStrings.mainDeliveryAddress,
              leading: Icon(Icons.home),
              onTap: () => Get.to(UserAdress())),
          SettingListTitle(
            title: "Panier",
            subtile: ConstantStrings.shoppingCart,
            leading: Icon(Icons.shopping_cart),
            onTap: () {},
          ),
          SettingListTitle(
              title: "Coupons",
              subtile: ConstantStrings.yourCoupons,
              leading: Icon(Icons.discount),
              onTap: () {}),
          SettingListTitle(
              title: "Mes Commandes",
              subtile: ConstantStrings.orderHistory,
              leading: Icon(Icons.shopping_bag),
              onTap: () => Get.to(ListItemOrderScreen())),
          SettingListTitle(
              title: "Compte Bancaire",
              subtile: ConstantStrings.bankInformation,
              leading: Icon(Icons.location_on),
              onTap: () {}),
          SettingListTitle(
              title: "Notifiaction",
              subtile: ConstantStrings.notifications,
              leading: Icon(Icons.notifications),
              onTap: () {}),
          SettingListTitle(
              title: "Politique de compte",
              subtile: ConstantStrings.privacyPolicy,
              leading: Icon(Icons.policy),
              onTap: () {}),
          Text(ConstantStrings.appSettingsTitle,
              style: Theme.of(context).textTheme.titleMedium),
          SettingListTitle(
              title: "Données",
              subtile: ConstantStrings.restoreData,
              leading: Icon(Icons.data_usage),
              onTap: () {}),
          SettingListTitle(
              title: "Geolocation",
              subtile: ConstantStrings.geolocation,
              trailing: Switch(value: false, onChanged: (value) {}),
              leading: Icon(Icons.my_location_sharp),
              onTap: () {}),
          SettingListTitle(
              trailing: Switch(value: true, onChanged: (value) {}),
              title: "Mode Sombre",
              subtile: ConstantStrings.darkMode,
              leading: Icon(Icons.dark_mode),
              onTap: () {}),
          SizedBox(
            height: 24,
          )
        ],
      ),
    );
  }
}
