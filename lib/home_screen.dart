import 'package:flutter/material.dart';

import 'model/person_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  List<Person2Model> personList  = [
     Person2Model(name: null),
     Person2Model(name: 'Json'),
     Person2Model(name: 'Ahmed'),
  ];


  List<PersonModel> personList2  = [
    PersonModel(name: null),
    PersonModel(name: 'Json'),
    PersonModel(name: 'Ahmed'),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var data = [
      {
        "name" : "ARSH DEEP"
      },
      {
        "name" : null
      },
      {
        "name" : "Ahmed"
      }
    ];

    for(int i = 0; i < data.length; i++){
      personList2.add(PersonModel.fromJson(data[i]));
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: personList.length,
                itemBuilder: (context, index){
                  return ListTile(
                    title: Text(personList[index].name ?? ''),
                  );
                }),
          ),

          Expanded(
            child: ListView.builder(
                itemCount: personList2.length,
                itemBuilder: (context, index){
                  return ListTile(
                    title: Text(personList2[index].name ?? ''),
                  );
                }),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){

          Person2Model personModel = Person2Model(name: "Ahmed");
          Person2Model personModel1 = Person2Model(name: "Ahmed");

          print(personModel.name);
          print(personModel1.name);

          // has code
          print(personModel.hashCode);
          print(personModel1.hashCode);

          print(personModel == personModel1);

          Map<String, dynamic> data = {
            "name": "Ahmed",
          };

          Person2Model personModel2 = Person2Model.fromJson(data);
          print(personModel2.name);

         personModel2 = personModel2.copyWith(name: 'arsh');
          print('new value' + personModel2.name.toString());


        // other model
          PersonModel model = PersonModel.fromJson(data);
          print('value' + model.name.toString());
          model = model.copyWith(name: 'Ahmed');
          print('2nd new value' + model.name.toString());

        },
         // child: ,
      ),

    );
  }
}


class Person2Model {
  String? name;
  Person2Model({this.name,});

  @override
  bool operator ==(Object other) =>
    identical(this, other) ||
    other is Person2Model &&
      runtimeType == other.runtimeType &&
      name == other.name;

  @override
  int get hashCode => name.hashCode;

  // This is a named constructor in Dart, called fromJson, used to create a PersonModel object from a JSON map.
  // यह डार्ट में एक नामित कंस्ट्रक्टर है, जिसे fromJson कहा जाता है, जिसका उपयोग JSON मैप से PersonModel ऑब्जेक्ट बनाने के लिए किया जाता है।
  // json map -> object
  Person2Model.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  //This method is a custom toJson() function, which converts a Dart object into a JSON map — commonly used when sending data to APIs or saving to local storage.
  // यह विधि एक कस्टम toJson() फ़ंक्शन है, जो डार्ट object को JSON मैप में परिवर्तित करता है - जिसका उपयोग आमतौर पर API को डेटा भेजते समय या स्थानीय स्टोरेज में सहेजते समय किया जाता है।
  // object -> json map
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }

  // the copyWith method is used to create a new object by copying an existing one, with some updated fields.
  // copyWith विधि का उपयोग किसी मौजूदा object को कॉपी करके, कुछ update फ़ील्ड के साथ, एक नया object बनाने के लिए किया जाता है।
  Person2Model copyWith({
     String? name,
  }){
    return Person2Model(
      name: name ?? name,
    );}


// That toString() method is a custom string representation of the PersonModel class. It's used when you print the object or log it for debugging.
// वह toString() विधि PersonModel क्लास का एक कस्टम स्ट्रिंग Representation है। इसका उपयोग तब किया जाता है जब आप object को प्रिंट करते हैं या उसे डीबगिंग के लिए लॉग करते हैं।
   @override
  String toString() {
    return 'PersonModel(name: $name)';
  }

}