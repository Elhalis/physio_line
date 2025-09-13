import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:physio_line/src/presentation/widget/text/explore_text.dart';
import 'package:physio_line/src/presentation/widget/text/text.dart';

class ImagePathTile extends StatelessWidget {
  const ImagePathTile({
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
      onTap: () {
        assert(() {
          // ignore: avoid_print
          print('[NAV] image_path_tile -> push: $path');
          return true;
        }());
        context.push(path);
      },
      hoverColor: Colors.grey[100],
      child: Container(
        padding: EdgeInsetsDirectional.symmetric(vertical: 12.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Color(0xFFEDEDED))),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 8,
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Color(0xFFFBFBF3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(imgPath),
            ),
            PrimaryText(title: title),

            ExploreText(),
          ],
        ),
      ),
    );
  }
}
