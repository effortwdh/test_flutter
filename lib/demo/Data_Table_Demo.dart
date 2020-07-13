import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:ninghao_flutter/model/post.dart';

class DataTableDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _DataTableDemoState();
  }
}

class PostDataSource  extends DataTableSource{
  final List<Post> _posts = posts;
  int _selectedCount = 0;

  @override
  int get rowCount =>_posts.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  @override
  DataRow getRow(int index) {
    final Post post = _posts[index];
    return DataRow.byIndex(index: index,cells: <DataCell>[
      DataCell(Text(post.title)),
      DataCell(Text(post.author)),
    ]);
  }

}

class _DataTableDemoState extends State<DataTableDemo>{
  int _sortColumnIndex;
  bool _sortAscending = true;
  final PostDataSource _postsDataSource = PostDataSource();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataTableDemo'),

      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            DataTable(
              sortColumnIndex: _sortColumnIndex,
              sortAscending: _sortAscending,
              columns: [
                DataColumn(
                  label: Text('Title'),
                  onSort: (int index,bool asceding){
                    setState(() {
                      _sortColumnIndex = index;
                      _sortAscending = asceding;
                      posts.sort((a,b){
                        if(!asceding)
                          {
                            final c = a;
                            a = b;
                            b = c;

                          }
                        return a.title.length.compareTo(b.title.length);
                      });
                    });
                  },
                ),
                DataColumn(
                  label: Text('Author'),
                ),
              ],
              rows:
                posts.map((post){
                  return DataRow(
                    selected: post.selected,
                    onSelectChanged: (bool value){
                      setState(() {
                          if(post.selected != value){
                            post.selected = value;
                          }
                      });
                    },
                    cells: [
                      DataCell(
                        Text(post.title),
                      ),
                      DataCell(
                        Text(post.author),
                      ),
                    ]
                  );
                }).toList()
//              [
//                DataRow(
//                  cells: [
//                    DataCell(Text('HEll')),
//                    DataCell(Text('HEll')),
//                    DataCell(Text('HEll')),
//                  ],
//                ),
//                DataRow(
//                  cells: [
//                    DataCell(Text('HEll')),
//                    DataCell(Text('HEll')),
//                    DataCell(Text('HEll')),
//                  ],
//                ),
//                DataRow(
//                  cells: [
//                    DataCell(Text('HEll')),
//                    DataCell(Text('HEll')),
//                    DataCell(Text('HEll')),
//                  ],
//                )
//              ],

            ),
            PaginatedDataTable(
              //修改成为多少页
              rowsPerPage: 5,
              header: Text('Posts'),
                source: _postsDataSource,
                sortColumnIndex: _sortColumnIndex,
                sortAscending: _sortAscending,
                columns: [
                  DataColumn(
                    label: Text('Title'),
                    onSort: (int index,bool asceding){
                      setState(() {
                        _sortColumnIndex = index;
                        _sortAscending = asceding;
                        posts.sort((a,b){
                          if(!asceding)
                          {
                            final c = a;
                            a = b;
                            b = c;

                          }
                          return a.title.length.compareTo(b.title.length);
                        });
                      });
                    },
                  ),
                  DataColumn(
                    label: Text('Author'),
                  ),
                ],


            )
          ],
        ),


      ),
    );
  }
}