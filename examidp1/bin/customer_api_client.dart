// import 'dart:convert';
// import 'package:http/http.dart' as http;

// import 'examidp1.dart';

// class CustomerApiClient {
//   final String baseUrl;

//   CustomerApiClient({required this.baseUrl});

//   Future<Customer> addCustomer(Customer customer) async {
//     final response = await http.post(
//       Uri.parse('$baseUrl/customers'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode(customer.toJson()),
//     );

//     if (response.statusCode == 200) {
//       return Customer.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Failed to add customer');
//     }
//   }

//   Future<List<Customer>> getAllCustomers() async {
//     final response = await http.get(Uri.parse('$baseUrl/customers'));

//     if (response.statusCode == 200) {
//       final jsonData = jsonDecode(response.body) as List<dynamic>;
//       return jsonData.map((item) => Customer.fromJson(item)).toList();
//     } else {
//       throw Exception('Failed to get customers');
//     }
//   }
// }