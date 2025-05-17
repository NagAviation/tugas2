import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppConstants {
  static const Duration kDefaultAnimationDuration = Duration(milliseconds: 500);
  static const Duration kCardAnimationStaggerDelay = Duration(milliseconds: 100);

  static const double kScreenPaddingHorizontal = 16.0;
  static const double kScreenPaddingVertical = 20.0;
  static const double kCardVerticalMargin = 8.0;
  static const double kCardHorizontalMargin = 4.0;
  static const double kSectionSpacing = 24.0;
  static const double kItemSpacing = 16.0;
  static const double kSmallSpacing = 8.0;

  static const double kCardBorderRadius = 16.0;
  static const double kImageBorderRadius = 18.0;
  static const double kButtonBorderRadius = 10.0;

  static const double kCardElevation = 4.0;
  static const double kPrimaryCardElevation = 5.0;

  static const String headerImageUrl = 'https://images.pexels.com/photos/1004584/pexels-photo-1004584.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';

  static const String appVersion = '1.2.1';
}

class FeatureItemData {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color? iconColor;
  final String featureKey;

  const FeatureItemData({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.iconColor,
    required this.featureKey,
  });
}

class AppTheme {
  static ThemeData get lightTheme {
    final baseTheme = ThemeData.light();

    return baseTheme.copyWith(
      primaryColor: Colors.indigo[700],
      primaryColorDark: Colors.indigo[900],
      primaryColorLight: Colors.indigo[400],
      scaffoldBackgroundColor: Colors.grey[100],

      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.indigo,
        brightness: Brightness.light,
      ).copyWith(
        secondary: Colors.amberAccent[400],
        surface: Colors.white,
        onSurface: Colors.grey[850],
        background: Colors.grey[100],
        onBackground: Colors.grey[850],
        error: Colors.redAccent[700],
        onError: Colors.white,
        primary: Colors.indigo[700],
        onPrimary: Colors.white,
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: Colors.indigo[700],
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        actionsIconTheme: const IconThemeData(color: Colors.white, size: 26),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto',
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),

      cardTheme: CardTheme(
        elevation: AppConstants.kCardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.kCardBorderRadius),
        ),
        margin: const EdgeInsets.symmetric(
          vertical: AppConstants.kCardVerticalMargin,
          horizontal: AppConstants.kCardHorizontalMargin,
        ),
        color: Colors.white,
      ),

      textTheme: baseTheme.textTheme.copyWith(
        titleLarge: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.grey[850], letterSpacing: 0.5),
        titleMedium: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.grey[800], letterSpacing: 0.4),
        bodyLarge: TextStyle(fontSize: 16.0, color: Colors.grey[700], height: 1.5, letterSpacing: 0.3),
        bodyMedium: TextStyle(fontSize: 14.0, color: Colors.grey[600], height: 1.4, letterSpacing: 0.2),
        labelLarge: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 0.5),
        bodySmall: TextStyle(fontSize: 12.0, color: Colors.grey[500], letterSpacing: 0.1),
        displaySmall: TextStyle(fontSize: 13.0, color: Colors.grey[500], fontWeight: FontWeight.w500),
      ).apply(
        fontFamily: 'Roboto',
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.indigo[600],
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.kButtonBorderRadius),
          ),
          textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, fontFamily: 'Roboto'),
        ),
      ),

      snackBarTheme: SnackBarThemeData(
        backgroundColor: Colors.indigo[800],
        contentTextStyle: const TextStyle(color: Colors.white, fontFamily: 'Roboto'),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 6.0,
      ),

      dividerTheme: DividerThemeData(
        color: Colors.grey[300],
        thickness: 0.8,
        space: AppConstants.kItemSpacing * 1.5,
      ),

      iconTheme: IconThemeData(
        color: Colors.indigo[600],
        size: 24.0,
      ),
    );
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.grey[50],
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nagaleya Airways',
      theme: AppTheme.lightTheme,
      home: const InfoScreen(),
    );
  }
}

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late List<Animation<Offset>> _slideAnimations;

  final List<FeatureItemData> _featureItems = [
    FeatureItemData(
      icon: Icons.flight_takeoff_outlined,
      title: 'Cek Status Penerbangan',
      subtitle: 'Lacak penerbangan Anda secara real-time',
      iconColor: Colors.blueAccent[700],
      featureKey: 'Status Penerbangan',
    ),
    FeatureItemData(
      icon: Icons.airplane_ticket_outlined,
      title: 'Pesan Tiket',
      subtitle: 'Rencanakan perjalanan Anda berikutnya',
      iconColor: Colors.greenAccent[700],
      featureKey: 'Pesan Tiket',
    ),
    FeatureItemData(
      icon: Icons.person_pin_outlined,
      title: 'Profil Saya',
      subtitle: 'Kelola informasi dan preferensi akun',
      iconColor: Colors.orangeAccent[700],
      featureKey: 'Profil Saya',
    ),
    FeatureItemData(
      icon: Icons.support_agent_rounded,
      title: 'Bantuan & Dukungan',
      subtitle: 'Hubungi layanan pelanggan kami',
      iconColor: Colors.purpleAccent[400],
      featureKey: 'Bantuan & Dukungan',
    ),
  ];

  late final int _animatedItemCount;

  @override
  void initState() {
    super.initState();
    _animatedItemCount = 1 + _featureItems.length;

    _animationController = AnimationController(
      vsync: this,
      duration: AppConstants.kDefaultAnimationDuration + (AppConstants.kCardAnimationStaggerDelay * _animatedItemCount),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: const Interval(0.0, 0.5, curve: Curves.easeIn)),
    );

    _slideAnimations = List.generate(_animatedItemCount, (index) {
      return Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Interval(
            0.3 + (index * 0.1),
            (0.3 + (index * 0.1) + 0.4).clamp(0.0, 1.0),
            curve: Curves.easeOutCubic,
          ),
        ),
      );
    });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _showFeatureSnackbar(String featureName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Fitur $featureName akan segera hadir!'),
        margin: const EdgeInsets.all(AppConstants.kScreenPaddingHorizontal),
      ),
    );
  }
  
  void _showAppBarActionSnackbar(String actionName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Aksi "$actionName" diklik!'),
        margin: const EdgeInsets.all(AppConstants.kScreenPaddingHorizontal),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu_rounded),
          tooltip: 'Menu Utama',
          onPressed: () {
            _showAppBarActionSnackbar('Menu');
          },
        ),
        title: const Text('Nagaleya Airways'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [theme.primaryColorDark, theme.primaryColorLight],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle_outlined),
            tooltip: 'Profil Pengguna',
            onPressed: () {
              _showAppBarActionSnackbar('Profil');
            },
          ),
          const SizedBox(width: AppConstants.kSmallSpacing),
        ],
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.kScreenPaddingHorizontal,
            vertical: AppConstants.kScreenPaddingVertical,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const HeaderImageWidget(),
              const SizedBox(height: AppConstants.kSectionSpacing * 0.8),
              const NagAviationTitleWidget(),
              const SizedBox(height: AppConstants.kSectionSpacing),

              AnimatedListItem(animation: _slideAnimations[0], child: const UserInfoCardWidget()),
              const SizedBox(height: AppConstants.kItemSpacing),

              Padding(
                padding: const EdgeInsets.only(left: AppConstants.kSmallSpacing, bottom: AppConstants.kSmallSpacing, top: AppConstants.kSmallSpacing),
                child: Text(
                  "Menu Utama",
                  style: theme.textTheme.titleMedium?.copyWith(color: theme.primaryColorDark, fontWeight: FontWeight.bold),
                ),
              ),

              ..._featureItems.asMap().entries.map((entry) {
                int idx = entry.key;
                FeatureItemData item = entry.value;
                int animationIndex = idx + 1;
                if (animationIndex >= _slideAnimations.length) {
                    return const SizedBox.shrink(); 
                }

                return AnimatedListItem(
                  animation: _slideAnimations[animationIndex],
                  child: FeatureCardWidget(
                    icon: item.icon,
                    title: item.title,
                    subtitle: item.subtitle,
                    iconColor: item.iconColor,
                    onTap: () => _showFeatureSnackbar(item.featureKey),
                  ),
                );
              }).toList(),

              const SizedBox(height: AppConstants.kSectionSpacing * 1.2),
              const FooterWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedListItem extends StatelessWidget {
  final Animation<Offset> animation;
  final Widget child;

  const AnimatedListItem({
    super.key,
    required this.animation,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation,
      child: child,
    );
  }
}

