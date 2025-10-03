import 'package:flutter/material.dart';

// A stateless widget representing the Seat Selection screen
class SeatSelectionScreen extends StatelessWidget {
  const SeatSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea( // Ensures layout avoids status bar / notches
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView( // Makes screen scrollable if content is long
          child: Column(
            children: [
              _buildAppBar(), // Custom top bar with back, title, and settings
              const SizedBox(height: 30),
              _buildSeatGrid(), // The seat layout grid
            ],
          ),
        ),
      ),
    );
  }

  // Builds the app bar with back button, title, and settings
  Widget _buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Back button (left)
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: const Icon(Icons.arrow_back, color: Colors.black, size: 24),
        ),
        // Title in the middle
        const Text(
          'SELECT YOUR SEAT',
          style: TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: 1.5,
          ),
        ),
        // Settings button (right)
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

  // Builds the seat layout grid with rows and aisle
  Widget _buildSeatGrid() {
    // List of all seat labels
    final List<String> seats = [
      'A1','A2','A3','A4',
      'B1','B2','B3','B4',
      'C1','C2','C3','C4',
      'D1','D2','D3','D4',
      'E1','E2','E3','E4',
      'F1','F2','F3','F4',
      'G1','G2','G3','G4',
    ];

    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[200], // Light grey background
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Column(
        children: [
          // Loop through 7 rows
          for (int i = 0; i < 7; i++)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0), // Row spacing
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Left side seats
                  _buildSeatButton(seats[i * 4]),
                  _buildSeatButton(seats[i * 4 + 1]),

                  const SizedBox(width: 20), // Left aisle spacing

                  // Add aisle text only for 3rd row (i == 2)
                  if (i == 2) _buildAisleText()
                  else const SizedBox(width: 20), // Placeholder for other rows

                  const SizedBox(width: 20), // Right aisle spacing

                  // Right side seats
                  _buildSeatButton(
                    seats[i * 4 + 2],
                    isSelected: (i == 2 && seats[i * 4 + 2] == 'C3'), // Example: C3 selected
                  ),
                  _buildSeatButton(
                    seats[i * 4 + 3],
                    isOccupied: (i == 2 && seats[i * 4 + 3] == 'C4'), // Example: C4 occupied
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  // Builds a single seat button with different states
  Widget _buildSeatButton(
    String seatNumber, {
    bool isSelected = false,
    bool isOccupied = false,
  }) {
    // Default colors
    Color backgroundColor;
    Color borderColor = Colors.black;
    Color textColor = Colors.black;

    // Customize seat states
    if (isSelected) {
      // Selected seat -> transparent with black border
      backgroundColor = Colors.transparent;
      borderColor = Colors.black;
      textColor = Colors.black;
    } else if (isOccupied) {
      // Occupied seat -> dark blue, no label
      backgroundColor = Colors.blue[800]!;
      borderColor = Colors.blue[800]!;
      textColor = Colors.white;
    } else {
      // Available seat
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
            ? Container() // Occupied seats show only color (no text)
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

  // Builds vertical "ISLE" text for aisle separator
  Widget _buildAisleText() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: 'ISLE'
          .split('')
          .map(
            (char) => Text(
              char,
              style: const TextStyle(
                fontFamily: 'SF Pro Display',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 1.0,
              ),
            ),
          )
          .toList(),
    );
  }
}
