

import 'package:autoplusRyan/ryan/utils/constants/colors.dart';
import 'package:autoplusRyan/ryan/utils/constants/sizes.dart';
import 'package:autoplusRyan/ryan/utils/device/device_utility.dart';
import 'package:autoplusRyan/ryan/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'constants/image_strings.dart';
import 'formatters/formatter.dart';

class AddressModel {
  final String id;
  final String name;
  final String phoneNumber;
  final String street;
  final String city;
  final String state;
  final String postalCode;
  final String country;

  AddressModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
  });

  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);


  static AddressModel empty() => AddressModel(id: '', name: '', phoneNumber: '', street: '', city: '', state: '', postalCode: '', country: '');



  @override
  String toString() {
    return '$street, $city, $state $postalCode, $country';
  }
}


class TProfileMenu extends StatelessWidget {
  const TProfileMenu({
    super.key,
    required this.onPressed,
    required this.title,
    required this.value,
    this.icon = Icons.arrow_right,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems / 1.5),
        child: Row(
          children: [
            Expanded(flex: 3, child: Text(title, style: Theme.of(context).textTheme.bodySmall)),
            Expanded(
              flex: 5,
              child: Text(value, style: Theme.of(context).textTheme.bodyMedium, overflow: TextOverflow.ellipsis),
            ),
            Expanded(child: Icon(icon, size: 18)),
          ],
        ),
      ),
    );
  }
}


class TDummyData {
  /// -- User
  static final UserModel user = UserModel(
    firstName: 'Ryan',
    lastName: 'Liu',
    email: 'Ryan.liu1@ontariotechu.net',
    phoneNumber: '+12312312311',
    password: '',
    profilePicture: TImages.user,
    addresses: [
      AddressModel(
        id: '1',
        name: 'Ryan Liu',
        phoneNumber: '+12312312311',
        street: 'Founders Lot 2',
        city: 'Oshawa',
        state: 'Ontario',
        postalCode: '123123',
        country: 'CAN',
      ),
      AddressModel(
        id: '2',
        name: 'Kayla Ho',
        phoneNumber: '+12312312311',
        street: 'Founders Lot 2',
        city: 'Oshawa',
        state: 'Ontario',
        postalCode: '123123',
        country: 'CAN',
      ),
    ],
  );  
}


class UserModel {
  final String? id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String password;
  final String profilePicture;
  final CartModel? cart;
  final List<AddressModel>? addresses;

  UserModel({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.profilePicture,
    this.cart,
    this.addresses
  });

  /// Helpers
  String get fullName => '$firstName $lastName';
  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);


  static UserModel empty() => UserModel(firstName: '', lastName: '', email: '', phoneNumber: '', password: '', profilePicture: '');
}


class TUserProfileCard extends StatelessWidget {
  const TUserProfileCard({
    super.key, required this.user, required this.actionButtonOnPressed,
  });

  final UserModel user;
  final VoidCallback actionButtonOnPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: TCircularImage(
          padding: 0,
          image: user.profilePicture, width: 50, height: 50, fit: BoxFit.cover),
      title: Text(
        user.fullName,
        style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),
      ),
      subtitle: Text(
        user.email,
        style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),
      ),
      trailing: IconButton(
        onPressed: actionButtonOnPressed,
        icon: const Icon(Icons.edit, color: TColors.white),
      ),
    );
  }
}

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key,
    this.onPressed,
    this.textColor,
    this.buttonTitle = 'View all',
    required this.title,
    this.showActionButton = false,
  });

  final String title, buttonTitle;
  final Color? textColor;
  final bool showActionButton;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.headlineSmall!.apply(color: textColor)),
        showActionButton ? TextButton(onPressed: onPressed, child: Text(buttonTitle)) : const SizedBox()
      ],
    );
  }
}

class CartModel {
  String cartId;
  List<CartItemModel> items;

  CartModel({
    required this.cartId,
    required this.items,
  });

  static CartModel empty() => CartModel(cartId: '', items: []);
}

class CartItemModel {
  int quantity;
  String productId;
  String variationId;
  double? price;
  String? image;
  String? title;
  String? brandName;
  Map<String, String>? selectedVariation;

  CartItemModel({
    required this.quantity,
    required this.productId,
    required this.variationId,
    this.image,
    this.price,
    this.title,
    this.brandName,
    this.selectedVariation,
  });

  static CartItemModel empty() => CartItemModel(productId: '', variationId: '', quantity: 0);
}

class TUserAppBarProfileCard extends StatelessWidget {
  const TUserAppBarProfileCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.actionButtonOnPressed,
    required this.userCardOnPressed,
  });

  final String title, subTitle;
  final VoidCallback actionButtonOnPressed, userCardOnPressed;

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      showBackArrowIcon: false,
      title: GestureDetector(
        onTap: userCardOnPressed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.grey)),
            Text(subTitle, style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white)),
          ],
        ),
      ),
    );
  }
}