class HeaderImageWidget extends StatelessWidget {
  const HeaderImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 230,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstants.kImageBorderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppConstants.kImageBorderRadius),
        child: Image.network(
          AppConstants.headerImageUrl,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Container(
              color: theme.colorScheme.surface.withOpacity(0.8),
              child: Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                      : null,
                  strokeWidth: 3.0,
                  color: theme.primaryColor,
                ),
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return Container(
              decoration: BoxDecoration(
                color: theme.colorScheme.surface.withOpacity(0.5),
                borderRadius: BorderRadius.circular(AppConstants.kImageBorderRadius),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.signal_wifi_off_outlined, size: 60, color: theme.colorScheme.onSurface.withOpacity(0.5)),
                  const SizedBox(height: AppConstants.kSmallSpacing),
                  Text('Gagal memuat gambar', style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface.withOpacity(0.7))),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class NagAviationTitleWidget extends StatelessWidget {
  const NagAviationTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onBackground),
        children: <TextSpan>[
          const TextSpan(text: 'by '),
          TextSpan(
            text: 'NagAviation ',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: theme.primaryColorDark,
            ),
          ),
          const TextSpan(
            text: 'group',
              style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

class UserInfoCardWidget extends StatelessWidget {
  const UserInfoCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: AppConstants.kPrimaryCardElevation,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.kScreenPaddingHorizontal * 0.8,
          vertical: AppConstants.kScreenPaddingVertical * 0.9,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Informasi Pengguna',
              style: theme.textTheme.titleLarge?.copyWith(color: theme.primaryColor, letterSpacing: 0.2),
            ),
            const SizedBox(height: AppConstants.kItemSpacing * 1.2),
            _InfoRow(icon: Icons.person_pin_circle_outlined, label: 'Nama', value: 'Muhammad Yusuf'),
            const _CustomDivider(),
            _InfoRow(icon: Icons.assignment_ind_outlined, label: 'NIM', value: '60200122021'),
            const _CustomDivider(),
            _InfoRow(icon: Icons.school_outlined, label: 'Kelas', value: 'F'),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppConstants.kSmallSpacing * 1.2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: theme.primaryColor, size: 26),
          const SizedBox(width: AppConstants.kItemSpacing * 0.8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: theme.textTheme.displaySmall),
                const SizedBox(height: AppConstants.kSmallSpacing * 0.5),
                Text(value, style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider();

  @override
  Widget build(BuildContext context) {
    return const Divider(indent: 40, endIndent: 10);
  }
}

class FeatureCardWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color? iconColor;
  final VoidCallback onTap;

  const FeatureCardWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveIconColor = iconColor ?? theme.primaryColor;

    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppConstants.kCardBorderRadius),
        splashColor: effectiveIconColor.withOpacity(0.1),
        highlightColor: effectiveIconColor.withOpacity(0.05),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppConstants.kItemSpacing, vertical: AppConstants.kItemSpacing * 1.2),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppConstants.kSmallSpacing * 1.2),
                decoration: BoxDecoration(
                  color: effectiveIconColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(AppConstants.kCardBorderRadius * 0.75),
                ),
                child: Icon(icon, color: effectiveIconColor, size: 28),
              ),
              const SizedBox(width: AppConstants.kItemSpacing),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: theme.textTheme.titleMedium?.copyWith(fontSize: 17)),
                    const SizedBox(height: AppConstants.kSmallSpacing * 0.6),
                    Text(subtitle, style: theme.textTheme.bodyMedium?.copyWith(fontSize: 13.5, color: theme.colorScheme.onSurface.withOpacity(0.7))),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey[400], size: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: AppConstants.kItemSpacing, bottom: AppConstants.kSmallSpacing),
      child: Column(
        children: [
          const Divider(),
          const SizedBox(height: AppConstants.kSmallSpacing),
          Text(
            '© ${DateTime.now().year} Nagaleya Airways by NagAviation',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodySmall,
          ),
          const SizedBox(height: AppConstants.kSmallSpacing * 0.5),
          Text(
            'Versi Aplikasi ${AppConstants.appVersion}',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodySmall?.copyWith(fontSize: 10),
          ),
        ],
      ),
    );
  }
}
