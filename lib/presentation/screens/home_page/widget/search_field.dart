import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSearchText extends StatefulWidget {
 // final List<String> searchHistory;
 // final void Function(String) onSearch;
  //final void Function() onClear;
  final String? Function(String?)? validator;

  const CustomSearchText({
    Key? key,
   // required this.searchHistory,
    //required this.onSearch,
  //  required this.onClear,
    this.validator,
  }) : super(key: key);

  @override
  _CustomSearchTextState createState() => _CustomSearchTextState();
}

class _CustomSearchTextState extends State<CustomSearchText> {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<String> _filteredSearchHistory = [];
  bool _isSuggestionsVisible = false;

  @override
  void initState() {
    super.initState();
    // _filteredSearchHistory = widget.searchHistory;
    _focusNode.addListener(() {
      setState(() {
        _isSuggestionsVisible = _focusNode.hasFocus;
      });
    });
  }

  void _onSearchTextChanged(String text) {
    if (text.isEmpty) {
      setState(() {
      //  _filteredSearchHistory = widget.searchHistory;
      });
    } else {
      setState(() {
     //   _filteredSearchHistory = widget.searchHistory
       //     .where((history) => history.toLowerCase().contains(text.toLowerCase()))
     //       .toList();
      });
    }
    //widget.onSearch(text);
  }

  void _onClearButtonPressed() {
    _textController.clear();
    _focusNode.unfocus();
    setState(() {
     // _filteredSearchHistory = widget.searchHistory;
      _isSuggestionsVisible = false;
    });
  //  widget.onClear();
  }

  String? _validateText(String? value) {
    if (value == null || value.isEmpty) {
      return "Search term cannot be empty.";
    } else if (value.length < 3) {
      return "Search term must be at least 3 characters long.";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.grey[200],
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 4.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          TextFormField(
            controller: _textController,
            focusNode: _focusNode,
            decoration: InputDecoration(
              hintText: "البحث",
              hintStyle: GoogleFonts.almarai(
                  textStyle: TextStyle(
                    color: Colors.white,
                    letterSpacing: 0,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                  )),
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: _onSearchTextChanged,
            validator: widget.validator ?? _validateText,
          ),
          Visibility(
            visible: _textController.text.isNotEmpty,
            child: IconButton(
              icon: Icon(Icons.clear),
              onPressed: _onClearButtonPressed,
            ),
          ),
        ],
      ),
    );
  }
}
