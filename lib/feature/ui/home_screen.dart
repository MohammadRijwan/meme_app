import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:person_info/core/utils/provider.dart';

class HomeScreen extends StatefulWidget {
  final String? title;
  HomeScreen({this.title});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
        centerTitle: true,
      ),
      body: Consumer(
        builder: (context, watch, _) {
          final vm = watch(homeVmProvider);
          return vm.isLoading
              ? Center(
                  child: CircularProgressIndicator(
                  color: Colors.red,
                ))
              : ListView(
                  children: [
                    for (int i = 0; i < vm.memeList.length; i++)
                      MemeCard(
                        name: vm.memeList[i].name,
                        imageUrl: vm.memeList[i].url,
                      ),
                  ],
                );
        },
      ),
    );
  }
}

class MemeCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  const MemeCard({Key? key, required this.imageUrl, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 10.0,
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(imageUrl),
                ),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name:',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Text(
                    name,
                    style: TextStyle(fontSize: 18.0),
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
