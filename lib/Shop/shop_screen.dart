import 'package:consuelo/Widgets/size_guide_button.dart';
import 'package:flutter/material.dart';

class NikeProductPage extends StatefulWidget {
  const NikeProductPage({super.key});

  @override
  State<NikeProductPage> createState() => _NikeProductPageState();
}

class _NikeProductPageState extends State<NikeProductPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentImageIndex = 0;
  int _selectedSize = -1;
  int _selectedColor = 0;
  bool _isDescriptionExpanded = false;

  final List<String> _images = [
    "assets/Helmet_main.PNG",
    "assets/Helmet_side.png",
    'assets/Helmet_under.png',
    'assets/Helmet_front.png'
  ];

  final List<Color> _colors = [
    Colors.black,
    Color.fromARGB(255, 35, 38, 55),
    Color.fromARGB(255, 53, 52, 49),
  ];

  final List<String> _sizes = [
    'cm 52',
    'cm 53',
    'cm 54',
    'cm 55',
    'cm 56',
    'cm 57',
    'cm 58',
    'cm 59',
    'cm 60',
    'cm 61',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          title: Image.asset(
            'assets/Equis.png',
            height: 100,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon:
                  const Icon(Icons.shopping_cart_outlined, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildImageCarousel(),
                    _buildProductInfo(),
                    _buildColorSelector(),
                    _buildSizeSelector(),
                    SizeGuideButton(),
                    _buildTabBar(),
                    _buildTabContent(),
                  ],
                ),
              ),
            ],
          ),
          // _buildBottomButtons(),
        ],
      ),
    );
  }

  Widget _buildImageCarousel() {
    return SizedBox(
      height: 300,
      child: Stack(
        children: [
          PageView.builder(
            itemCount: _images.length,
            onPageChanged: (index) {
              setState(() => _currentImageIndex = index);
            },
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Implement zoom functionality
                },
                child: Hero(
                  tag: 'product-image-$index',
                  child: Image.asset(
                    _images[index],
                    fit: BoxFit.contain,
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _images.asMap().entries.map((entry) {
                return Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentImageIndex == entry.key
                        ? Colors.black
                        : Colors.grey[300],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductInfo() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Kask Dogma Chrome',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(
            "Jumping Helmet",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 12),
          Text(
            '\€549.00',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorSelector() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Select Color',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _colors.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() => _selectedColor = index);
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: _colors[index],
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: _selectedColor == index
                            ? Colors.black
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSizeSelector() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: const [
              Text(
                'Select Size',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _sizes.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() => _selectedSize = index);
                  },
                  child: Container(
                    width: 70,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _selectedSize == index
                            ? Colors.black
                            : Colors.grey[300]!,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      color: _selectedSize == index
                          ? Colors.black
                          : Colors.transparent,
                    ),
                    child: Center(
                      child: Text(
                        _sizes[index],
                        style: TextStyle(
                          color: _selectedSize == index
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      controller: _tabController,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
      indicatorColor: Colors.black,
      tabs: const [
        Tab(text: 'Description'),
        Tab(text: 'Reviews'),
        Tab(text: 'Shipping'),
      ],
    );
  }

  Widget _buildTabContent() {
    return SizedBox(
      height: 300,
      child: TabBarView(
        controller: _tabController,
        children: [
          _buildDescriptionTab(),
          _buildReviewsTab(),
          _buildShippingTab(),
        ],
      ),
    );
  }

  Widget _buildDescriptionTab() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'The Kask Dogma combines the best features of two icons of safety...',
            maxLines: _isDescriptionExpanded ? null : 3,
            overflow: _isDescriptionExpanded ? null : TextOverflow.ellipsis,
          ),
          TextButton(
            onPressed: () {
              setState(() => _isDescriptionExpanded = !_isDescriptionExpanded);
            },
            child: Text(
              _isDescriptionExpanded ? 'Show Less' : 'Show More',
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewsTab() {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          // Reviews content here
        ],
      ),
    );
  }

  Widget _buildShippingTab() {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          // Shipping content here
        ],
      ),
    );
  }

//
}
