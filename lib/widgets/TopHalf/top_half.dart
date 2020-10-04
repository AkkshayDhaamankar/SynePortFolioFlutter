import 'package:flutter/material.dart';
import 'package:syne_portfolio_app/models/syne.dart';

Widget topHalf() {
  return Container(
    width: double.infinity,
    height: 300,
    child: Stack(
      children: [
        _buildCoverImage(),
        _buildProfileImage(),
        _buildFollowButton()
      ],
    ),
  );
}

Widget _buildCoverImage() {
  return Container(
    height: 225,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/syneCover.jpg'),
        fit: BoxFit.cover,
      ),
    ),
  );
}

Widget _buildFollowButton() {
  return Positioned(
    right: 20,
    bottom: 15,
    child: Container(
      width: 140,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RotatedBox(
              quarterTurns: 1,
              child: Icon(
                Icons.wifi,
                color: Colors.white,
              )),
          Text(
            'Follow',
            style: TextStyle(color: Colors.white, fontSize: 20),
          )
        ],
      ),
    ),
  );
}

Widget _buildProfileImage() {
  return Positioned(
    left: 20.0,
    bottom: 10.0,
    child: Container(
      width: 140.0,
      height: 140.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/syneProfile.jpg'),
          fit: BoxFit.cover,
        ),
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 2.0,
        ),
      ),
    ),
  );
}

Widget aboveTabs([Syne syne]) {
  return Container(
    width: double.infinity,
    height: 220,
    child: Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            syne.title,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 20.0),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            syne.email,
            style: TextStyle(color: Colors.grey, fontSize: 15.0),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                color: Colors.grey,
              ),
              Text(
                syne.location,
                style: TextStyle(color: Colors.grey, fontSize: 15.0),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            syne.description,
            style: TextStyle(color: Colors.grey, fontSize: 15.0),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    syne.followers,
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Followers',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w300),
                  )
                ],
              ),
              SizedBox(
                width: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    syne.following,
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Following',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w300),
                  )
                ],
              )
            ],
          )
        ],
      ),
    ),
  );
}
