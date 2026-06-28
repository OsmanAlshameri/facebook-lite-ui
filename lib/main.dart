import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 5;

  // هاذي لستة الصفحات حق التنقل بينها
  final List<Widget> _pages = [
    const Center(child: Text("صفحة التسوق")),
    const Center(child: Text("صفحة الإشعارات")),
    const Center(child: Text("صفحة الفيديو")),
    const Center(child: Text("صفحة المحادثات")),
    const FriendsPage(),
    const HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // عشان تخفي الخط تحت الـ AppBar
        title: _selectedIndex == 5
            ? Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('facebook',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 32,
                            fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        IconButton(
                            icon: const Icon(Icons.add, color: Colors.black),
                            onPressed: () {}),
                        IconButton(
                            icon: const Icon(Icons.search, color: Colors.black),
                            onPressed: () {}),
                        IconButton(
                            icon: const Icon(Icons.menu, color: Colors.black),
                            onPressed: () {}),
                      ],
                    ),
                  ],
                ),
              )
            : _selectedIndex == 4
                ? Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back, color: Colors.black),
                          onPressed: () => setState(() => _selectedIndex = 5),
                        ),
                        const Text("الأصدقاء",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 22)),
                        const Spacer(),
                        IconButton(
                            icon: const Icon(Icons.search, color: Colors.black),
                            onPressed: () {}),
                      ],
                    ),
                  )
                : _selectedIndex == 3
                    ? Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back, color: Colors.black),
                              onPressed: () => setState(() => _selectedIndex = 5),
                            ),
                            const Text("الرسائل",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22)),
                            const Spacer(),
                            IconButton(
                                icon: const Icon(Icons.settings, color: Colors.black),
                                onPressed: () {}),
                            IconButton(
                                icon: const Icon(Icons.search, color: Colors.black),
                                onPressed: () {}),
                          ],
                        ),
                      )
                : _selectedIndex == 2
                    ? Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back, color: Colors.black),
                              onPressed: () => setState(() => _selectedIndex = 5),
                            ),
                            const Text("الفيديو",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22)),
                            const Spacer(),
                            IconButton(
                               icon: const Icon(Icons.search, color: Colors.black),
                                onPressed: () {}),
                                
                            IconButton(
                                icon: const Icon(Icons.camera_alt, color: Colors.black),
                                onPressed: () {}),
                            IconButton(
                                icon: const Icon(Icons.person, color: Colors.black),
                                onPressed: () {}),
                               
                                
                          ],
                        ),
                      )
                : _selectedIndex == 1
                    ? Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back, color: Colors.black),
                              onPressed: () => setState(() => _selectedIndex = 5),
                            ),
                            const Text("الإشعارات",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22)),
                            const Spacer(),
                            IconButton(
                                icon: const Icon(Icons.check_circle, color: Colors.black),
                                onPressed: () {}),
                            IconButton(
                                icon: const Icon(Icons.search, color: Colors.black),
                                onPressed: () {}),
                          ],
                        ),
                      )
                    : Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back, color: Colors.black),
                              onPressed: () => setState(() => _selectedIndex = 5),
                            ),
                            const Spacer(),
                            Text(
                              _getPageTitle(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ),
                            const Spacer(),
                            IconButton(
                                icon: const Icon(Icons.search, color: Colors.black),
                                onPressed: () {}),
                          ],
                        ),
                      ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildIconButton(Icons.store, 0),
                _buildIconButton(Icons.notifications, 1),
                _buildIconButton(Icons.ondemand_video, 2),
                _buildIconButton(Icons.messenger_outline, 3),
                _buildIconButton(Icons.group, 4),
                _buildIconButton(Icons.home, 5),
              ],
            ),
          ),
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }

  // دالة ترجع اسم الصفحة حسب الرقم
  String _getPageTitle() {
    if (_selectedIndex == 0) return "التسوق";
    if (_selectedIndex == 1) return "الإشعارات";
    if (_selectedIndex == 2) return "الفيديو";
    if (_selectedIndex == 3) return "الرسائل";
    return "";
  }

  // دالة حق الزر حق كل ايقونة تحت
  Widget _buildIconButton(IconData icon, int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(icon,
              color: _selectedIndex == index ? Colors.blue : Colors.grey,
              size: 28),
          onPressed: () => setState(() => _selectedIndex = index),
        ),
        if (_selectedIndex == index)
          Container(height: 3, width: 30, color: Colors.blue),
      ],
    );
  }
}

