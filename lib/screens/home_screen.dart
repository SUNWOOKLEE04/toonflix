import 'package:flutter/material.dart';
import 'package:webflix/models/webtoon_model.dart';
import 'package:webflix/services/api_service.dart';
import 'package:webflix/widgets/webtoon_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          elevation: 2,
          backgroundColor: Colors.white,
          foregroundColor: Colors.green,
          title: const Text(
            '오늘의 웹툰',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: FutureBuilder(
          future: webtoons,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Expanded(child: makeList(snapshot)),
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index];
        return Webtoon(
          title: webtoon.title,
          thumb: webtoon.thumb,
          id: webtoon.id,
        );
      },
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      separatorBuilder: (context, index) {
        return const SizedBox(
          width: 40,
        );
      },
    );
  }
}
