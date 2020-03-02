import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_travel_ui_starter/models/activity_model.dart';
import 'package:flutter_travel_ui_starter/models/destination_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DestinationScreen extends StatefulWidget {
  final Destination destino;

  const DestinationScreen({Key key, this.destino}) : super(key: key);

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 2.0),
                        blurRadius: 6.0,
                        color: Colors.black26)
                  ]),
              child: Hero(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image(
                    image: AssetImage(widget.destino.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                tag: widget.destino.imageUrl,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    color: Colors.black,
                    iconSize: 30,
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Row(
                    children: <Widget>[
                      IconButton(
                        color: Colors.black,
                        iconSize: 30,
                        icon: Icon(Icons.search),
                        onPressed: () {},
                      ),
                      IconButton(
                        color: Colors.black,
                        iconSize: 30,
                        icon: Icon(Icons.sort),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              left: 20.0,
              bottom: 20.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.destino.city,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.locationArrow,
                        size: 10,
                        color: Colors.white70,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.destino.country,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white70,
                            letterSpacing: 1.2),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              right: 20.0,
              bottom: 20.0,
              child: Icon(
                Icons.location_on,
                color: Colors.white70,
                size: 25,
              ),
            )
          ],
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(top: 10, bottom: 15),
              itemCount: widget.destino.activities.length,
              itemBuilder: (ctx, index) {
                Activity actv = widget.destino.activities[index];
                return ActivityCard(activity: actv);
              }),
        )
      ],
    ));
  }
}

class ActivityCard extends StatelessWidget {
  final Activity activity;

  const ActivityCard({Key key, this.activity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(40, 5, 20, 5),
          height: 170,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(100, 20, 20, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 120,
                      child: Text(
                        activity.name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          "R\$ ${activity.price}",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "per pax",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    )
                  ],
                ),
                Text(
                  activity.type,
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 5,
                ),
                _buildTime(context),
                SizedBox(
                  height: 5,
                ),
                _buildRating(context, activity.rating),
              ],
            ),
          ),
        ),
        Positioned(
          left: 20,
          top: 15,
          bottom: 15,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: Image(
              image: AssetImage(activity.imageUrl),
              width: 110,
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    );
  }

  _buildTime(context) {
    return Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(5),
          width: 70,
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: Text(activity.startTimes[0]),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          padding: EdgeInsets.all(5),
          width: 70,
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: Text(activity.startTimes[1]),
        )
      ],
    );
  }

  Text _buildRating(BuildContext context, int rating) {
    String stars = '';

    for (int i = 0; i < rating; i++) {
      stars += '🌟';
    }
    stars.trim();
    return Text(stars);
  }
}
