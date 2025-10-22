import '../home/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNext();
  }

  Future<void> _navigateToNext() async {
    await Future.delayed(const Duration(seconds: 3));

    if (mounted) {
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF8B3A3A),
      body: Stack(
        children: [
          // Blue rectangle (top left)
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: 170,
              height: 120,
              color: const Color(0xFF1E5A7D),
            ),
          ),

          // Yellow circle (speech bubble effect)
          Positioned(
            top: -50,
            right: -50,
            child: Container(
              width: 230,
              height: 230,
              decoration: const BoxDecoration(
                color: Color(0xFFFDB827),
                shape: BoxShape.circle,
              ),
            ),
          ),

          // Small tail for speech bubble
          Positioned(
            top: 140,
            right: 150,
            child: CustomPaint(
              size: const Size(30, 30),
              painter: BubbleTailPainter(),
            ),
          ),

          // Logo
          const Center(
            child: AppLogo(
              fontSize: 48,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

// Small triangle for bubble tail
class BubbleTailPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFDB827)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width * 0.5, size.height)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}