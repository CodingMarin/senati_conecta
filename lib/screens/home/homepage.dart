import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.nombre});

  final Color? nombre;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Builder(
        builder: (BuildContext context) {
          return Scaffold(
            drawerScrimColor: const Color.fromRGBO(15, 20, 24, .6),
            drawer: Drawer(
              surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              shape: ShapeBorder.lerp(LinearBorder.top(size: 0), LinearBorder.bottom(size:0), 0),
              child: SafeArea(
                child: AppBar(
                  automaticallyImplyLeading: false,
                  centerTitle: false,
                  backgroundColor:Theme.of(context).scaffoldBackgroundColor,
                  foregroundColor: Theme.of(context).primaryColor,
                  leading: IconButton(onPressed: ()=> Navigator.pop(context), icon: const Icon(Icons.close)),
                  title: Text('Menú', style: TextStyle(fontFamily: 'chirp_bold',fontSize: 15.sp),),
                ),

              ),
            ),
            body: NestedScrollView(
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
                  return <Widget>[
                    SliverAppBar(
                      toolbarHeight: 55,
                      centerTitle: true,
                      floating: true,
                      snap: true,
                      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                      surfaceTintColor: Colors.transparent,
                      foregroundColor: Theme.of(context).primaryColor,
                      title: Image.asset('assets/icons/icon_twitter.png', width: 18.sp,),
                      bottom: PreferredSize(preferredSize: const Size(0, 0), child: Container(decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor,width: 0.1))),)),
                    ),
              ];
            },
            body: TabBarView(
              children: <Widget>[
                CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 30.h),
                              Text(
                                'Aroon',
                                style: TextStyle(
                                  fontFamily: 'GraphikBold',
                                  fontSize: 15.sp,
                                  color: widget.nombre,
                                ),
                              ),
                              Text(
                                'Acutaliza para ver contenido',
                                style: TextStyle(
                                  fontFamily: 'GraphikRegular',
                                  fontSize: 10.7.sp,
                                  color: const Color(0xFF9197A0),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            ),
          );
        }
      ),
    );
  }
}
