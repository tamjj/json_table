import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
              Flexible(
                flex: 3,
                child: Text(
                  "Page ",
                  textAlign: TextAlign.left,
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Expanded(
                  flex: 1,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,
                    controller: pageController,
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Text(
                  " of $pagesCount",
                  textAlign: TextAlign.right,
                ),
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
