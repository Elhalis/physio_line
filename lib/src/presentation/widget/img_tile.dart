import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ImageTile extends StatelessWidget {
  const ImageTile({
    super.key,
    required this.imgPath,
    required this.title,
    required this.path,
  });

  final String imgPath;
  final String title;
  final String path;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(path),
      hoverColor: Colors.grey[100],
      child: Container(
        padding: EdgeInsetsDirectional.symmetric(vertical: 16.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Color(0xFFEDEDED))),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  height: 150,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Color(0xFFFBFBF3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset(imgPath),
                ),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 12,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFC2410C),
                      ),
                    ),

                    Text(
                      "Explore",
                      style: TextStyle(
                        color: Color(0xFF1D6437),
                        backgroundColor: Color(0xFFDDFCE8),
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(width: 8),
            const Icon(Icons.folder_open, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