class TSingleAddressWidget extends StatelessWidget {
  const TSingleAddressWidget({
    super.key,
    required this.address,
    required this.onTap,
  });

  final AddressModel address;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Obx(
      () {
        final selectedAddressId = controller.selectedAddress.value.id;
        return GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace / 2),
            child: Row(
              children: [
                Icon(
                  selectedAddressId == address.id ? Icons.check_circle : Icons.check_circle,
                  color: selectedAddressId == address.id
                      ? TColors.primary
                      : dark
                          ? TColors.darkerGrey
                          : TColors.grey,
                ),
                const SizedBox(width: TSizes.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(address.name,
                          maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: TSizes.sm / 2),
                      Text(address.formattedPhoneNo, maxLines: 1, overflow: TextOverflow.ellipsis),
                      const SizedBox(height: TSizes.sm / 2),
                      Text(address.toString(), softWrap: true),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class TSettingsMenu extends StatelessWidget {
  const TSettingsMenu({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    this.onPressed,
    this.trailing,
  });

  final IconData icon;
  final String title, subTitle;
  final VoidCallback? onPressed;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ListTile(
        leading: Icon(icon, size: 28, color: Color.fromARGB(255, 255, 0, 0)),
        title: Text(title, style: Theme.of(context).textTheme.titleMedium),
        subtitle: Text(subTitle, style: Theme.of(context).textTheme.labelMedium),
        trailing: trailing,
      ),
    );
  }
}


class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;

  // Add init to initialize some address by default.
  @override
  void onInit() {
    selectedAddress.value = TDummyData.user.addresses![0];
    super.onInit();
  }

  Future<dynamic> selectNewAddress(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(TSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TSectionHeading(title: 'Select Address'),
              Column(
                children: TDummyData.user.addresses!
                    .map((address) => TSingleAddressWidget(
                          address: address,
                          onTap: () {
                            selectedAddress.value = address;
                            Get.back();
                          },
                        ))
                    .toList(),
              ),
              const SizedBox(height: TSizes.defaultSpace * 2),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(() => const AddNewAddressScreen()), child: const Text('Add new address')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserController extends GetxController{
  static UserController get instance => Get.find();

}


class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(showBackArrowIcon: true, title: Text('Add new Address')),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(prefixIcon: Icon(Icons.person), labelText: 'Name'),
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),
                  TextFormField(
                    decoration: const InputDecoration(prefixIcon: Icon(Icons.phone), labelText: 'Phone Number'),
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          expands: false,
                          decoration: const InputDecoration(
                            labelText: 'Street',
                            prefixIcon: Icon(Icons.apartment),
                          ),
                        ),
                      ),
                      const SizedBox(width: TSizes.spaceBtwInputFields),
                      Expanded(
                        child: TextFormField(
                          expands: false,
                          decoration: const InputDecoration(
                            labelText: 'Postal Code',
                            prefixIcon: Icon(Icons.code),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          expands: false,
                          decoration: const InputDecoration(
                            labelText: 'City',
                            prefixIcon: Icon(Icons.apartment),
                          ),
                        ),
                      ),
                      const SizedBox(width: TSizes.spaceBtwInputFields),
                      Expanded(
                        child: TextFormField(
                          expands: false,
                          decoration: const InputDecoration(
                            labelText: 'State',
                            prefixIcon: Icon(Icons.local_activity),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),
                  TextFormField(
                    decoration: const InputDecoration(prefixIcon: Icon(Icons.web), labelText: 'Country'),
                  ),
                  const SizedBox(height: TSizes.defaultSpace),
                  SizedBox(
                    width: double.infinity,
                    child:
                    ElevatedButton(onPressed: (){}, child: const Text('Save')),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Scaffold(
      appBar: TAppBar(
        showBackArrowIcon: true,
        title: Text('Addresses', style: Theme.of(context).textTheme.headlineSmall),
        actions: [TCircularIcon(icon: Icons.add, onPressed: () => Get.to(() => const AddNewAddressScreen()))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: TDummyData.user.addresses!
                .map((address) =>
                    TSingleAddressWidget(address: address, onTap: () => controller.selectedAddress.value = address))
                .toList(),
          ),
        ),
      ),
    );
  }
}



class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Custom appbar to achieve desired design goal.
  /// Bool type [showBackArrowIcon] to hide or show leading Icon with a default back Icon.
  /// For Custom Leading Icon, pass icon to [leadingIcon] property.
  /// [title] used to set custom title of the appbar.
  /// [actions] you can pass any list of desired actions List<Widgets>
  /// You can customize Horizontal Padding of Appbar inside this Widget.
  const TAppBar({
    super.key,
    this.leadingIcon,
    this.title,
    this.actions,
    this.leadingIconOnPressed,
    this.showBackArrowIcon = true,
  });

  final bool showBackArrowIcon;
  final IconData? leadingIcon;
  final Widget? title;
  final List<Widget>? actions;
  final VoidCallback? leadingIconOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
      child: AppBar(
        // Custom back arrow
        automaticallyImplyLeading: false,
        leading: showBackArrowIcon
            ? IconButton(
                onPressed: leadingIconOnPressed ?? (showBackArrowIcon ? () => Get.back() : null),
                icon: Icon(
                  // If leading icon is not given, check back arrow if visible then show your custom icon here.
                  leadingIcon ?? (showBackArrowIcon ? Icons.arrow_left : null),
                  color: THelperFunctions.isDarkMode(context) ? kDefaultIconLightColor : kDefaultIconDarkColor,
                ),
              )
            : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}


class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  /// If you want to add the background color to tabs you have to wrap them in Material widget.
  /// To do that we need [PreferredSized] Widget and that's why created custom class. [PreferredSizeWidget]  🔝↖️
  const TTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? TColors.black : TColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: Color.fromARGB(255, 253, 114, 1),
        labelColor: dark ? const Color.fromARGB(255, 180, 0, 0) : TColors.primary,
        unselectedLabelColor: TColors.darkGrey,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}



class TCircularContainer extends StatelessWidget {
  const TCircularContainer({
    super.key,
    this.child,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.padding = 0,
    this.backgroundColor = TColors.white,
  });

  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}



class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgesWidget(
      child: Container(
        color: Color.fromARGB(255, 255, 123, 0),
        padding: const EdgeInsets.only(bottom: 0),

        /// -- If [size.isFinite': is not true.in Stack] error occurred -> Read README.md file at [DESIGN ERRORS] # 1
        child: Stack(
          children: [
            /// -- Background Custom Shapes
            Positioned(
                top: -150, right: -250, child: TCircularContainer(backgroundColor: Color.fromARGB(255, 255, 0, 0).withOpacity(0.1))),
            Positioned(
                top: 100, right: -300, child: TCircularContainer(backgroundColor: Color.fromARGB(255, 255, 255, 255).withOpacity(0.1))),
            child,
          ],
        ),
      ),
    );
  }
}



class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer({
    super.key,
    this.child,
    this.width,
    this.height,
    this.margin,
    this.showBorder = false,
    this.padding = const EdgeInsets.all(TSizes.md),
    this.borderColor = TColors.borderPrimary,
    this.radius = TSizes.cardRadiusLg,
    this.backgroundColor = TColors.white,
  });

