import 'package:flutter/material.dart';
import 'package:handmade/view/home/home.dart';
import 'package:handmade/view/profile/profile.dart';
class CustomSearch extends SearchDelegate{
  List username=[
    "reem",
    "nagham",
    "vera",
    "sandra",
    "alaa",
  ];
  List? filerList ;
  @override
  List<Widget>? buildActions(BuildContext context) {
   return [
     IconButton(onPressed: (){
       query=" ";
       },
         icon:Icon(Icons.close))
   ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return
      IconButton(onPressed: (){
        close(context, null);
      }, icon:Icon(Icons.arrow_back_sharp));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(child: Text("Selected User: $query"));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(query==" ") {
      return ListView.builder(
          itemCount: username.length,
          itemBuilder: (context, i) {
            return InkWell(
            onTap: (){},
            child:
              Padding(padding: const EdgeInsets.all(14),
                child: Text("${username[i]}", style: TextStyle(fontSize: 17),)
            ),
            );
          }
      );
    }else{
      filerList = username.where((element) => element.startsWith(query.toLowerCase())).toList();
      return ListView.builder(
          itemCount: filerList!.length??0,
          itemBuilder: (context, i) {
            return InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Profile(username:query), // استبدل UserProfilePage باسم الصفحة التي تريد التوجه إليها
                    ),
                  );
                },
            child:
              Padding(padding: const EdgeInsets.all(14),
                child: Text("${filerList![i]}", style: TextStyle(fontSize: 17),)
            ),
            );
          }
      );
    }
  }
}
