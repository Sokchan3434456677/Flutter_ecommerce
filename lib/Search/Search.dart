// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Clean Search',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//         useMaterial3: true,
//       ),
//       home: const SearchPage(),
//     );
//   }
// }

// class SearchPage extends StatefulWidget {
//   const SearchPage({super.key});

//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   final TextEditingController _searchController = TextEditingController();
//   final FocusNode _searchFocusNode = FocusNode();
//   List<String> _searchResults = [];
//   List<String> _recentSearches = ['Flutter', 'Dart', 'UI Design', 'Firebase'];
//   bool _showRecentSearches = true;

//   @override
//   void initState() {
//     super.initState();
//     _searchController.addListener(_onSearchChanged);
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     _searchFocusNode.dispose();
//     super.dispose();
//   }

//   void _onSearchChanged() {
//     if (_searchController.text.isEmpty) {
//       setState(() {
//         _showRecentSearches = true;
//         _searchResults.clear();
//       });
//     } else {
//       setState(() {
//         _showRecentSearches = false;
//       });
//       _performSearch(_searchController.text);
//     }
//   }

//   void _performSearch(String query) {
//     // Simulate a search API call
//     Future.delayed(const Duration(milliseconds: 300), () {
//       if (!mounted || query != _searchController.text) return;
      
//       setState(() {
//         _searchResults = List.generate(
//           5,
//           (index) => '$query result ${index + 1}',
//         );
//       });
//     });
//   }

//   void _clearSearch() {
//     setState(() {
//       _searchController.clear();
//       _searchResults.clear();
//       _showRecentSearches = true;
//     });
//   }

//   void _executeSearch(String query) {
//     if (query.isEmpty) return;
    
//     setState(() {
//       if (!_recentSearches.contains(query)) {
//         _recentSearches.insert(0, query);
//         if (_recentSearches.length > 5) {
//           _recentSearches.removeLast();
//         }
//       }
//       _showRecentSearches = false;
//     });
//     _performSearch(query);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         systemOverlayStyle: SystemUiOverlayStyle.dark,
//         toolbarHeight: 80,
//         title: _buildSearchBar(),
//         centerTitle: true,
//       ),
//       body: _buildBody(),
//     );
//   }

