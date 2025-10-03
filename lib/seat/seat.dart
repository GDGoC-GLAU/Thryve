import 'package:flutter/material.dart';

class SeatSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _buildAppBar(),
            const SizedBox(height: 30),
            _buildSeatGrid(),
            const Spacer(),
            _buildWelcomeAboardText(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: const Icon(Icons.arrow_back, color: Colors.black, size: 24),
        ),
        const Text(
          'SELECT YOUR SEAT',
          style: TextStyle(
            fontFamily: 'SF Pro Display', // Using SF Pro Display as a placeholder
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: 1.5,
          ),
        ),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: const Icon(Icons.settings, color: Colors.black, size: 24),
        ),
      ],
    );
  }

  Widget _buildSeatGrid() {
    final List<String> seats = [
      'A1', 'A2', 'A3', 'A4',
      'B1', 'B2', 'B3', 'B4',
      'C1', 'C2', 'C3', 'C4',
      'D1', 'D2', 'D3', 'D4',
      'E1', 'E2', 'E3', 'E4',
      'F1', 'F2', 'F3', 'F4',
      'G1', 'G2', 'G3', 'G4',
    ];

    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[200], // Light grey background for the seat area
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Column(
        children: [
          for (int i = 0; i < 7; i++)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0), // Spacing between rows
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSeatButton(seats[i * 4]),
                  _buildSeatButton(seats[i * 4 + 1]),
                  const SizedBox(width: 20), // Space for the aisle
                  if (i == 2) // For the "ISLE" text
                    _buildAisleText(),
                  if (i != 2) // Empty placeholder for other rows
                    const SizedBox(width: 20),
                  const SizedBox(width: 20), // Space for the aisle
                  _buildSeatButton(seats[i * 4 + 2], isSelected: (i == 2 && seats[i * 4 + 2] == 'C3')),
                  _buildSeatButton(seats[i * 4 + 3], isOccupied: (i == 2 && seats[i * 4 + 3] == 'C4')),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSeatButton(String seatNumber, {bool isSelected = false, bool isOccupied = false}) {
    Color backgroundColor;
    Color borderColor = Colors.black;
    Color textColor = Colors.black;

    if (isSelected) {
      backgroundColor = Colors.transparent; // Transparent for selected
      borderColor = Colors.black;
      textColor = Colors.black;
    } else if (isOccupied) {
      backgroundColor = Colors.blue[800]!; // Dark blue for occupied
      borderColor = Colors.blue[800]!;
      textColor = Colors.white; // White text for occupied
    } else {
      backgroundColor = Colors.white;
      borderColor = Colors.black;
      textColor = Colors.black;
    }

    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor, width: 2),
      ),
      child: Center(
        child: isOccupied
            ? Container() // Empty container for the occupied seat to show solid color
            : Text(
                seatNumber,
                style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
      ),
    );
  }

  Widget _buildAisleText() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: 'ISLE'.split('').map((char) =>
          Text(
            char,
            style: const TextStyle(
              fontFamily: 'SF Pro Display',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              letterSpacing: 1.0,
            ),
          )
      ).toList(),
    );
  }

  Widget _buildWelcomeAboardText() {
    return const Text(
      'WELCOME ABOARD',
      style: TextStyle(
        fontFamily: 'SF Pro Display', // Using SF Pro Display as a placeholder
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        letterSpacing: 2,
      ),
    );
  }
}