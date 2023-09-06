import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/busineslogic/cubit.dart';
import 'package:newsapp/busineslogic/state.dart';
import 'package:newsapp/models/newsmodel.dart';
import 'package:newsapp/view/Details.dart';

class Characterss extends StatelessWidget {
  Characterss({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        if(state is getLoadingState)
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        else if(state is getErrorState)
          return Scaffold(
            body: Center(
              child: Text(state.error??'Sorry, somethimg went wrong'),
            ),
          );
        else {
          if(cubit.articles.isNotEmpty)
            return  Scaffold(
              backgroundColor: Colors.blueGrey,
              appBar: AppBar(
                title: cubit.check
                    ? Expanded(
                  child: TextFormField(
                    controller: cubit.searchcontroller,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: "Find a character",
                        prefixIcon: IconButton(onPressed: (){
                          Navigator.pop(context);
                        },color: Colors.white,icon: Icon(Icons.arrow_back),),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.close,color: Colors.white,),
                          onPressed: () {
                            cubit.cleartextformfield();
                          },
                        )),
                  ),
                )
                    : Text(
                  "Character",
                ),
                backgroundColor: Colors.blueGrey.shade400,
                actions: [
                  IconButton(
                      onPressed: () {
                        cubit.swap();
                      },
                      icon: Icon(Icons.search))
                ],
              ),
              body: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          childAspectRatio: 3 / 4,
                          crossAxisSpacing: 1,
                          mainAxisSpacing: 1,
                          maxCrossAxisExtent: 200),
                      itemBuilder: (context, index) {
                        return buildStack(cubit.articles[index], context);
                      },
                      itemCount: cubit.articles.length,
                    ),
                  )
                ],
              ),
            );
          else return Scaffold(
            body: Center(
              child: Text('Sorry, there is no data'),
            ),
          );
        }


      },
    );
  }

  Widget buildStack(ArticleModel articleModel, context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsCharacter(
                      articleModel: articleModel,
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10,left: 5,right: 5),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white, width: 2),
                  image: DecorationImage(
                      image: NetworkImage("${articleModel.urlToImage}"),
                      fit: BoxFit.cover)),
            ),
            Container(
              width: double.infinity,
              height: 50,
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "${articleModel.author}",
                  style: TextStyle(color: Colors.white,fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
