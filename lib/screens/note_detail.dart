import "package:flutter/material.dart";

class NoteDetail extends StatefulWidget {
  var detalist = [];
  var unitlist=[];
  var timetablelist=[];
  var resultlist=[];
  NoteDetail({Key key, @required this.detalist,this.resultlist,this.timetablelist,this.unitlist}) : super(key: key);

  
  @override
  State<StatefulWidget> createState() {
    return NoteDetailState();
  }
}

class NoteDetailState extends State<NoteDetail> {
  static var _priorities = ['high', 'low'];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;

    return Scaffold(
        appBar: AppBar(
          title: Text("Edit Text"),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: Column(children: [
            new ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: widget.detalist.length,
                itemBuilder: (BuildContext ctxt, int Indx) {
                  return new Text(widget.detalist[Indx]+'=='+Indx.toString());
                }),
                new ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: widget.resultlist.length,
                itemBuilder: (BuildContext ctxt, int Indx) {
                  return new Text(widget.resultlist[Indx]);
                }),
            mybtn()
          ]),
        ));
  }

  Widget mybtn() {
    return 
         RaisedButton(
            child: Text('back'), color: Colors.blue, onPressed: () {
              Navigator.pop(context);
            });
  }
}