// --- الصفحة الرئيسية (الفيسبوك) ---
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  children: [
                    const CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage('assets/osman_photo.jpg')),
                    const SizedBox(width: 10),
                    const Expanded(
                        child: TextField(
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                          hintText: 'بم تفكر؟',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)
                                  )
                                  )
                                  ),
                    )
                    ),
                    const SizedBox(width: 10),
                    const Icon(Icons.photo_library,
                        color: Colors.green, size: 30),
                  ],
                ))),
        const SizedBox(height: 10),
        Container(
            color: Colors.white,
            height: 180,
            child: Directionality(
                textDirection: TextDirection.rtl,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    const SizedBox(width: 10),
                    _buildStoryContainer("إنشاء قصة", 'assets/osman_photo.jpg',
                        isAddStory: true),
                    _buildStoryContainer(
                        "أنس الصبري", 'assets/anas_photo.jpg'),
                    _buildStoryContainer(
                        "عثمان الشميري", 'assets/osman_photo.jpg'),
                  ],
                ))),
        const SizedBox(height: 10),
        _buildPost("أنس الصبري", "منذ ساعتين",
            "المهندس أنس الصبري : مهندس تقني ومدرب ذكاء اصطناعي",
            imagePath: 'assets/anas_photo.jpg',
            publisherImagePath: 'assets/anas_photo.jpg'),
      ],
    );
  }

  static Widget _buildStoryContainer(String name, String imagePath,
      {bool isAddStory = false}) {
    return Container(
        width: 110,
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(15),
            image: isAddStory
                ? null
                : DecorationImage(
                    image: AssetImage(imagePath), fit: BoxFit.cover)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 10),
              if (isAddStory)
                const Icon(Icons.add_circle, color: Colors.blue, size: 40),
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.black45,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(15))),
                  child: Text(name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold))),
            ]));
  }

  static Widget _buildPost(String name, String time, String content,
      {String? imagePath, String? publisherImagePath}) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 3)
            ]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: const EdgeInsets.all(10),
              child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(children: [
                    CircleAvatar(
                        radius: 20,
                        backgroundImage: publisherImagePath != null
                            ? AssetImage(publisherImagePath)
                            : null),
                    const SizedBox(width: 10),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        Text(time,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 12)),
                      ],
                    )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_horiz)),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.close)),
                  ]))),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(content, textAlign: TextAlign.right))),
          if (imagePath != null)
            Image.asset(imagePath, fit: BoxFit.cover, width: double.infinity),
          const Divider(),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.reply,
                        color: Colors.grey, size: 30)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.comment_outlined,
                        color: Colors.grey)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.thumb_up_alt_outlined,
                        color: Colors.grey)),
              ]),
        ]));
  }
}

// --- صفحة الأصدقاء ---
class FriendsPage extends StatelessWidget {
  const FriendsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: ListView(
              padding: const EdgeInsets.all(15.0),
              children: [
                Row(
                  children: [
                    _buildFilterButton("الاقتراحات"),
                    const SizedBox(width: 10),
                    _buildFilterButton("أصدقاؤك"),
                  ],
                ),
                const SizedBox(height: 20),
                const Text("طلبات الصداقة",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 15),
                _buildFriendRequest("أنس الصبري", "assets/anas_photo.jpg"),
                _buildFriendRequest("عثمان الشميري", "assets/osman_photo.jpg"),
                _buildFriendRequest("أنس", "assets/anas_photo.jpg"),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFriendRequest(String name, String imagePath) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          CircleAvatar(radius: 35, backgroundImage: AssetImage(imagePath)),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue),
                            child: const Text("تأكيد",
                                style: TextStyle(color: Colors.white)))),
                    const SizedBox(width: 10),
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[300]),
                            child: const Text("حذف",
                                style: TextStyle(color: Colors.black)))),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey[300]!)),
      child: Text(label,
          style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
