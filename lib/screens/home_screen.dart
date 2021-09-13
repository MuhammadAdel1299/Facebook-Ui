import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:untitled/constants/my_colors.dart';
import 'package:untitled/data/local_api.dart';
import 'package:untitled/model/post_model.dart';
import 'package:untitled/widgets/app_bar_buuton.dart';
import 'package:untitled/widgets/create_post.dart';
import 'package:untitled/widgets/friends_list.dart';
import 'package:untitled/widgets/posts_container.dart';
import 'package:untitled/widgets/responsive.dart';
import 'package:untitled/widgets/rooms.dart';
import 'package:untitled/widgets/side_panel.dart';
import 'package:untitled/widgets/strories.dart';
import 'package:untitled/widgets/tap_bar.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TrackingScrollController scrollController = TrackingScrollController();
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _HomeScreenMobile(scrollController : scrollController),
          desktop: _HomeScreenDesktop(scrollController : scrollController),
        ),
      ),
    );
  }
}

class _HomeScreenMobile extends StatelessWidget {
  final TrackingScrollController scrollController ;

  const _HomeScreenMobile({required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        DefaultTabController(
          length: 5,
          child: SliverAppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            title: Text(
              'facebook',
              style: TextStyle(
                color: MyColors.facebookColor,
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.5,
              ),
            ),
            floating: true,
            actions: [
              AppBarButton(
                icon: Icons.search,
                iconSize: 28.0,
                onPressed: () {},
              ),
              AppBarButton(
                icon: Mdi.facebookMessenger,
                iconSize: 28.0,
                onPressed: () {},
              ),
            ],
            bottom: TabBar(
              tabs: [
                TapBar(
                  icon: Icons.home,
                  color: MyColors.facebookColor,
                ),
                TapBar(
                  icon: Icons.ondemand_video,
                  color: Colors.black,
                ),
                TapBar(
                  icon: Icons.shop,
                  color: Colors.black,
                ),
                TapBar(
                  icon: Mdi.bellOutline,
                  color: Colors.black,
                ),
                TapBar(
                  icon: Icons.menu,
                  color: Colors.black,
                ),
              ],
            ),
            elevation: 20.0,
          ),
        ),
        SliverToBoxAdapter(
          child: CreatePost(userModel: currentUser),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            child: Rooms(
              onlineUsers: onlineUsers,
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            child: Stories(
              currentUser: currentUser,
              stories: stories,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              final PostsModel post = posts[index];
              return PostsContainer(post: post);
            },
            childCount: posts.length,
          ),
        ),
      ],
    );
  }
}

class _HomeScreenDesktop extends StatelessWidget {
  final TrackingScrollController scrollController ;

  const _HomeScreenDesktop({required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: FriendsList(users : onlineUsers),
            ),
          ),
        ),
        Container(
          width: 600,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                sliver: SliverToBoxAdapter(
                  child: Stories(
                    currentUser: currentUser,
                    stories: stories,
                  ),
                ),
              ),
              DefaultTabController(
                length: 5,
                child: SliverAppBar(
                  brightness: Brightness.light,
                  backgroundColor: Colors.white,
                  title: Text(
                    'facebook',
                    style: TextStyle(
                      color: MyColors.facebookColor,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.5,
                    ),
                  ),
                  floating: true,
                  actions: [
                    AppBarButton(
                      icon: Icons.search,
                      iconSize: 28.0,
                      onPressed: () {},
                    ),
                    AppBarButton(
                      icon: Mdi.facebookMessenger,
                      iconSize: 28.0,
                      onPressed: () {},
                    ),
                  ],
                  elevation: 20.0,
                ),
              ),
              SliverToBoxAdapter(
                child: CreatePost(userModel: currentUser),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                sliver: SliverToBoxAdapter(
                  child: Rooms(
                    onlineUsers: onlineUsers,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    final PostsModel post = posts[index];
                    return PostsContainer(post: post);
                  },
                  childCount: posts.length,
                ),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: SidePanel(currentUser : currentUser),
            ),
          ),
        ),
      ],
    );
  }
}
