// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';

// import '../../../domain/core/constants/asset_constants.dart';
// import '../../../domain/core/constants/string_constants.dart';

// class SearchField extends StatefulWidget {
//   final Function(String)? onChanged;
//   final bool hasDebounce;

//   const SearchField({Key? key, this.onChanged, this.hasDebounce = true})
//       : super(key: key);

//   @override
//   State<SearchField> createState() => _SearchFieldState();
// }

// class _SearchFieldState extends State<SearchField> {
//   Timer? _debounce;

//   _onSearchChanged(String query) {
//     if (_debounce?.isActive ?? false) _debounce?.cancel();
//     _debounce = Timer(const Duration(milliseconds: 500), () {
//       widget.onChanged!(query);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       textAlignVertical: TextAlignVertical.bottom,
//       onChanged: widget.onChanged != null
//           ? widget.hasDebounce
//               ? _onSearchChanged
//               : widget.onChanged
//           : null,
//       style: TextStyle(
//         color: Theme.of(context).colorScheme.primaryContainer,
//         fontSize: 12.sp,
//         fontWeight: FontWeight.w300,
//       ),
//       decoration: InputDecoration(
//         border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(25.0),
//             borderSide: BorderSide.none),
//         filled: true,
//         hintStyle: TextStyle(
//           color: Theme.of(context).colorScheme.primaryContainer.withAlpha(150),
//           fontSize: 12.sp,
//           fontWeight: FontWeight.w300,
//         ),
//         suffixIcon: Image.asset(
//           AssetConstants.searchIcon,
//         ),
//         hintText: ShopConstants.searchHintText,
//         fillColor: Theme.of(context).colorScheme.tertiary,
//       ),
//     );
//   }
// }
