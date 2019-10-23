import 'package:flutter/material.dart';

class AddExpensePage extends StatefulWidget {
  @override
  _AddExpenseState createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpensePage> {
  @override
  Widget build(BuildContext context) {
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
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Item A'
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Item B'
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Item C'
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
            ],
          ),
          FloatingActionButton.extended(
            heroTag: 1,
            elevation: 0,
            label: const Icon(Icons.add),
            onPressed: () {
              
            },
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
}