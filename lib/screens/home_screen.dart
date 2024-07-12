// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vixito_apper/models/post.dart';
import 'package:vixito_apper/providers/feed_provider.dart';
import 'package:vixito_apper/widgets/post_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<FeedProvider>(context, listen: false).fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SOCIALIFY"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Today\'s Posts'),
            (context.watch<FeedProvider>().isLoadingPost)
                ? CircularProgressIndicator()
                : SizedBox(
                    height: 300,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: context.read<FeedProvider>().posts.length,
                        itemBuilder: (context, index) {
                          Post post = context.read<FeedProvider>().posts[index];
                          return PostCard(
                            post: post,
                          );
                        }),
                  )
          ],
        ),
      ),
    );
  }
}
