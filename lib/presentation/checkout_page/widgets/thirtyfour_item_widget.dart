import 'package:flutter/material.dart';

class ThirtyfourItemWidget extends StatelessWidget {
  const ThirtyfourItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: 21.0, // Assuming these values are in logical pixels
        vertical: 7.0,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        "5 Kg",
        style: TextStyle(
          color: Colors.grey[500], // Using Colors.grey as an example
          fontSize: 11.0, // Assuming font size as 11 logical pixels
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.w700,
        ),
      ),
      selected: false,
      backgroundColor: Colors.white, // Using white as an example
      selectedColor: Colors.white, // Using white as an example
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.blueGrey[100]!, // Using Colors.blueGrey as an example
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(4.0),
      ),
      onSelected: (value) {
        // Callback when the chip is selected
      },
    );
  }
}
