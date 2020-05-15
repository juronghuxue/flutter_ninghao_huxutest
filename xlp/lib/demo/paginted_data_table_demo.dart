import 'package:flutter/material.dart';
import '../model/post.dart';

class PostDataSource extends DataTableSource{
  final List<Post> _posts = posts;
  int _selectedCount = 0;
  @override
  // TODO: implement rowCount
  int get rowCount => _posts.length;
  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;
  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => _selectedCount;
  @override
  DataRow getRow(int index) {
    final Post post = _posts[index];
    return DataRow.byIndex(
      index:index,
      cells:<DataCell>[
        DataCell(Text(post.title)),
        DataCell(Text(post.author)),
        DataCell(Image.network(post.imageUrl)),
      ]
    );
  }

  void _sort(getField(post),bool ascending){
    _posts.sort((a, b){
      if(!ascending){
        final c = a;
        a = b;
        b = c;
      }
      final aValue = getField(a);
      final bValue = getField(b);

      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();
  }
}
class PagintedDataTableDemo extends StatefulWidget {
  @override
  _PagintedDataTableDemoState createState() => _PagintedDataTableDemoState();
}

class _PagintedDataTableDemoState extends State<PagintedDataTableDemo> {
  int _sortColumnIndex;
  bool _sortAscending = true;
  final PostDataSource _postDataSource = PostDataSource();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('DataTableDemo'),
        elevation: 0.0,

      ),
      body:Container(
        padding:EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            PaginatedDataTable(
              header: Text('Posts'),
              rowsPerPage: 5,
              source: _postDataSource,
              sortColumnIndex: _sortColumnIndex,
              sortAscending: _sortAscending,
              columns: [
                DataColumn(
                  label: Container(
                    // width: 150.0,
                    child: Text('Title'),
                  ),
                  onSort: (int columnIndex,bool ascending){
                    _postDataSource._sort((post) => post.title.length,ascending);
                    setState(() {
                      _sortColumnIndex = columnIndex;
                      _sortAscending = ascending;
                      
                    });
                  }
                ),
                DataColumn(
                  label: Text('Author'),
                ),
                DataColumn(
                  label: Text('Image'),
                ),
              ],
              
            )
          ],
        ),
      )
    );
  }
}