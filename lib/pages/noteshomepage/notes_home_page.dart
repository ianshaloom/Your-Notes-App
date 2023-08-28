import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yournotes/pages/dialogs/note_view_dialog.dart';

import '../../data/data.dart';
import '../../models/note.dart';
import '../../widgets/disable_list_glow.dart';
import '../navigationpage/navigation_drawer.dart';
import 'widgets/note_tile.dart';
import 'widgets/sliverdelegate.dart';

class NotesHomePage extends StatefulWidget {
  const NotesHomePage({super.key});

  @override
  State<NotesHomePage> createState() => _NotesHomePageState();
}

class _NotesHomePageState extends State<NotesHomePage> {
  void _openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        toolbarHeight: 0,
      ),
      body: Builder(builder: (cxt) {
        return GlowingOverscrollWrapper(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                scrolledUnderElevation: 0,
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      'assets/images/logo.svg',
                    ),
                  ),
                  stretchModes: const [
                    StretchMode.blurBackground,
                    StretchMode.zoomBackground
                  ],
                ),
              ),
              SliverPersistentHeader(
                delegate: MyPersistentHeaderDelegate(
                  notes.length,
                  onTap: _openDrawer,
                  minHeight: 90,
                  maxHeight: 90,
                ),
                pinned: true,
              ),
              SliverPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                sliver: SliverFixedExtentList.list(
                  itemExtent: 150,
                  children: [
                    ...notes
                        .map(
                          (e) => NoteTile(
                            title: e.title,
                            date: e.date,
                            note: e.note,
                            openNote: _openNote,
                            e: e,
                          ),
                        )
                        .toList(),
                  ],
                ),
              )
              /*  */
            ],
          ),
        );
      }),
      drawer: const NavigationnDrawer(),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () => Navigator.pushNamed(context, '/home/newnote'),
        child: const Icon(CupertinoIcons.pencil),
      ),
    );
  }

  Future _openNote(BuildContext context, Note e) async {
    return showDialog(
      context: context,
      builder: (context) {
        return NoteDialog(
          e: e,
        );
      },
    );
  }


}
