import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currenFilters;

  FiltersScreen(this.currenFilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currenFilters['gluten'];
    _lactoseFree = widget.currenFilters['lactose'];
    _vegan = widget.currenFilters['vegan'];
    _vegetarian = widget.currenFilters['vegetarian'];
    super.initState();
  }

  Widget _buildSwicthListTile(
      {@required String title,
      @required String description,
      @required bool currentValue,
      @required Function updateValue}) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust your meal selection.',
                style: Theme.of(context).textTheme.titleSmall),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwicthListTile(
                    title: 'Gluten-free',
                    description: 'Only include gluten-free meals.',
                    currentValue: _glutenFree,
                    updateValue: (newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      });
                    }),
                _buildSwicthListTile(
                    title: 'Lactose-free',
                    description: 'Only include lactose-free meals.',
                    currentValue: _lactoseFree,
                    updateValue: (newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    }),
                _buildSwicthListTile(
                    title: 'Vegetarian',
                    description: 'Only include vegetarian meals.',
                    currentValue: _vegetarian,
                    updateValue: (newValue) {
                      setState(() {
                        _vegetarian = newValue;
                      });
                    }),
                _buildSwicthListTile(
                    title: 'Vegan',
                    description: 'Only include vegan meals.',
                    currentValue: _vegan,
                    updateValue: (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
