// // Add this to the NikeProductPage class

// import 'package:flutter/material.dart';

// Widget _buildReviewsTab() {
//   return SingleChildScrollView(
//     padding: const EdgeInsets.all(16),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildReviewsSummary(),
//         const SizedBox(height: 24),
//         const Text(
//           'Customer Reviews',
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const SizedBox(height: 16),
//         _buildReviewsList(),
//       ],
//     ),
//   );
// }

// Widget _buildReviewsSummary() {
//   return Row(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Column(
//         children: [
//           const Text(
//             '4.8',
//             style: TextStyle(
//               fontSize: 48,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           Row(
//             children: List.generate(5, (index) {
//               return const Icon(
//                 Icons.star,
//                 size: 16,
//                 color: Colors.amber,
//               );
//             }),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             'Based on 2,458 reviews',
//             style: TextStyle(
//               fontSize: 12,
//               color: Colors.grey[600],
//             ),
//           ),
//         ],
//       ),
//       const SizedBox(width: 24),
//       Expanded(
//         child: Column(
//           children: List.generate(5, (index) {
//             final starCount = 5 - index;
//             final percentage = [70, 20, 5, 3, 2][index];
            
//             return Padding(
//               padding: const EdgeInsets.symmetric(vertical: 2),
//               child: Row(
//                 children: [
//                   Text(
//                     '$starCount',
//                     style: const TextStyle(fontSize: 12),
//                   ),
//                   const Icon(
//                     Icons.star,
//                     size: 12,
//                     color: Colors.amber,
//                   ),
//                   const SizedBox(width: 8),
//                   Expanded(
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(4),
//                       child: LinearProgressIndicator(
//                         value: percentage / 100,
//                         backgroundColor: Colors.grey[200],
//                         valueColor: AlwaysStoppedAnimation<Color>(Colors.grey[800]!),
//                         minHeight: 8,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 8),
//                   Text(
//                     '$percentage%',
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: Colors.grey[600],
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }),
//         ),
//       ),
//     ],
//   );
// }

// Widget _buildReviewsList() {
//   final List<Map<String, dynamic>> reviews = [
//     {
//       'userName': 'John D.',
//       'rating': 5.0,
//       'date': '2 days ago',
//       'verified': true,
//       'reviewText': 'Perfect fit and incredibly comfortable. The air cushioning is amazing for long runs.',
//     },
//     {
//       'userName': 'Sarah M.',
//       'rating': 4.5,
//       'date': '1 week ago',
//       'verified': true,
//       'reviewText': 'Great shoes, but took a few days to break in. Now they\'re my go-to for daily runs.',
//     },
//     {
//       'userName': 'Mike R.',
//       'rating': 5.0,
//       'date': '2 weeks ago',
//       'verified': false,
//       'reviewText': 'Excellent support and stylish design. Worth every penny!',
//     },
//   ];

//   return Column(
//     children: reviews.map((review) => ProductReviewWidget(
//       userName: review['userName'],
//       rating: review['rating'],
//       date: review['date'],
//       verified: review['verified'],
//       reviewText: review['reviewText'],
//     )).toList(),
//   );
// }