import 'package:BloomBright/hotel_booking/blood.dart';
import 'package:BloomBright/hotel_booking/calendar_popup_view.dart';
import 'package:BloomBright/hotel_booking/hotel_list_view.dart';
import 'package:BloomBright/hotel_booking/menorrhagia.dart';
import 'package:BloomBright/hotel_booking/model/hotel_list_data.dart';
import 'package:BloomBright/hotel_booking/model/notes.dart';
import 'package:flutter/material.dart';
import 'hotel_app_theme.dart';

class HotelHomeScreen extends StatefulWidget {
  @override
  _HotelHomeScreenState createState() => _HotelHomeScreenState();
}

class _HotelHomeScreenState extends State<HotelHomeScreen>
    with TickerProviderStateMixin {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 5));
  AnimationController? animationController;
  List<HotelListData> hotelList = HotelListData.hotelList;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: HotelAppTheme.buildLightTheme(),
      child: Container(
        child: Scaffold(
          backgroundColor: Color(0xffF7EBE1),
          body: Stack(
            children: <Widget>[
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Column(
                  children: <Widget>[
                    getAppBarUI(),
                    Expanded(
                      child: Container(
                        color: Color(0xffF7EBE1),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: SingleChildScrollView(
                            controller: _scrollController,
                            child: Column(
                              children: hotelList.asMap().entries.map((entry) {
                                final int count = hotelList.length > 10
                                    ? 10
                                    : hotelList.length;
                                final int index = entry.key;
                                final Animation<double> animation =
                                Tween<double>(begin: 0.0, end: 1.0).animate(
                                  CurvedAnimation(
                                    parent: animationController!,
                                    curve: Interval(
                                      (1 / count) * index,
                                      1.0,
                                      curve: Curves.fastOutSlowIn,
                                    ),
                                  ),
                                );
                                animationController?.forward();
                                return Column(
                                  children: [
                                    SizedBox(
                                      height: 15,
                                    ),
                                    HotelListView(
                                      callback: () {},
                                      hotelData: entry.value,
                                      animation: animation,
                                      animationController: animationController!,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Center(
                                          child: SizedBox(
                                            height: 125,
                                            width: 160,
                                            child: Card(
                                              elevation: 8.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  bottomRight:
                                                  Radius.circular(54.0),
                                                  bottomLeft:
                                                  Radius.circular(54.0),
                                                  topLeft: Radius.circular(54.0),
                                                  topRight: Radius.circular(54.0),
                                                ),
                                              ),
                                              color: Colors.white,
                                              child: SizedBox(
                                                child: Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 20,
                                                      right: 8,
                                                      top: 33,
                                                      bottom: 8),
                                                  child: Center(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Center(
                                                          child: Text(
                                                            'Ovulation Date',
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.bold,
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                        Center(
                                                          child: Text(
                                                            '${startDate.add(Duration(days: 14)).toLocal().toString().split(' ')[0]}',
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight: FontWeight.bold,
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        SizedBox(
                                          height: 125,
                                          width: 160,
                                          child: Card(
                                            elevation: 8.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                bottomRight:
                                                Radius.circular(54.0),
                                                bottomLeft:
                                                Radius.circular(54.0),
                                                topLeft: Radius.circular(54.0),
                                                topRight: Radius.circular(54.0),
                                              ),
                                            ),
                                            color: Colors.white,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20,
                                                  right: 8,
                                                  top: 33,
                                                  bottom: 8),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Alert Date',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Text(
                                                    '${startDate.add(Duration(days: 28)).toLocal().toString().split(' ')[0]}',
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    FractionallySizedBox(
                                      widthFactor: 0.85,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => NotesPage(),
                                            ),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          elevation: 8.0, backgroundColor: Colors.red[400]!.withOpacity(0.8),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(8.0),
                                              bottomLeft: Radius.circular(8.0),
                                              topLeft: Radius.circular(54.0),
                                              topRight: Radius.circular(54.0),
                                            ),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 24,
                                              left: 16,
                                              right: 16,
                                              bottom: 8),
                                          child: Text(
                                            'Notes',
                                            style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    FractionallySizedBox(
                                      widthFactor: 0.85,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  MenorrhagiaScreen(),
                                            ),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          elevation: 8.0, backgroundColor: Colors.red[400]!.withOpacity(0.8),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(8.0),
                                              bottomLeft: Radius.circular(8.0),
                                              topLeft: Radius.circular(54.0),
                                              topRight: Radius.circular(54.0),
                                            ),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 24,
                                              left: 16,
                                              right: 16,
                                              bottom: 8),
                                          child: Text(
                                            'Menorrhagia',
                                            style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    FractionallySizedBox(
                                      widthFactor: 0.85,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => BloodT(),
                                            ),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          elevation: 8.0, backgroundColor: Colors.red[400]!.withOpacity(0.8),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(8.0),
                                              bottomLeft: Radius.circular(8.0),
                                              topLeft: Radius.circular(54.0),
                                              topRight: Radius.circular(54.0),
                                            ),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 24,
                                              left: 16,
                                              right: 16,
                                              bottom: 8),
                                          child: Text(
                                            'Blood Analysis',
                                            style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showDemoDialog({BuildContext? context}) {
    showDialog<dynamic>(
      context: context!,
      builder: (BuildContext context) => CalendarPopupView(
        barrierDismissible: true,
        minimumDate: DateTime.now(),
        initialEndDate: endDate,
        initialStartDate: startDate,
        onApplyClick: (DateTime startData, DateTime endData) {
          setState(() {
            startDate = startData;
            endDate = endData;
          });
        },
        onCancelClick: () {},
      ),
    );
  }

  Widget getAppBarUI() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffF7EBE1),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            offset: const Offset(0, 2),
            blurRadius: 8.0,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top, left: 8, right: 8),
        child: Row(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              width: AppBar().preferredSize.height + 40,
              height: AppBar().preferredSize.height,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(32.0),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.arrow_back),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Text(
                '     Explore',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContestTabHeader extends SliverPersistentHeaderDelegate {
  ContestTabHeader(
      this.searchUI,
      this.startDate,
      this.endDate,
      );
  final Widget searchUI;
  final DateTime startDate;
  final DateTime endDate;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    DateTime ovulationDate = startDate.add(Duration(days: 14));

    return Column(
      children: [
        SizedBox(height: 10),
        SizedBox(
          height: 125,
          width: 160,
          child: Card(
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(54.0),
                bottomLeft: Radius.circular(54.0),
                topLeft: Radius.circular(54.0),
                topRight: Radius.circular(54.0),
              ),
            ),
            color: Colors.white,
            child: Padding(
              padding:
              const EdgeInsets.only(left: 20, right: 8, top: 8, bottom: 8),
              child: Center(
                child: Text(
                  'Ovulation Date: ${ovulationDate.toString()}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
      ],
    );
  }

  @override
  double get maxExtent => 52.0;

  @override
  double get minExtent => 52.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}