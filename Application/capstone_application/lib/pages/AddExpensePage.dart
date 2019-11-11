import 'package:flutter/material.dart';

class AddExpensePage extends StatefulWidget {
  @override
  _AddExpenseState createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpensePage> {
  int _count = 1;
  @override
  Widget build(BuildContext context) {
    List<Widget> _itemRows = new List.generate(_count,(int i) => new ItemRow());
    return Scaffold(
      appBar: AppBar(
        leading: FloatingActionButton(
          heroTag: 0,
          elevation: 0,
          child: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Expense'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Name'
            ),
          ),
          Text('Items'),
          Column(
            children: _itemRows,
          ),
          FloatingActionButton.extended(
            heroTag: 1,
            elevation: 0,
            label: const Icon(Icons.add),
            onPressed: _addNewItemRow,
          ),
          Expanded(
            child: Text('Amount:\t\$00.00', textAlign: TextAlign.center,),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: FloatingActionButton.extended(
            heroTag: 2,
            elevation: 0,
            label: Text('Add'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
    );
  }
  void _addNewItemRow() {
    setState(() {
      _count = _count + 1;
    });
  }
}

class ItemRow extends StatefulWidget {
  @override
  _ItemRowState createState() => _ItemRowState();
}

class _ItemRowState extends State<ItemRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Item'
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Flexible(
            child: TextField(
              decoration: InputDecoration(
                hintText: '\$00.00'
              ),
            ),
          ),
        ],
      ),
    );
  }
}