  final double? width;
  final double? height;
  final double radius;
  final EdgeInsetsGeometry padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color backgroundColor;
  final Color borderColor;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.overlayColor,
    this.backgroundColor,
    required this.image,
    this.fit = BoxFit.cover,
    this.padding = TSizes.sm,
  });

  final BoxFit? fit;
  final String image;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        // If image background color is null then switch it to light and dark mode color design.
        color: backgroundColor ?? (THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Image(
          fit: fit,
          image: AssetImage(image),
          color: overlayColor,
        ),
      ),
    );
  }
}


class TCurvedEdgesWidget extends StatelessWidget {
  const TCurvedEdgesWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TCustomCurvedEdges(),
      child: child,
    );
  }
}



class TCustomCurvedEdges extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    final firstCurve = Offset(0, size.height - 20);
    final lastCurve = Offset(30, size.height - 20);
    path.quadraticBezierTo(firstCurve.dx, firstCurve.dy, lastCurve.dx, lastCurve.dy);

    final secondFirstCurve = Offset(0, size.height-20);
    final secondLastCurve = Offset(size.width-30, size.height-20);
    path.quadraticBezierTo(secondFirstCurve.dx, secondFirstCurve.dy, secondLastCurve.dx, secondLastCurve.dy);

    final thirdFirstCurve = Offset(size.width, size.height-20);
    final thirdLastCurve = Offset(size.width, size.height);
    path.quadraticBezierTo(thirdFirstCurve.dx, thirdFirstCurve.dy, thirdLastCurve.dx, thirdLastCurve.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}


class TCircularIcon extends StatelessWidget {
  /// A custom Circular Icon widget with a background color.
  ///
  /// Properties are:
  /// Container [width], [height], & [backgroundColor].
  ///
  /// Icon's [size], [color] & [onPressed]
  const TCircularIcon({
    super.key,
    required this.icon,
    this.width,
    this.height,
    this.size = TSizes.lg,
    this.onPressed,
    this.color,
    this.backgroundColor,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor != null
            ? backgroundColor!
            : THelperFunctions.isDarkMode(context)
                ? TColors.black.withOpacity(0.9)
                : TColors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(onPressed: onPressed, icon: Icon(icon, color: color, size: size)),
    );
  }
}