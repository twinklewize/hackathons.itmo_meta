import 'package:flutter/material.dart';
import 'package:itmo_meta/custom_avatar/custom_avatar_view_model.dart';
import 'package:itmo_meta/ui_kit/avatar/user_avatar_assets.dart';
import 'package:itmo_meta/ui_kit/constants/app_colors.dart';
import 'package:itmo_meta/ui_kit/widgets/custom_avatar.dart';
import 'package:itmo_meta/ui_kit/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class CustomAvatarView extends StatelessWidget {
  CustomAvatarView({Key? key}) : super(key: key);
  final nicknameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CustomAvatarViewModel>(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Создать аватар',
          style: TextStyle(color: AppColors.textColor),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.textColor,
          ),
          onPressed: () {
            // Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.check_rounded,
              color: AppColors.textColor,
            ),
            onPressed: () {
              provider.setNickname(nicknameController.text);
              provider.createAvatar();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => CustomAvatarView(),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),

          // Аватар
          CustomAvatar(
            backgroundColorId: provider.backgroundColorId,
            avatarHeight: 200,
            hairstyleId: provider.hairstyleId,
            bodyId: provider.bodyId,
            browsId: provider.browsId,
            eyesId: provider.eyesId,
            mouthId: provider.mouthId,
          ),

          // Текстовое поле
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 32),
            child: CustomTextField(controller: nicknameController),
          ),

          // Изменение вида аватара
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height -
                (308 +
                    AppBar().preferredSize.height +
                    MediaQuery.of(context).padding.top),
            decoration: const BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14),
                topRight: Radius.circular(14),
              ),
            ),
            child: const TabsWithAvatarElements(),
          ),
        ],
      ),
    );
  }
}

class TabsWithAvatarElements extends StatefulWidget {
  const TabsWithAvatarElements({Key? key}) : super(key: key);

  @override
  _TabsWithAvatarElementsState createState() => _TabsWithAvatarElementsState();
}

class _TabsWithAvatarElementsState extends State<TabsWithAvatarElements>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 6, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CustomAvatarViewModel>(context);
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TabBar(
                  isScrollable: true,
                  unselectedLabelColor: AppColors.textColor.withOpacity(0.5),
                  indicatorColor: AppColors.primary,
                  indicatorWeight: 4,
                  controller: tabController,
                  tabs: const [
                    Tab(
                      text: 'Цвет фона',
                    ),
                    Tab(
                      text: 'Тело',
                    ),
                    Tab(
                      text: 'Волосы',
                    ),
                    Tab(
                      text: 'Глаза',
                    ),
                    Tab(
                      text: 'Брови',
                    ),
                    Tab(
                      text: 'Рот',
                    ),
                  ],
                ),
                Divider(height: 1, color: AppColors.textColor.withOpacity(0.2)),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                ColorGridView(
                  onTap: provider.setBackgroundId,
                  colors: UserAvatarAssets.backgroundColors,
                  id: provider.backgroundColorId,
                ),
                AssetGridView(
                  onTap: provider.setBodyId,
                  assets: UserAvatarAssets.bodies,
                  id: provider.bodyId,
                ),
                AssetGridView(
                  onTap: provider.setHairstyleId,
                  assets: UserAvatarAssets.hairstyles,
                  id: provider.hairstyleId,
                ),
                AssetGridView(
                  onTap: provider.setEyesId,
                  assets: UserAvatarAssets.eyes,
                  id: provider.eyesId,
                ),
                AssetGridView(
                  onTap: provider.setBrowsId,
                  assets: UserAvatarAssets.brows,
                  id: provider.browsId,
                ),
                AssetGridView(
                  onTap: provider.setMouthId,
                  assets: UserAvatarAssets.mouths,
                  id: provider.mouthId,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ColorGridView extends StatelessWidget {
  const ColorGridView({
    Key? key,
    required this.onTap,
    required this.colors,
    required this.id,
  }) : super(key: key);
  final List<Color> colors;
  final Function(int value) onTap;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 120,
          crossAxisSpacing: 16,
          childAspectRatio: 1,
          mainAxisSpacing: 16,
        ),
        itemCount: colors.length,
        itemBuilder: (BuildContext ctx, index) {
          return GestureDetector(
            onTap: () => onTap(index),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: colors[index],
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  id == index
                      ? Container(
                          width: 120,
                          height: 120,
                          color: Colors.black12,
                          child: const Center(
                            child: Icon(
                              Icons.check_rounded,
                              color: Colors.white,
                              size: 32,
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class AssetGridView extends StatelessWidget {
  const AssetGridView({
    Key? key,
    required this.onTap,
    required this.assets,
    required this.id,
  }) : super(key: key);
  final List<String> assets;
  final Function(int value) onTap;
  final int id;

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<CustomAvatarViewModel>(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 120,
          crossAxisSpacing: 16,
          childAspectRatio: 1,
          mainAxisSpacing: 16,
        ),
        itemCount: assets.length,
        itemBuilder: (BuildContext ctx, index) {
          return GestureDetector(
            onTap: () => onTap(index),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(20)),
                    child: Image.asset(
                      assets[index],
                      fit: BoxFit.contain,
                    ),
                  ),
                  id == index
                      ? Container(
                          width: 120,
                          height: 120,
                          color: Colors.black12,
                          child: const Center(
                            child: Icon(
                              Icons.check_rounded,
                              color: Colors.white,
                              size: 32,
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
