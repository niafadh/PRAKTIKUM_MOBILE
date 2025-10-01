import 'package:flutter/material.dart';
import 'vehicle.dart';

class DetailPage extends StatelessWidget {
  final Vehicle vehicle;

  const DetailPage({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        title: Text(
          vehicle.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white, 
          ),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ), 
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Hero(
              tag: vehicle.name,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  vehicle.imageUrls[0],
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 220,
                    color: Colors.grey[300],
                    child: const Icon(Icons.image_not_supported, size: 80),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            //  Card Info Kendaraan
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nama kendaraan
                  Text(
                    vehicle.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Informasi kendaraan ke bawah
                  _buildInfoRow("Tipe", vehicle.type),
                  _buildDivider(),
                  _buildInfoRow("Mesin", vehicle.engine),
                  _buildDivider(),
                  _buildInfoRow("Bahan Bakar", vehicle.fuelType),
                  _buildDivider(),
                  _buildInfoRow(
                    "Harga",
                    vehicle.price,
                    isHighlight: true,
                  ), // Harga bold & biru
                  const SizedBox(height: 16),

                  // Deskripsi
                  Text(
                    "Deskripsi",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo[900],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    vehicle.description,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk membuat baris info
  Widget _buildInfoRow(String label, String value, {bool isHighlight = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isHighlight ? FontWeight.bold : FontWeight.normal,
              color: isHighlight ? Colors.indigo[900] : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  // Divider tipis antar info
  Widget _buildDivider() {
    return Divider(color: Colors.grey[300], thickness: 1, height: 12);
  }
}
