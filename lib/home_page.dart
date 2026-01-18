import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ================= HEADER =================
              Row(
                children: [
                  const CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage('assets/IMG_0427.JPG'),
                  ),
                  const SizedBox(width: 12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Welcome back,",
                          style: TextStyle(color: Colors.grey)),
                      Text(
                        "Timothy",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(SolarIconsOutline.medalRibbonStar),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(SolarIconsOutline.bell),
                    onPressed: () {},
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // ================= BALANCE =================
              const Text("Current balance",
                  style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 6),
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(text: "₦", style: TextStyle(color: Colors.grey)),
                    TextSpan(text: "674,981"),
                    TextSpan(
                        text: ".65",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.normal)),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              // ================= ACTION BUTTONS =================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _actionButton(
                    icon: SolarIconsOutline.addCircle,
                    label: "Top-up",
                    filled: true,
                  ),
                  _actionButton(
                    icon: SolarIconsOutline.plain,
                    label: "Send",
                  ),
                  _actionButton(
                    icon: SolarIconsOutline.wallet,
                    label: "Portfolio",
                  ),
                  _actionButton(
                    icon: SolarIconsOutline.menuDots,
                    label: "More",
                  ),
                ],
              ),

              const SizedBox(height: 28),

              // ================= SHORTCUTS =================
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Shortcuts",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _shortcutItem(SolarIconsOutline.bus, "Transport"),
                        _shortcutItem(
                            SolarIconsOutline.translation, "Internet"),
                        _shortcutItem(SolarIconsOutline.tv, "TV"),
                        _shortcutItem(
                            SolarIconsOutline.lightbulb, "Electricity"),
                        _shortcutItem(SolarIconsOutline.football, "Bet"),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // ================= TRANSACTIONS =================
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Recent transactions",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("See all",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),

              const SizedBox(height: 16),

              _transactionTile(
                icon: SolarIconsOutline.plain,
                title: "Transfer to Daniel",
                time: "Today | 9:45am",
                amount: "- ₦10,000",
              ),

              _transactionTile(
                icon: SolarIconsOutline.addCircle,
                title: "Deposit from Racheal",
                time: "Today | 6:23am",
                amount: "+ ₦60,000",
              ),
            ],
          ),
        ),
      ),

      // ================= BOTTOM NAV =================
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(40),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 14),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(SolarIconsOutline.home, color: Colors.white54),
            Icon(SolarIconsOutline.widget_5, color: Colors.white54),
            Icon(SolarIconsOutline.moneyBag, color: Colors.white54),
            Icon(SolarIconsOutline.card, color: Colors.white54),
            Icon(SolarIconsOutline.user, color: Colors.white54),
          ],
        ),
      ),
    );
  }

  // ================= HELPERS =================

  Widget _actionButton({
    required IconData icon,
    required String label,
    bool filled = false,
  }) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 40,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 230, 225, 225),
            borderRadius: BorderRadius.circular(18),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 247, 242, 242),
                blurRadius: 16,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Icon(
            icon,
            color: filled ? Colors.black : Colors.black,
            size: 26,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _shortcutItem(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 22,
          backgroundColor: const Color(0xFFF1F1F1),
          child: Icon(icon, color: Colors.black),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _transactionTile({
    required IconData icon,
    required String title,
    required String time,
    required String amount,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: Colors.black,
            child: Icon(icon, color: Colors.white, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(time, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          Text(amount, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