//   Widget _buildSearchBar() {
//     return Container(
//       height: 50,
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       decoration: BoxDecoration(
//         color: Colors.grey[200],
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: TextField(
//         controller: _searchController,
//         focusNode: _searchFocusNode,
//         decoration: InputDecoration(
//           hintText: 'Search...',
//           border: InputBorder.none,
//           prefixIcon: const Icon(Icons.search, color: Colors.grey),
//           suffixIcon: _searchController.text.isNotEmpty
//               ? IconButton(
//                   icon: const Icon(Icons.close, color: Colors.grey),
//                   onPressed: _clearSearch,
//                 )
//               : null,
//           contentPadding: const EdgeInsets.symmetric(vertical: 12),
//         ),
//         textInputAction: TextInputAction.search,
//         onSubmitted: _executeSearch,
//       ),
//     );
//   }

//   Widget _buildBody() {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           if (_showRecentSearches && _recentSearches.isNotEmpty) ...[
//             const Text(
//               'Recent Searches',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8),
//             Wrap(
//               spacing: 8,
//               runSpacing: 8,
//               children: _recentSearches
//                   .map((search) => ActionChip(
//                         label: Text(search),
//                         onPressed: () {
//                           _searchController.text = search;
//                           _executeSearch(search);
//                         },
//                       ))
//                   .toList(),
//             ),
//             const SizedBox(height: 16),
//           ],
//           if (!_showRecentSearches) ...[
//             Text(
//               'Results for "${_searchController.text}"',
//               style: const TextStyle(
//                 fontSize: 14,
//                 color: Colors.grey,
//               ),
//             ),
//             const SizedBox(height: 8),
//           ],
//           Expanded(
//             child: _showRecentSearches
//                 ? _buildEmptyState()
//                 : _buildSearchResults(),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildEmptyState() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Icon(
//           Icons.search,
//           size: 64,
//           color: Colors.grey[300],
//         ),
//         const SizedBox(height: 16),
//         Text(
//           'Search for anything',
//           style: TextStyle(
//             fontSize: 18,
//             color: Colors.grey[500],
//           ),
//         ),
//         const SizedBox(height: 8),
//         Text(
//           'Try "Flutter widgets" or "Dart packages"',
//           style: TextStyle(
//             fontSize: 14,
//             color: Colors.grey[400],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildSearchResults() {
//     if (_searchResults.isEmpty) {
//       return const Center(
//         child: CircularProgressIndicator(),
//       );
//     }

//     return ListView.separated(
//       itemCount: _searchResults.length,
//       separatorBuilder: (context, index) => const Divider(height: 1),
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: Text(_searchResults[index]),
//           trailing: const Icon(Icons.chevron_right),
//           onTap: () {
//             // Handle item tap
//           },
//         );
//       },
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  List<String> _searchResults = [];
  List<String> _recentSearches = ['Flutter', 'Dart', 'UI Design', 'Firebase'];
  bool _showRecentSearches = true;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    _searchFocusNode.requestFocus(); // Auto-focus on search field
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    if (_searchController.text.isEmpty) {
      setState(() {
        _showRecentSearches = true;
        _searchResults.clear();
      });
    } else {
      setState(() {
        _showRecentSearches = false;
      });
      _performSearch(_searchController.text);
    }
  }

  void _performSearch(String query) {
    // Simulate a search API call
    Future.delayed(const Duration(milliseconds: 300), () {
      if (!mounted || query != _searchController.text) return;
      
      setState(() {
        _searchResults = List.generate(
          5,
          (index) => '$query result ${index + 1}',
        );
      });
    });
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
      _searchResults.clear();
      _showRecentSearches = true;
    });
    _searchFocusNode.requestFocus();
  }

  void _executeSearch(String query) {
    if (query.isEmpty) return;
    
    setState(() {
      if (!_recentSearches.contains(query)) {
        _recentSearches.insert(0, query);
        if (_recentSearches.length > 5) {
          _recentSearches.removeLast();
        }
      }
      _showRecentSearches = false;
    });
    _performSearch(query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        toolbarHeight: 80,
        title: _buildSearchBar(),
        centerTitle: true,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: _searchController,
        focusNode: _searchFocusNode,
        decoration: InputDecoration(
          hintText: 'Search...',
          border: InputBorder.none,
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          suffixIcon: _searchController.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.close, color: Colors.grey),
                  onPressed: _clearSearch,
                )
              : null,
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
        ),
        textInputAction: TextInputAction.search,
        onSubmitted: _executeSearch,
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_showRecentSearches && _recentSearches.isNotEmpty) ...[
            const Text(
              'Recent Searches',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _recentSearches
                  .map((search) => ActionChip(
                        label: Text(search),
                        onPressed: () {
                          _searchController.text = search;
                          _executeSearch(search);
                        },
                      ))
                  .toList(),
            ),
            const SizedBox(height: 16),
          ],
          if (!_showRecentSearches) ...[
            Text(
              'Results for "${_searchController.text}"',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
          ],
          Expanded(
            child: _showRecentSearches
                ? _buildEmptyState()
                : _buildSearchResults(),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.search,
          size: 64,
          color: Colors.grey[300],
        ),
        const SizedBox(height: 16),
        Text(
          'Search for anything',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey[500],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Try "Flutter widgets" or "Dart packages"',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[400],
          ),
        ),
      ],
    );
  }

  Widget _buildSearchResults() {
    if (_searchResults.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return ListView.separated(
      itemCount: _searchResults.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_searchResults[index]),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            // Handle item tap
          },
        );
      },
    );
  }
}