import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/busineslogic/cubit.dart';
import 'package:newsapp/busineslogic/state.dart';
import 'package:newsapp/models/newsmodel.dart';
class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (contxet, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        if (state is getLoadingState)
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        else if (state is getErrorState)
          return Scaffold(
            body: Center(
              child: Text(state.error ?? 'Sorry, somethimg went wrong'),
            ),
          );
        else {
          if (cubit.articles.isNotEmpty)
            return Scaffold(
              appBar: AppBar(
                title: Text("News app",style: TextStyle(color: Colors.black),),
                elevation: 0,
                backgroundColor: Colors.white,
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return buildContainer(
                                cubit.articles[index], context);
                          },
                          itemCount: cubit.articles.length),
                    )
                  ],
                ),
              ),
            );
          else
            return Scaffold(
              body: Center(
                child: Text('Sorry, there is no data'),
              ),
            );
        }
      },
    );
  }

  Widget buildContainer(ArticleModel articleModel, context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 200,
        child: Card(
          elevation: 10,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                articleModel.urlToImage != null
                    ? ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                      child: Image(
                  image: NetworkImage("${articleModel.urlToImage}"),
                  fit: BoxFit.cover,
                  width: 150,
                  height: 200,
                ),
                    )
                    : Image(
                  image: NetworkImage(
                      "https://media.istockphoto.com/id/1216251206/vector/no-image-available-icon.jpg?s=170667a&w=0&k=20&c=N-XIIeLlhUpm2ZO2uGls-pcVsZ2FTwTxZepwZe4DuE4="),
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    "${articleModel.description}",
                    style: TextStyle(fontSize: 14),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}