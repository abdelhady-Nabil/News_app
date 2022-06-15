import 'package:flutter/material.dart';

Widget buildItem(article,context){
  return  Container(
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(20),
                image:DecorationImage(
                    image: NetworkImage('${article['urlToImage']}'),
                    fit: BoxFit.cover

                )
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              height: 120,
              child: Column(
                children: [
                  Expanded(child: Text(
                    '${article['title']}',
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1,
                  )
                  ),
                  Text('${article['publishedAt']}',style: TextStyle(color: Colors.grey),)
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}