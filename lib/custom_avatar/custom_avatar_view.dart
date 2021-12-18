import 'package:flutter/material.dart';
import 'package:itmo_meta/custom_avatar/custom_avatar_view_model.dart';
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
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          CustomAvatar(
            backgroundColor: provider.backgroundColors[provider.backgroundId],
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 32),
            child: CustomTextField(controller: nicknameController),
          ),
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
            child: TabsWithAvatarElements(),
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
    tabController = TabController(length: 3, vsync: this);
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
                      text: 'Лицо',
                    ),
                    Tab(
                      text: 'Волосы',
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
                BackgroundGridView(
                  onTap: provider.setBackgroundId,
                  colors: provider.backgroundColors,
                ),
                Text('Second'),
                Text('Third'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BackgroundGridView extends StatelessWidget {
  const BackgroundGridView({
    Key? key,
    required this.onTap,
    required this.colors,
  }) : super(key: key);
  final List<Color> colors;
  final Function(int value) onTap;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CustomAvatarViewModel>(context);
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
                    decoration: BoxDecoration(
                        // color: AppColors.primary,
                        color: colors[index],
                        borderRadius: BorderRadius.circular(20)),
                    // child: Image.asset(name),
                  ),
                  provider.backgroundId == index
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
