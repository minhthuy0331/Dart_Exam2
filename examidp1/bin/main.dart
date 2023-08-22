// import 'customer_api_client.dart';
// import 'examidp1.dart';

// void main() async {
//   final apiClient = CustomerApiClient(baseUrl: 'http://localhost:8080');

//   // Add a new customer
//   final newCustomer = Customer(
//     id: 1,
//     fullName: 'John Doe',
//     birthday: DateTime(1990, 12, 31),
//     address: '123 Main St',
//     phoneNumber: '555-1234',
//   );

//   final addedCustomer = await apiClient.addCustomer(newCustomer);
//   print('Added customer: $addedCustomer');

//   // Get all customers
//   final customers = await apiClient.getAllCustomers();
//   print('All customers:');
//   customers.forEach((customer) => print(customer));
// }