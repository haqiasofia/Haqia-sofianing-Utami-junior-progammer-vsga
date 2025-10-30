import 'package:flutter/material.dart';
import '../servis/db.servis.dart';
import '../model/order.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  bool loading = true;
  List<OrderModel> orders = [];

  @override
  void initState() {
    super.initState();
    _loadOrders();
  }

  Future<void> _loadOrders() async {
    setState(() => loading = true);
    final data = await DBService.instance.fetchOrders();
    setState(() {
      orders = data;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin - Daftar Pesanan'),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
      ),
      body: RefreshIndicator(
        onRefresh: _loadOrders,
        child: loading
            ? const Center(child: CircularProgressIndicator())
            : orders.isEmpty
            ? ListView(
          children: const [
            Center(
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: Text('Belum ada pesanan'),
              ),
            ),
          ],
        )
            : ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: ListTile(
                leading: const Icon(Icons.receipt_long, color: Colors.brown),
                title: Text(order.productName),
                subtitle: Text(
                  '${order.customerName} • ${order.customerPhone}\n'
                      'Lat: ${order.latitude.toStringAsFixed(5)}, Lng: ${order.longitude.toStringAsFixed(5)}',
                ),
                isThreeLine: true,
                trailing: Text(
                  'Rp ${order.price.toStringAsFixed(0)}',
                  style: TextStyle(
                    color: Colors.brown[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}