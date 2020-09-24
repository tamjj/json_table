import 'package:flutter/material.dart';

typedef OnPageChange = void Function(int pageNo);

class PaginationBox extends StatelessWidget {
  final int pageIndex;
  final int pagesCount;
  final VoidCallback onLeftButtonTap;
  final VoidCallback onRightButtonTap;
  final OnPageChange onPagesChanged;
  final pageController;

  PaginationBox({
    @required this.pageIndex,
    @required this.pagesCount,
    @required this.onLeftButtonTap,
    @required this.onRightButtonTap,
    @required this.pageController,
    @required this.onPagesChanged,
  }) {
    pageController.addListener(
        () => onPagesChanged(int.tryParse(pageController.text) ?? 0));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).dividerColor,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: <Widget>[
          Material(
            type: MaterialType.circle,
            color: Colors.transparent,
            child: IconButton(
              icon: Icon(Icons.arrow_left),
              onPressed: onLeftButtonTap,
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            /*child: Text(
              "Page ${pageIndex + 1} of $pagesCount",
              textAlign: TextAlign.center,
            ),*/
            child: Row(children: [
              Text(
                "Page ",
                textAlign: TextAlign.left,
              ),
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: pageController,
                ),
              ),
              Text(
                " of $pagesCount",
                textAlign: TextAlign.right,
              ),
            ]),
          ),
          Material(
            type: MaterialType.circle,
            color: Colors.transparent,
            child: IconButton(
              icon: Icon(Icons.arrow_right),
              onPressed: onRightButtonTap,
            ),
          ),
        ],
      ),
    );
  }
}
