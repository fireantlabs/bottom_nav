import 'package:bottom_nav/models/post.dart';
import 'package:flutter/material.dart';

class SearchTab extends StatefulWidget {
  SearchTab({Key key}) : super(key: key);

  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab>
    with AutomaticKeepAliveClientMixin<SearchTab> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Post>>(
      future: fetchPost(0, 10),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? PostList(posts: snapshot.data)
            : Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class PostList extends StatelessWidget {
  final List<Post> posts;

  const PostList({Key key, this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(posts.length);
    return ListView.builder(
      itemBuilder: (_, index) {
        return ListTile(
          key: PageStorageKey('${posts[index].id}'),
          title: Text(posts[index].title),
          subtitle: Text(posts[index].body),
        );
      },
      itemCount: posts.length,
    );
  }
}
