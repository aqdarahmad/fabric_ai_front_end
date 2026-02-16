import 'package:flutter/material.dart';

class FabricViewPage extends StatefulWidget {
  const FabricViewPage({Key? key}) : super(key: key);

  @override
  State<FabricViewPage> createState() => _FabricViewPageState();
}

class _FabricViewPageState extends State<FabricViewPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  
  final List<FabricDetailItem> goodFabrics = [
    FabricDetailItem(
      name: 'Cotton Fabric',
      image: 'assets/images/cotton.png',
      status: 'Passed',
      quality: 90,
      color: Colors.blue[300]!,
    ),
    FabricDetailItem(
      name: 'Silk Fabric',
      image: 'assets/images/silk.png',
      status: 'Passed',
      quality: 80,
      color: Colors.amber[600]!,
    ),
    FabricDetailItem(
      name: 'Wool Fabric',
      image: 'assets/images/wool.png',
      status: 'Passed',
      quality: 95,
      color: Colors.purple[300]!,
    ),
    FabricDetailItem(
      name: 'Linen Fabric',
      image: 'assets/images/linen.png',
      status: 'Passed',
      quality: 95,
      color: Colors.grey[400]!,
    ),
  ];

 
  final List<FabricDetailItem> defectiveFabrics = [
    FabricDetailItem(
      name: 'Damaged Cotton',
      image: 'assets/images/cotton.png',
      status: 'Failed',
      quality: 45,
      color: Colors.blue[300]!,
    ),
    FabricDetailItem(
      name: 'Torn Silk',
      image: 'assets/images/silk.png',
      status: 'Failed',
      quality: 30,
      color: Colors.amber[600]!,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'View',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          // Tabs
          Container(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: const Color(0xFFE91E63),
              indicatorWeight: 3,
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              tabs: const [
                Tab(text: 'Good Fabrics'),
                Tab(text: 'Defective Fabrics'),
              ],
            ),
          ),

       
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                    
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE91E63),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'search',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                  
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE91E63),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'sort',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

        
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Good Fabrics
                _buildFabricList(goodFabrics, isGood: true),
                // Defective Fabrics
                _buildFabricList(defectiveFabrics, isGood: false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFabricList(List<FabricDetailItem> items, {required bool isGood}) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return _buildFabricCard(items[index], isGood: isGood);
      },
    );
  }

  Widget _buildFabricCard(FabricDetailItem item, {required bool isGood}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
      
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[200],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                item.image,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: item.color,
                    child: const Icon(
                      Icons.texture,
                      color: Colors.white,
                      size: 25,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 12),

        
          Expanded(
            child: Text(
              item.name,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Status
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Status: ${item.status}',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Icon(
                    isGood ? Icons.check_circle : Icons.cancel,
                    color: isGood ? Colors.green : Colors.red,
                    size: 20,
                  ),
                ],
              ),
              const SizedBox(height: 4),
              // Quality
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Quality: ${item.quality}%',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class FabricDetailItem {
  final String name;
  final String image;
  final String status;
  final int quality;
  final Color color;

  FabricDetailItem({
    required this.name,
    required this.image,
    required this.status,
    required this.quality,
    required this.color,
  });
}