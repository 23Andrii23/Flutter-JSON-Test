import 'package:flutter/material.dart';

class TabBarMaterialWidget extends StatefulWidget {
  final int index;
  final ValueChanged<int> onChangeTab;

  const TabBarMaterialWidget({ 
    @required this.index, 
    @required this.onChangeTab,
    Key key
  }) : super(key: key);
  
  @override
  _TabBarMaterialWidgetState createState() => _TabBarMaterialWidgetState();
}

class _TabBarMaterialWidgetState extends State<TabBarMaterialWidget> {
  @override
  Widget build(BuildContext context) {
    final placeholder = Opacity(opacity: 0, child: IconButton(icon: Icon(Icons.no_cell), onPressed: null),);
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildTabItem(
              index: 0,
              icon: Icon(Icons.dashboard_outlined)
          ),
          buildTabItem(
              index: 1,
              icon: Icon(Icons.assignment_ind_outlined)
          ),
          placeholder,
          buildTabItem(
              index: 2,
              icon: Icon(Icons.search)
          ),
          buildTabItem(
              index: 3,
              icon: Icon(Icons.favorite_border)
          ),
        ],
      ),
    );
  }

  Widget buildTabItem({
    @required int index,
    @required Icon icon,
  }) {
    final isSelected = index == widget.index;
    
    return IconTheme(
      data: IconThemeData(
        color: isSelected ? Colors.blue : Colors.grey,
      ),
        child: IconButton(icon: icon, onPressed: () => widget.onChangeTab(index),)
    );
  }
}
