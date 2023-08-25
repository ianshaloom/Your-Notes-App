import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yournotes/pages/dialogs/note_view_dialog.dart';

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
                  minHeight: 85,
                  maxHeight: 85,
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
        onPressed: () => _openDrawer,
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

  final List<Note> notes = [
    Note(
        title: 'Product Management',
        date: DateTime.now(),
        note:
            """Product management is a strategic role within a company that involves overseeing the development and management of a product or suite of products throughout their lifecycle. The primary goal of a product manager is to create and deliver products that meet customer needs, align with business objectives, and generate value for the organization.
Market research and analysis: Product managers conduct market research to understand customer needs, preferences, and trends. They analyze market data and competitive landscape to identify opportunities and make informed product decisions.
Product strategy: Product managers define the product vision, goals, and strategy based on market research and business objectivesI. Inefficient Expense Tracking: Without an effective system for tracking expenses, young business owners may struggle to monitor their business costs accurately.
This can lead to overspending, financial instability, and difficulty in identifying areas for cost-cutting.\n\n
Product management is a strategic role within a company that involves overseeing the development and management of a product or suite of products throughout their lifecycle. The primary goal of a product manager is to create and deliver products that meet customer needs, align with business objectives, and generate value for the organization.
Market research and analysis: Product managers conduct market research to understand customer needs, preferences, and trends. They analyze market data and competitive landscape to identify opportunities and make informed product decisions.
Product strategy: Product managers define the product vision, goals, and strategy based on market research and business objectivesI. Inefficient Expense Tracking: Without an effective system for tracking expenses, young business owners may struggle to monitor their business costs accurately.
This can lead to overspending, financial instability, and difficulty in identifying areas for cost-cutting."""),
    Note(
        title: 'Tommorrows ToDo List',
        date: DateTime.now(),
        note:
            "Inefficient Expense Tracking: Without an effective system for tracking expenses, young business owners may struggle to monitor their business costs accurately. This can lead to overspending, financial instability, and difficulty in identifying areas for cost-cutting."),
    Note(
        title: 'Environment Club Metting',
        date: DateTime.now(),
        note:
            "Limited Profit and Loss Insights: Due to the absence of tools to calculate and analyze profit and loss, these entrepreneurs might not have a clear understanding of their business's financial health. This lack of insight can hinder their ability to make informed decisions and plan for the future."),
    Note(
        title: 'GitHub Commits',
        date: DateTime.now(),
        note:
            "Inadequate Business Decision-Making: Without access to business data and analytics, the youth entrepreneurs may struggle to make sound decisions. This can result in missed opportunities, poor resource allocation, and less efficient business strategies"),
    Note(
        title: 'Agile Deveopment',
        date: DateTime.now(),
        note:
            "Financial Literacy Gap: Many youth entrepreneurs may not have a solid understanding of financial concepts, making it challenging for them to manage their business finances effectively. Your app can bridge this gap by providing educational resources and insights related to financial management and business operations."),
  ];
}
