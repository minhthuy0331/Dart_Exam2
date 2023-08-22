import 'dart:convert';
import 'package:http/http.dart' as http;

class Customer {
  int id;
  String fullName;
  String birthday;
  String address;
  String phoneNumber;

  Customer(
      this.id, this.fullName, this.birthday, this.address, this.phoneNumber);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'birthday': birthday,
      'address': address,
      'phoneNumber': phoneNumber,
    };
  }
}

Future<void> addCustomer(Customer customer) async {
  final url = Uri.parse('http://localhost:8080/customers');
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(customer.toJson()), // Convert customer to JSON
  );

  if (response.statusCode == 201) {
    print('Customer added successfully.');
  } else {
    print('Failed to add customer: ${response.statusCode}');
  }
}

Future<List<Customer>> getAllCustomers() async {
  final url = Uri.parse('http://localhost:8080/customers');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final List<dynamic> customerData = jsonDecode(response.body);
    final List<Customer> customers = customerData
        .map((data) => Customer(data['id'], data['fullName'], data['birthday'],
            data['address'], data['phoneNumber']))
        .toList();

    return customers;
  } else {
    print('Failed to retrieve customers: ${response.statusCode}');
    return [];
  }
}

void main() {
  // Example usage
  final customer =
      Customer(1, 'John Doe', '1990-01-01', '123 Main St', '1234567890');

  addCustomer(customer);
  getAllCustomers().then((customers) {
    customers.forEach((customer) {
      print('Customer ID: ${customer.id}');
      print('Full Name: ${customer.fullName}');
      print('Birthday: ${customer.birthday}');
      print('Address: ${customer.address}');
      print('Phone Number: ${customer.phoneNumber}');
      print('---------------------');
    });
  });
}
