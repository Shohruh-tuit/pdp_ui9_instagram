import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pdp_ui9_instagram_homework/models/post_model.dart';
import 'package:pdp_ui9_instagram_homework/models/story_model.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<Story> _stories = [
    Story("assets/images/user_1.jpeg", "Jazmin"),
    Story("assets/images/user_2.jpeg", "Sylvester"),
    Story("assets/images/user_3.jpeg", "Lavina"),
    Story("assets/images/user_1.jpeg", "Jazmin"),
    Story("assets/images/user_2.jpeg", "Sylvester"),
    Story("assets/images/user_3.jpeg", "Lavina"),
    Story("assets/images/user_1.jpeg", "Jazmin"),
    Story("assets/images/user_2.jpeg", "Sylvester"),
  ];

  List<Post> _posts = [
    Post(
        userName: "Briane",
        userImage: "assets/images/user_1.jpeg",
        postImage: "assets/images/feed_1.jpeg",
        caption:
            "I know how it build may be my location is not correct but it's true!"),
    Post(
        userName: "Henri",
        userImage: "assets/images/user_2.jpeg",
        postImage: "assets/images/feed_2.jpeg",
        caption:
            "I know how it build may be my location is not correct but it's true!"),
    Post(
        userName: "Briane",
        userImage: "assets/images/user_3.jpeg",
        postImage: "assets/images/feed_3.jpeg",
        caption:
            "I know how it build may be my location is not correct but it's true!"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Divider(),

              // #stories
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Stories",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "Watch All",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),

              // #storList
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 110,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: _stories.map((story) {
                    return _itemofStory(story);
                  }).toList(),
                ),
              ),

              // #postList
              Container(
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _posts.length,
                  itemBuilder: (ctx, i) {
                    return itemOfPost(_posts[i]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemofStory(Story story) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(70),
              border: Border.all(
                width: 3,
                color: Color(0xFF8e44ad),
              )),
          child: Container(
            padding: EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image(
                image: AssetImage(story.image),
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          story.name,
          style: TextStyle(color: Colors.grey[500]),
        ),
      ],
    );
  }

  Widget itemOfPost(Post post) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          // #header post
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image(
                        image: AssetImage(post.userImage),
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      post.userName,
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(SimpleLineIcons.options),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          // #images
          FadeInImage(
            width: MediaQuery.of(context).size.width,
            image: AssetImage(post.postImage),
            placeholder: AssetImage("assets/images/placeholder.png"),
          ),

          // #Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      FontAwesome.heart_o,
                      color: Colors.grey[500],
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      FontAwesome.comment_o,
                      color: Colors.grey[500],
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      FontAwesome.send_o,
                      color: Colors.grey[500],
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              IconButton(
                icon: Icon(
                  FontAwesome.bookmark_o,
                  color: Colors.grey[500],
                ),
                onPressed: () {},
              ),
            ],
          ),

          // #tags
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 14),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Liked By ",
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                  TextSpan(
                    text: "Yessenia ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[500],
                    ),
                  ),
                  TextSpan(
                    text: "Sigmand ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[500],
                    ),
                  ),
                  TextSpan(
                    text: "Dayana ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[500],
                    ),
                  ),
                  TextSpan(
                    text: "and ",
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                  TextSpan(
                    text: "1263 others",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // #caption
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 5,
            ),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: post.userName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[500],
                    ),
                  ),
                  TextSpan(
                    text: "${post.caption}",
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                ],
              ),
            ),
          ),

          // #postdate
          Container(
            margin: EdgeInsets.symmetric(horizontal: 14),
            alignment: Alignment.topLeft,
            child: Text(
              "February 2020",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
