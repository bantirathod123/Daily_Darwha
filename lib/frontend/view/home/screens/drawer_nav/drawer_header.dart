import 'package:flutter/material.dart';

class CustomDrawerHeader extends StatelessWidget {
  final String username;

  const CustomDrawerHeader({Key? key, required this.username})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: const BoxDecoration(
        color: Colors.blue,
      ),
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Image(
                  image: AssetImage('assets/icons/animal.png'),
                  width: 80,
                  height: 80,
                ),
                const SizedBox(width: 4),
                Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Namaste!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          username,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                    const Row(
                      children: [
                        Text(
                          'Wake up to Health!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
