import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'login_page.dart';

class BrewColors {
  static const ink = Color(0xFFEDE1D0);
  static const muted = Color(0xFFD4C5AB);
  static const cream = Color(0xFFFFE2AB);
  static const surface = Color(0xFF201B11);
  static const surfaceHigh = Color(0xFF2F291E);
  static const line = Color(0xFF504532);
  static const sage = Color(0xFFA8B79B);
  static const sageSoft = Color(0xFF2C382A);
  static const caramel = Color(0xFFEABDA0);
  static const roast = Color(0xFF181309);
  static const danger = Color(0xFFFFB4AB);
  static const warm = Color(0xFF241F14);
  static const goldSoft = Color(0xFFFFE2AB);
  static const amber = Color(0xFFFFBF00);
  static const secondaryContainer = Color(0xFF61422C);
  static const photo = Color(0xFF3A3428);
}

class BrewImages {
  static const heroV60 =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuAka3GyFI32vji-UtgJYbEoqifoqaGjClV4gudaQHXoWMSmwXG3ilRe_ijkbTH6mZQQvjkjZw5iHrpOB4OOwE2gSfWp9Kqze2ACK-iAKGP33mmCAgPtkWUCUGkR3KXLOx8U1_I9Dh6O8avLM-QUTYsEk2QpFTvLIiCWLccVpPOsYlWSWsYOL2k8xuFRxclYMb3MqjYkzWsHna_i6n2l1SZishjizezDqdxanQWAjNDYnliyvTOP9w_C5w63VdyUw-vdw2O5BMRMGfI';
  static const chemex =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuBzhzk4u-JY_FnLei65vA9JxwmmoE2R6RVIdnKexNCCe5GGXqAeSh4NX442XyTlpo9egdDXo_O5oBOzfllrrf-kmpU-WJP_0DAuQDwpfxsgdoJSnGsPZ8i-vmz6p2CCZJIVo1T2b_jwqrv5rH6fzl0X8iCFKXGoVeOO9wM8QGK_G694Sz5N0WH8w9zD1BD6sju673NCCToznhkZg-itCx2p_ofV161dEb2qRpao1g4yEzu1QJ-C6ioXIA4zfdsUvDU1itPkgWl5ZaI';
  static const aeroPress =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuASn7QwGAyaANRnHdo9pkrQfeZ9znSDKGQSHAA1ERWcmuWSkCI1sVOAAhMhTzBGSNfIqgvFAn1EYhnO-PNWXp4pZl9xYL5zWs4UUhc0gOxbl7FfhbVqtShjvyZ2Vw1w5MSs8rxsU2NLsOouzGZtwHTRHnVG_3i967yyMPO5_9MQTZIH0FNozcF9v1i2z69kvtfWDblBib2UyvlD_X9VAcj20PPAgXxqb_6-i8-vJjVCzRVavZ59wvHnPu49DX9HDA85RUTnpqFEpu4';
  static const frenchPress =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuB2D0LiSK3rD-6xUh_TuF5Q4lAa02eO2umzkjZ8GJzYMDiwEHC1aT6vgipp0qlVKu_9f5zHliKC56gra2cTuYLBGC6u8gNitFAYQKbe_jFDys1aOXdnJOl_v2Xtec9Ut5bn6nPvADilw396welfuZms7Wumtx2hgwEyR7SG7bdtUuacgsgNypAnmFNr9Frc_COiOtE37opCZ5KeuAq9wfcUSWLyeIQvWmFysrumlpwZO_ttqUDbcgdL2N45Q5N-HckIizLnp5jJ6xI';
  static const profile =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuBgwrY-ejgIylUzRtvgahJzuVepwgzr6IXzWlXOgWK-bopUBO9kmwA3snnlKwexsIf_kmBcwRVmz4NIVPPr-n1u1r1YWljYSR7NF5SVSkkAoDoXqlutCqJ8VnxK1Y6ISkRw4wSeNnMK7lB9OEJ4AxJUZt0u8-rS0-Jv4X17TBTQ4uqpMu6BSi-EFiERbsBbr-He6RzTwwgsh7p7dCAthSH44JJLLQnoccGHwX7_AKzhqK13oak5RAWAweMXdjCBwVNhwSUj4ey5BHE';
}

void main() {
  runApp(const ManualBrewApp());
}

class ManualBrewApp extends StatelessWidget {
  const ManualBrewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Artisan Brew',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: BrewColors.sage,
          brightness: Brightness.dark,
          primary: BrewColors.goldSoft,
          secondary: BrewColors.sage,
          surface: BrewColors.surface,
        ),
        scaffoldBackgroundColor: BrewColors.roast,
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: BrewColors.goldSoft,
            foregroundColor: BrewColors.roast,
            minimumSize: const Size(0, 46),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: BrewColors.ink,
            side: const BorderSide(color: BrewColors.line),
            minimumSize: const Size(0, 46),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: BrewColors.surfaceHigh,
          prefixIconColor: BrewColors.sage,
          labelStyle: const TextStyle(color: BrewColors.muted),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: BrewColors.line),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: BrewColors.line),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: BrewColors.sage, width: 1.4),
          ),
        ),
        textTheme: Typography.blackMountainView.apply(
          bodyColor: BrewColors.ink,
          displayColor: BrewColors.ink,
        ),
      ),
      home: const RecipeHomePage(),
    );
  }
}

class RecipeHomePage extends StatefulWidget {
  const RecipeHomePage({super.key});

  @override
  State<RecipeHomePage> createState() => _RecipeHomePageState();
}

class _RecipeHomePageState extends State<RecipeHomePage> {
  final List<BrewRecipe> allRecipes = List.of(recipes);
  BrewRecipe? selectedRecipe;
  String selectedMethod = 'Semua';
  int activeTab = 0;

  List<BrewRecipe> get visibleRecipes {
    if (selectedMethod == 'Semua') {
      return allRecipes;
    }

    return allRecipes
        .where((recipe) => recipe.method == selectedMethod)
        .toList();
  }

  @override
  void initState() {
    super.initState();
    selectedRecipe = allRecipes.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: activeTab == 1
          ? null
          : FloatingActionButton(
              onPressed: _showAddRecipeForm,
              backgroundColor: BrewColors.goldSoft,
              foregroundColor: BrewColors.roast,
              shape: const CircleBorder(),
              child: const Icon(Icons.add),
            ),
      bottomNavigationBar: _ArtisanBottomNav(
        activeIndex: activeTab,
        onSelected: (index) => setState(() => activeTab = index),
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF090706),
              Color(0xFF15100D),
              Color(0xFF211813),
            ],
          ),
        ),
        child: CustomPaint(
          painter: _DotGridPainter(),
          child: SafeArea(
            child: CustomScrollView(
              slivers: _tabSlivers(),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _tabSlivers() {
    return switch (activeTab) {
      1 => [
          _contentSliver(
            const EdgeInsets.fromLTRB(20, 18, 20, 24),
            _SelectedRecipeDetail(recipe: selectedRecipe),
          ),
        ],
      2 => [
          _contentSliver(
            const EdgeInsets.fromLTRB(20, 18, 20, 24),
            _CollectionView(
              recipes: allRecipes,
              selectedRecipe: selectedRecipe,
              onSelected: _openBrew,
              onAddRecipe: _showAddRecipeForm,
              onDeleteRecipe: _confirmDeleteRecipe,
              onBookmark: (recipe) {
                _selectRecipe(recipe);
                _showMessage('${recipe.name} disimpan ke koleksi.');
              },
            ),
          ),
        ],
      3 => [
          _contentSliver(
            const EdgeInsets.fromLTRB(20, 18, 20, 24),
            _ProfileView(
              recipeCount: allRecipes.length,
              onMenuSelected: _showMessage,
              onSettings: _showSettingsOptions,
              onLogin: _openLogin,
            ),
          ),
        ],
      _ => [
          _contentSliver(
            const EdgeInsets.fromLTRB(20, 18, 20, 6),
            _Header(
              onSettings: _showSettingsOptions,
            ),
          ),
          _contentSliver(
            const EdgeInsets.fromLTRB(20, 0, 20, 6),
            _WelcomeCopy(recipeCount: allRecipes.length),
          ),
          _contentSliver(
            const EdgeInsets.fromLTRB(20, 10, 20, 2),
            _BrewFocusCard(
              recipe: selectedRecipe,
              onStartBrew: () => _openBrew(selectedRecipe),
            ),
          ),
          _contentSliver(
            const EdgeInsets.fromLTRB(20, 18, 20, 4),
            _BrewMethodsSection(
              recipes: allRecipes,
              selectedMethod: selectedMethod,
              onSelected: _selectMethod,
              onViewAll: _openCollection,
            ),
          ),
          _contentSliver(
            const EdgeInsets.fromLTRB(20, 14, 20, 24),
            _LatestRecipesSection(
              recipes: visibleRecipes,
              selectedRecipe: selectedRecipe,
              onSelected: _openBrew,
              onAddRecipe: _showAddRecipeForm,
              onBookmark: (recipe) {
                _selectRecipe(recipe);
                _showMessage('${recipe.name} disimpan ke koleksi.');
              },
            ),
          ),
        ],
    };
  }

  SliverToBoxAdapter _contentSliver(EdgeInsets padding, Widget child) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }

  void _selectRecipe(BrewRecipe recipe) {
    setState(() {
      selectedRecipe = recipe;
    });
  }

  void _selectMethod(String method) {
    setState(() {
      selectedMethod = method;
      final filteredRecipes = visibleRecipes;
      if (!filteredRecipes.contains(selectedRecipe)) {
        selectedRecipe = filteredRecipes.isEmpty ? null : filteredRecipes.first;
      }
    });
  }

  void _openBrew(BrewRecipe? recipe) {
    if (recipe == null) {
      _showMessage('Tambahkan resep dulu untuk mulai seduh.');
      return;
    }

    setState(() {
      selectedRecipe = recipe;
      activeTab = 1;
    });
  }

  void _openCollection() {
    setState(() {
      selectedMethod = 'Semua';
      activeTab = 2;
    });
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _showSettingsOptions() async {
    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Pilih settings'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _SettingsChoice(
              icon: Icons.dark_mode_outlined,
              title: 'Tema gelap',
              subtitle: 'Tema gelap sudah aktif untuk app ini.',
              onTap: () => _closeDialogWithMessage(
                context,
                'Tema gelap sudah digunakan.',
              ),
            ),
            _SettingsChoice(
              icon: Icons.timer_outlined,
              title: 'Pengingat seduh',
              subtitle: 'Aktifkan nanti untuk timer dan ritual brew.',
              onTap: () => _closeDialogWithMessage(
                context,
                'Pengingat seduh siap ditambahkan.',
              ),
            ),
            _SettingsChoice(
              icon: Icons.cloud_sync_outlined,
              title: 'Backup resep',
              subtitle: 'Saran: sinkronkan resep ke akun setelah login.',
              onTap: () => _closeDialogWithMessage(
                context,
                'Backup resep cocok dibuat setelah fitur akun aktif.',
              ),
            ),
            _SettingsChoice(
              icon: Icons.login,
              title: 'Login akun',
              subtitle: 'Masuk untuk menyimpan resep dan profil.',
              onTap: () {
                Navigator.of(context).pop();
                _openLogin();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _closeDialogWithMessage(BuildContext dialogContext, String message) {
    Navigator.of(dialogContext).pop();
    _showMessage(message);
  }

  Future<void> _openLogin() async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => const LoginPage(),
      ),
    );
  }

  Future<void> _showAddRecipeForm() async {
    final recipe = await showModalBottomSheet<BrewRecipe>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) => const AddRecipeSheet(),
    );

    if (recipe == null) {
      return;
    }

    setState(() {
      allRecipes.insert(0, recipe);
      selectedMethod = 'Semua';
      selectedRecipe = recipe;
    });
  }

  Future<void> _confirmDeleteRecipe(BrewRecipe recipe) async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus resep?'),
        content: Text('Resep "${recipe.name}" akan dihapus dari daftar.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Batal'),
          ),
          FilledButton.icon(
            onPressed: () => Navigator.of(context).pop(true),
            icon: const Icon(Icons.delete),
            label: const Text('Hapus'),
          ),
        ],
      ),
    );

    if (shouldDelete != true) {
      return;
    }

    setState(() {
      allRecipes.remove(recipe);
      if (selectedRecipe == recipe) {
        final filteredRecipes = visibleRecipes;
        selectedRecipe = filteredRecipes.isEmpty ? null : filteredRecipes.first;
      }
    });
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.onSettings,
  });

  final VoidCallback onSettings;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: BrewColors.goldSoft,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.local_cafe,
            color: BrewColors.roast,
            size: 18,
          ),
        ),
        const SizedBox(width: 10),
        const Expanded(
          child: Text(
            'Artisan Brew',
            style: TextStyle(
              color: BrewColors.cream,
              fontSize: 18,
              fontWeight: FontWeight.w900,
              letterSpacing: 0,
            ),
          ),
        ),
        _HeaderIcon(
          icon: Icons.settings_outlined,
          tooltip: 'Settings',
          onTap: onSettings,
        ),
      ],
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon({
    required this.icon,
    required this.tooltip,
    required this.onTap,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: BrewColors.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: BrewColors.line),
          ),
          child: Icon(icon, color: BrewColors.muted, size: 18),
        ),
      ),
    );
  }
}

class _SettingsChoice extends StatelessWidget {
  const _SettingsChoice({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: BrewColors.goldSoft),
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: onTap,
    );
  }
}

class _WelcomeCopy extends StatelessWidget {
  const _WelcomeCopy({required this.recipeCount});

  final int recipeCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'WELCOME BACK',
            style: TextStyle(
              color: BrewColors.goldSoft,
              fontSize: 11,
              fontWeight: FontWeight.w900,
              letterSpacing: 0,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Selamat Pagi,\nCoffee Lover',
            style: TextStyle(
              color: BrewColors.cream,
              fontSize: 28,
              height: 1.05,
              fontWeight: FontWeight.w900,
              letterSpacing: 0,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              _TinyStatus(icon: Icons.menu_book, label: '$recipeCount resep'),
              const SizedBox(width: 8),
              const _TinyStatus(icon: Icons.timer, label: 'Brew ritual'),
            ],
          ),
        ],
      ),
    );
  }
}

class _TinyStatus extends StatelessWidget {
  const _TinyStatus({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
      decoration: BoxDecoration(
        color: BrewColors.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: BrewColors.line),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: BrewColors.goldSoft, size: 14),
          const SizedBox(width: 5),
          Text(
            label,
            style: const TextStyle(
              color: BrewColors.muted,
              fontSize: 11,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

class _DotGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0x1FFFFFFF)
      ..style = PaintingStyle.fill;

    const spacing = 22.0;
    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), 1.15, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _ArtisanBottomNav extends StatelessWidget {
  const _ArtisanBottomNav({
    required this.activeIndex,
    required this.onSelected,
  });

  final int activeIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        height: 72,
        margin: EdgeInsets.zero,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: const Color(0xFF120E05),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
          border: Border.all(color: BrewColors.line),
          boxShadow: const [
            BoxShadow(
              color: Color(0x66000000),
              blurRadius: 22,
              offset: Offset(0, 12),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _NavItem(
              icon: Icons.explore_outlined,
              label: 'Beranda',
              active: activeIndex == 0,
              onTap: () => onSelected(0),
            ),
            _NavItem(
              icon: Icons.timer_outlined,
              label: 'Brew',
              active: activeIndex == 1,
              onTap: () => onSelected(1),
            ),
            _NavItem(
              icon: Icons.collections_bookmark_outlined,
              label: 'Koleksi',
              active: activeIndex == 2,
              onTap: () => onSelected(2),
            ),
            _NavItem(
              icon: Icons.person_outline,
              label: 'Profil',
              active: activeIndex == 3,
              onTap: () => onSelected(3),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.active = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final color = active ? BrewColors.goldSoft : BrewColors.muted;
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: active ? const Color(0xFF3A2A1C) : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color, size: 18),
              const SizedBox(height: 3),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: color,
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BrewFocusCard extends StatelessWidget {
  const _BrewFocusCard({
    required this.recipe,
    required this.onStartBrew,
  });

  final BrewRecipe? recipe;
  final VoidCallback onStartBrew;

  @override
  Widget build(BuildContext context) {
    final selectedRecipe = recipe;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: BrewColors.roast,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0x1AFFFFFF)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1F241915),
            blurRadius: 28,
            offset: Offset(0, 14),
          ),
        ],
      ),
      child: selectedRecipe == null
          ? const Padding(
              padding: EdgeInsets.all(18),
              child: Text(
                'Tambahkan resep untuk mulai menyusun brew plan.',
                style: TextStyle(color: BrewColors.cream, height: 1.35),
              ),
            )
          : ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Stack(
                children: [
                  _RecipePhotoFrame(
                    label: selectedRecipe.photoHint,
                    imagePath: selectedRecipe.photoPath,
                    imageUrl: selectedRecipe.photoUrl,
                    height: 320,
                  ),
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withValues(alpha: 0.02),
                            Colors.black.withValues(alpha: 0.72),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 16,
                    right: 16,
                    bottom: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const _HeroBadge(label: 'FEATURED RECIPE'),
                        const SizedBox(height: 10),
                        Text(
                          selectedRecipe.name,
                          style: const TextStyle(
                            color: BrewColors.cream,
                            fontFamily: 'Playfair Display',
                            fontSize: 32,
                            height: 1.1,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          selectedRecipe.flavorProfile,
                          style: const TextStyle(
                            color: BrewColors.muted,
                            height: 1.35,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            _FocusMetric(
                              icon: Icons.coffee_maker,
                              label: selectedRecipe.method,
                            ),
                            _FocusMetric(
                              icon: Icons.scale,
                              label: selectedRecipe.ratioLabel,
                            ),
                            _FocusMetric(
                              icon: Icons.thermostat,
                              label:
                                  '${selectedRecipe.temperatureCelsius} C',
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        SizedBox(
                          width: 148,
                          child: FilledButton(
                            onPressed: onStartBrew,
                            child: const Text('Start Brew'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class _HeroBadge extends StatelessWidget {
  const _HeroBadge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(
        color: BrewColors.goldSoft,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: BrewColors.roast,
          fontSize: 10,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}

class _FocusMetric extends StatelessWidget {
  const _FocusMetric({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0x1AFFFFFF),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0x24FFFFFF)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: BrewColors.goldSoft),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              color: BrewColors.cream,
              fontSize: 12,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

class _RecipePhotoFrame extends StatelessWidget {
  const _RecipePhotoFrame({
    required this.label,
    this.imagePath,
    this.imageUrl,
    this.height = 150,
    this.compact = false,
  });

  final String label;
  final String? imagePath;
  final String? imageUrl;
  final double height;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final resolvedImagePath = imagePath?.trim();
    final hasImage = resolvedImagePath != null && resolvedImagePath.isNotEmpty;
    final imageFile = hasImage ? XFile(resolvedImagePath) : null;
    final resolvedImageUrl = imageUrl?.trim();
    final hasNetworkImage =
        resolvedImageUrl != null && resolvedImageUrl.isNotEmpty;

    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: BrewColors.photo,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: BrewColors.line),
      ),
      child: Stack(
        children: [
          if (hasImage)
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: FutureBuilder<Uint8List>(
                  future: imageFile!.readAsBytes(),
                  builder: (context, snapshot) {
                    final bytes = snapshot.data;
                    if (bytes == null) {
                      return _PhotoPlaceholder(label: label, compact: compact);
                    }

                    return Image.memory(
                      bytes,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return _PhotoPlaceholder(
                          label: label,
                          compact: compact,
                        );
                      },
                    );
                  },
                ),
              ),
            )
          else if (hasNetworkImage)
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  resolvedImageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return _PhotoPlaceholder(label: label, compact: compact);
                  },
                ),
              ),
            )
          else
            Positioned.fill(
              child: _PhotoPlaceholder(label: label, compact: compact),
            ),
          if (hasImage || hasNetworkImage)
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0x00000000),
                      Color(0x66000000),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _PhotoPlaceholder extends StatelessWidget {
  const _PhotoPlaceholder({
    required this.label,
    required this.compact,
  });

  final String label;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF37251B),
            Color(0xFF18110D),
            Color(0xFF2C382A),
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.add_photo_alternate_outlined,
              color: BrewColors.goldSoft,
              size: compact ? 24 : 34,
            ),
            SizedBox(height: compact ? 4 : 8),
            Text(
              compact ? 'Foto' : label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: BrewColors.cream,
                fontSize: compact ? 12 : 14,
                fontWeight: FontWeight.w900,
              ),
            ),
            if (!compact) ...[
              const SizedBox(height: 4),
              const Text(
                'Tambahkan foto sendiri',
                style: TextStyle(
                  color: BrewColors.muted,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _BrewMethodsSection extends StatelessWidget {
  const _BrewMethodsSection({
    required this.recipes,
    required this.selectedMethod,
    required this.onSelected,
    required this.onViewAll,
  });

  final List<BrewRecipe> recipes;
  final String selectedMethod;
  final ValueChanged<String> onSelected;
  final VoidCallback onViewAll;

  @override
  Widget build(BuildContext context) {
    final methods = recipes.map((recipe) => recipe.method).toSet().toList()
      ..sort();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                'Brew Methods',
                style: TextStyle(
                  color: BrewColors.ink,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            TextButton(
              onPressed: onViewAll,
              child: const Text('View all'),
            ),
          ],
        ),
        const SizedBox(height: 10),
        GridView.builder(
          itemCount: methods.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 154,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final method = methods[index];
            final isSelected = selectedMethod == method;
            final count = recipes
                .where((recipe) => recipe.method == method)
                .length;

            return Material(
              color: isSelected ? const Color(0xFF3A2A1C) : BrewColors.surface,
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () => onSelected(method),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isSelected ? BrewColors.goldSoft : BrewColors.line,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Center(
                          child: Icon(
                            _methodIcon(method),
                            color: BrewColors.goldSoft,
                            size: 42,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            method,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: BrewColors.ink,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            '$count resep',
                            style: const TextStyle(
                              color: BrewColors.muted,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  IconData _methodIcon(String method) {
    final lower = method.toLowerCase();
    if (lower.contains('aero')) {
      return Icons.compress;
    }
    if (lower.contains('kalita')) {
      return Icons.filter_alt_outlined;
    }
    if (lower.contains('v60')) {
      return Icons.coffee_maker_outlined;
    }

    return Icons.local_cafe_outlined;
  }
}

class _LatestRecipesSection extends StatelessWidget {
  const _LatestRecipesSection({
    required this.recipes,
    required this.selectedRecipe,
    required this.onSelected,
    required this.onAddRecipe,
    required this.onBookmark,
  });

  final List<BrewRecipe> recipes;
  final BrewRecipe? selectedRecipe;
  final ValueChanged<BrewRecipe> onSelected;
  final VoidCallback onAddRecipe;
  final ValueChanged<BrewRecipe> onBookmark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                'Resep Terbaru',
                style: TextStyle(
                  color: BrewColors.ink,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            IconButton.filled(
              onPressed: onAddRecipe,
              icon: const Icon(Icons.add),
              tooltip: 'Tambah resep',
              style: IconButton.styleFrom(
                backgroundColor: BrewColors.goldSoft,
                foregroundColor: BrewColors.roast,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 324,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: recipes.length,
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final recipe = recipes[index];
              return _LatestRecipeCard(
                recipe: recipe,
                isSelected: recipe == selectedRecipe,
                onTap: () => onSelected(recipe),
                onBookmark: () => onBookmark(recipe),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _LatestRecipeCard extends StatelessWidget {
  const _LatestRecipeCard({
    required this.recipe,
    required this.isSelected,
    required this.onTap,
    required this.onBookmark,
  });

  final BrewRecipe recipe;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback onBookmark;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260,
      child: Material(
        color: isSelected ? BrewColors.warm : BrewColors.surface,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isSelected ? BrewColors.goldSoft : BrewColors.line,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _RecipePhotoFrame(
                  label: recipe.photoHint,
                  imagePath: recipe.photoPath,
                  imageUrl: recipe.photoUrl,
                  height: 160,
                  compact: true,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          recipe.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: BrewColors.cream,
                            fontFamily: 'Playfair Display',
                            fontSize: 20,
                            height: 1.15,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            _MicroMeta(
                              icon: Icons.speed,
                              label: recipe.difficulty,
                            ),
                            const SizedBox(width: 12),
                            _MicroMeta(
                              icon: Icons.timer_outlined,
                              label: recipe.totalTimeLabel,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          child: Text(
                            recipe.flavorProfile,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: BrewColors.muted,
                              fontSize: 13,
                              height: 1.3,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              'Resep Expert',
                              style: TextStyle(
                                color: BrewColors.goldSoft,
                                fontSize: 12,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: onBookmark,
                              icon: Icon(
                                isSelected
                                    ? Icons.bookmark
                                    : Icons.bookmark_border,
                              ),
                              color: BrewColors.goldSoft,
                              visualDensity: VisualDensity.compact,
                              tooltip: 'Simpan ${recipe.name}',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MicroMeta extends StatelessWidget {
  const _MicroMeta({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: BrewColors.muted, size: 13),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(
            color: BrewColors.muted,
            fontSize: 11,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _CollectionView extends StatelessWidget {
  const _CollectionView({
    required this.recipes,
    required this.selectedRecipe,
    required this.onSelected,
    required this.onAddRecipe,
    required this.onDeleteRecipe,
    required this.onBookmark,
  });

  final List<BrewRecipe> recipes;
  final BrewRecipe? selectedRecipe;
  final ValueChanged<BrewRecipe> onSelected;
  final VoidCallback onAddRecipe;
  final ValueChanged<BrewRecipe> onDeleteRecipe;
  final ValueChanged<BrewRecipe> onBookmark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _ScreenTitle(
          title: 'Koleksi Saya',
          subtitle: 'Resep manual brew favorit dan catatan seduh.',
          icon: Icons.collections_bookmark_outlined,
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: FilledButton.icon(
            onPressed: onAddRecipe,
            icon: const Icon(Icons.add),
            label: const Text('Tambah resep'),
          ),
        ),
        const SizedBox(height: 14),
        if (recipes.isEmpty)
          const _EmptyRecipeList()
        else
          for (final recipe in recipes) ...[
            _CollectionRecipeTile(
              recipe: recipe,
              isSelected: recipe == selectedRecipe,
              onTap: () => onSelected(recipe),
              onDelete: () => onDeleteRecipe(recipe),
              onBookmark: () => onBookmark(recipe),
            ),
            const SizedBox(height: 12),
          ],
      ],
    );
  }
}

class _CollectionRecipeTile extends StatelessWidget {
  const _CollectionRecipeTile({
    required this.recipe,
    required this.isSelected,
    required this.onTap,
    required this.onDelete,
    required this.onBookmark,
  });

  final BrewRecipe recipe;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback onDelete;
  final VoidCallback onBookmark;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected ? BrewColors.warm : BrewColors.surface,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? BrewColors.goldSoft : BrewColors.line,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _RecipePhotoFrame(
                label: recipe.photoHint,
                imagePath: recipe.photoPath,
                imageUrl: recipe.photoUrl,
                height: 138,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 8, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            recipe.name,
                            style: const TextStyle(
                              color: BrewColors.cream,
                              fontSize: 17,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: onDelete,
                          icon: const Icon(Icons.delete_outline),
                          tooltip: 'Hapus ${recipe.name}',
                          color: BrewColors.danger,
                          visualDensity: VisualDensity.compact,
                        ),
                      ],
                    ),
                    Text(
                      recipe.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: BrewColors.muted,
                        height: 1.35,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        _MicroMeta(
                          icon: Icons.coffee_maker_outlined,
                          label: recipe.method,
                        ),
                        const SizedBox(width: 12),
                        _MicroMeta(
                          icon: Icons.scale,
                          label: recipe.ratioLabel,
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: onBookmark,
                          icon: Icon(
                            isSelected ? Icons.bookmark : Icons.bookmark_border,
                          ),
                          color: BrewColors.goldSoft,
                          visualDensity: VisualDensity.compact,
                          tooltip: 'Simpan ${recipe.name}',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileView extends StatelessWidget {
  const _ProfileView({
    required this.recipeCount,
    required this.onMenuSelected,
    required this.onSettings,
    required this.onLogin,
  });

  final int recipeCount;
  final ValueChanged<String> onMenuSelected;
  final VoidCallback onSettings;
  final VoidCallback onLogin;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _ScreenTitle(
          title: 'Profil Pengguna',
          subtitle: 'Manual brewer dan pencatat ritual kopi.',
          icon: Icons.person_outline,
        ),
        const SizedBox(height: 18),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: BrewColors.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: BrewColors.line),
          ),
          child: Column(
            children: [
              Container(
                width: 86,
                height: 86,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: BrewColors.warm,
                  border: Border.all(color: BrewColors.goldSoft, width: 1.4),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.network(
                  BrewImages.profile,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.person,
                      color: BrewColors.goldSoft,
                      size: 42,
                    );
                  },
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'Andi Seduh',
                style: TextStyle(
                  color: BrewColors.cream,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Master Brewer & Ritualist',
                style: TextStyle(
                  color: BrewColors.goldSoft,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Expanded(
                    child: _ProfileStat(
                      label: 'Total resep',
                      value: '$recipeCount',
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: _ProfileStat(label: 'Koleksi', value: '12'),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        const Text(
          'Metode Favorit',
          style: TextStyle(
            color: BrewColors.ink,
            fontSize: 18,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 10),
        _ProfileMenu(
          icon: Icons.filter_alt_outlined,
          title: 'V60',
          onTap: () => onMenuSelected('Metode V60 dipilih.'),
        ),
        _ProfileMenu(
          icon: Icons.compress,
          title: 'AeroPress',
          onTap: () => onMenuSelected('Metode AeroPress dipilih.'),
        ),
        _ProfileMenu(
          icon: Icons.local_cafe_outlined,
          title: 'Chemex',
          onTap: () => onMenuSelected('Metode Chemex dipilih.'),
        ),
        const SizedBox(height: 12),
        _ProfileMenu(
          icon: Icons.history,
          title: 'Riwayat Seduh',
          onTap: () => onMenuSelected('Riwayat seduh belum ada.'),
        ),
        _ProfileMenu(
          icon: Icons.workspace_premium_outlined,
          title: 'Badge Pencapaian',
          onTap: () => onMenuSelected('Badge pencapaian siap ditambahkan.'),
        ),
        _ProfileMenu(
          icon: Icons.settings_outlined,
          title: 'Settings',
          onTap: onSettings,
        ),
        _ProfileMenu(
          icon: Icons.login,
          title: 'Login',
          onTap: onLogin,
        ),
      ],
    );
  }
}

class _ScreenTitle extends StatelessWidget {
  const _ScreenTitle({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  final String title;
  final String subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: BrewColors.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: BrewColors.line),
          ),
          child: Icon(icon, color: BrewColors.goldSoft),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: BrewColors.cream,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                subtitle,
                style: const TextStyle(color: BrewColors.muted, height: 1.35),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProfileStat extends StatelessWidget {
  const _ProfileStat({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
      decoration: BoxDecoration(
        color: BrewColors.warm,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: BrewColors.line),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              color: BrewColors.goldSoft,
              fontSize: 24,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: BrewColors.muted,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileMenu extends StatelessWidget {
  const _ProfileMenu({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: BrewColors.surface,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: BrewColors.line),
            ),
            child: Row(
              children: [
                Icon(icon, color: BrewColors.goldSoft, size: 18),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: BrewColors.ink,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const Icon(
                  Icons.chevron_right,
                  color: BrewColors.muted,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EmptyRecipeList extends StatelessWidget {
  const _EmptyRecipeList();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: BrewColors.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: BrewColors.line),
      ),
      child: const Text(
        'Belum ada resep. Tambahkan resep pertama untuk mulai brewing.',
        style: TextStyle(color: BrewColors.muted),
      ),
    );
  }
}

class _MiniTag extends StatelessWidget {
  const _MiniTag(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
      decoration: BoxDecoration(
        color: BrewColors.sageSoft,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: BrewColors.ink,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _SelectedRecipeDetail extends StatelessWidget {
  const _SelectedRecipeDetail({required this.recipe});

  final BrewRecipe? recipe;

  @override
  Widget build(BuildContext context) {
    final selectedRecipe = recipe;
    if (selectedRecipe == null) {
      return const _EmptyRecipeDetail();
    }

    return RecipeDetail(recipe: selectedRecipe);
  }
}

class _EmptyRecipeDetail extends StatelessWidget {
  const _EmptyRecipeDetail();

  @override
  Widget build(BuildContext context) {
    return _Panel(
      title: 'Belum ada resep',
      icon: Icons.menu_book,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Tambahkan resep manual brew baru untuk melihat detail, kalkulator rasio, dan timer seduh.',
            style: TextStyle(color: BrewColors.muted, height: 1.35),
          ),
        ],
      ),
    );
  }
}

class RecipeDetail extends StatelessWidget {
  const RecipeDetail({super.key, required this.recipe});

  final BrewRecipe recipe;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _RecipeHero(recipe: recipe),
        const SizedBox(height: 16),
        _RecipeSpecs(recipe: recipe),
        const SizedBox(height: 16),
        _BeanProfilePanel(profile: recipe.beanProfile),
        const SizedBox(height: 16),
        RatioCalculator(recipe: recipe),
        const SizedBox(height: 16),
        BrewTimer(recipe: recipe),
        const SizedBox(height: 16),
        _StepTimeline(recipe: recipe),
        const SizedBox(height: 16),
        _TroubleshootingTips(tips: recipe.tips),
      ],
    );
  }
}

class _RecipeHero extends StatelessWidget {
  const _RecipeHero({required this.recipe});

  final BrewRecipe recipe;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: BrewColors.warm,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: BrewColors.line),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          _RecipePhotoFrame(
            label: recipe.photoHint,
            imagePath: recipe.photoPath,
            imageUrl: recipe.photoUrl,
            height: 360,
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    BrewColors.roast.withValues(alpha: 0.94),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 22,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _MiniTag(recipe.method),
                    _MiniTag(recipe.beanProfile.roastLevel),
                    _MiniTag(recipe.beanProfile.process),
                  ],
                ),
                const SizedBox(height: 14),
                Text(
                  recipe.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: BrewColors.cream,
                    fontFamily: 'Playfair Display',
                    fontSize: 34,
                    height: 1.05,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  recipe.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: BrewColors.muted,
                    height: 1.45,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RecipeSpecs extends StatelessWidget {
  const _RecipeSpecs({required this.recipe});

  final BrewRecipe recipe;

  @override
  Widget build(BuildContext context) {
    final specs = [
      _SpecData(Icons.coffee_maker, 'Metode', recipe.method),
      _SpecData(Icons.coffee, 'Kopi', '${recipe.coffeeGrams} g'),
      _SpecData(Icons.water_drop, 'Air', '${recipe.waterGrams} g'),
      _SpecData(Icons.thermostat, 'Suhu', '${recipe.temperatureCelsius} C'),
      _SpecData(Icons.grain, 'Grind', recipe.grindSize),
      _SpecData(Icons.av_timer, 'Waktu', recipe.totalTimeLabel),
    ];

    return GridView.builder(
      itemCount: specs.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 180,
        mainAxisExtent: 76,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => _SpecTile(data: specs[index]),
    );
  }
}

class _SpecData {
  const _SpecData(this.icon, this.label, this.value);

  final IconData icon;
  final String label;
  final String value;
}

class _SpecTile extends StatelessWidget {
  const _SpecTile({required this.data});

  final _SpecData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: BrewColors.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: BrewColors.line),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: BrewColors.sageSoft,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(data.icon, color: BrewColors.sage, size: 18),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data.label,
                  style: const TextStyle(
                    fontSize: 12,
                    color: BrewColors.muted,
                  ),
                ),
                Text(
                  data.value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: BrewColors.ink,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BeanProfilePanel extends StatelessWidget {
  const _BeanProfilePanel({required this.profile});

  final CoffeeBeanProfile profile;

  @override
  Widget build(BuildContext context) {
    return _Panel(
      title: 'Profil biji kopi',
      icon: Icons.spa,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _MiniTag(profile.variety),
              _MiniTag(profile.process),
              _MiniTag(profile.roastLevel),
              _MiniTag(profile.origin),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            profile.character,
            style: const TextStyle(color: BrewColors.ink, height: 1.4),
          ),
          const SizedBox(height: 12),
          _BeanGuidanceRow(
            icon: Icons.thermostat,
            label: 'Saran suhu',
            value: profile.brewTemperatureHint,
          ),
          _BeanGuidanceRow(
            icon: Icons.grain,
            label: 'Saran grind',
            value: profile.grindHint,
          ),
          _BeanGuidanceRow(
            icon: Icons.water_drop,
            label: 'Saran ekstraksi',
            value: profile.extractionHint,
          ),
        ],
      ),
    );
  }
}

class _BeanGuidanceRow extends StatelessWidget {
  const _BeanGuidanceRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: BrewColors.sage, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  color: BrewColors.muted,
                  height: 1.35,
                ),
                children: [
                  TextSpan(
                    text: '$label: ',
                    style: const TextStyle(
                      color: BrewColors.ink,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  TextSpan(text: value),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RatioCalculator extends StatefulWidget {
  const RatioCalculator({super.key, required this.recipe});

  final BrewRecipe recipe;

  @override
  State<RatioCalculator> createState() => _RatioCalculatorState();
}

class _RatioCalculatorState extends State<RatioCalculator> {
  late double coffeeGrams = widget.recipe.coffeeGrams.toDouble();

  @override
  void didUpdateWidget(covariant RatioCalculator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.recipe != widget.recipe) {
      coffeeGrams = widget.recipe.coffeeGrams.toDouble();
    }
  }

  @override
  Widget build(BuildContext context) {
    final water = coffeeGrams * widget.recipe.ratio;

    return _Panel(
      title: 'Kalkulator rasio',
      icon: Icons.scale,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${coffeeGrams.round()} g kopi -> ${water.round()} g air',
            style: const TextStyle(
              color: BrewColors.ink,
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
          ),
          Slider(
            value: coffeeGrams,
            min: 10,
            max: 35,
            divisions: 25,
            label: '${coffeeGrams.round()} g',
            onChanged: (value) => setState(() => coffeeGrams = value),
          ),
          Text(
            'Rasio ${widget.recipe.ratioLabel}. Geser sesuai dosis kopi yang mau dipakai.',
            style: const TextStyle(color: BrewColors.muted),
          ),
        ],
      ),
    );
  }
}

class BrewTimer extends StatefulWidget {
  const BrewTimer({super.key, required this.recipe});

  final BrewRecipe recipe;

  @override
  State<BrewTimer> createState() => _BrewTimerState();
}

class _BrewTimerState extends State<BrewTimer> {
  Timer? timer;
  int elapsedSeconds = 0;
  bool isRunning = false;

  BrewStep get currentStep {
    return widget.recipe.steps.lastWhere(
      (step) => elapsedSeconds >= step.startSecond,
      orElse: () => widget.recipe.steps.first,
    );
  }

  @override
  void didUpdateWidget(covariant BrewTimer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.recipe != widget.recipe) {
      _reset();
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final total = widget.recipe.totalTimeSeconds;
    final progress = (elapsedSeconds / total).clamp(0.0, 1.0).toDouble();

    return _Panel(
      title: 'Timer brewing',
      icon: Icons.timer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _formatTime(elapsedSeconds),
            style: const TextStyle(
              color: BrewColors.ink,
              fontSize: 38,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 6),
          LinearProgressIndicator(
            value: progress,
            minHeight: 8,
            borderRadius: BorderRadius.circular(8),
          ),
          const SizedBox(height: 12),
          Text(
            currentStep.title,
            style: const TextStyle(
              color: BrewColors.ink,
              fontSize: 17,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            currentStep.instruction,
            style: const TextStyle(color: BrewColors.muted, height: 1.35),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              FilledButton.icon(
                onPressed: isRunning ? _pause : _start,
                icon: Icon(isRunning ? Icons.pause : Icons.play_arrow),
                label: Text(isRunning ? 'Jeda' : 'Mulai'),
              ),
              const SizedBox(width: 10),
              IconButton.outlined(
                onPressed: _reset,
                icon: const Icon(Icons.restart_alt),
                tooltip: 'Reset timer',
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _start() {
    if (isRunning) {
      return;
    }

    setState(() => isRunning = true);
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (elapsedSeconds >= widget.recipe.totalTimeSeconds) {
        _pause();
        return;
      }

      setState(() {
        elapsedSeconds += 1;
      });
    });
  }

  void _pause() {
    timer?.cancel();
    setState(() => isRunning = false);
  }

  void _reset() {
    timer?.cancel();
    setState(() {
      elapsedSeconds = 0;
      isRunning = false;
    });
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }
}

class _StepTimeline extends StatelessWidget {
  const _StepTimeline({required this.recipe});

  final BrewRecipe recipe;

  @override
  Widget build(BuildContext context) {
    return _Panel(
      title: 'Langkah seduh',
      icon: Icons.route,
      child: Column(
        children: [
          for (final step in recipe.steps)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 54,
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    decoration: BoxDecoration(
                      color: BrewColors.sageSoft,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      _formatTime(step.startSecond),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: BrewColors.roast,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          step.title,
                          style: const TextStyle(
                            color: BrewColors.ink,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          step.instruction,
                          style: const TextStyle(
                            color: BrewColors.muted,
                            height: 1.35,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }
}

class _TroubleshootingTips extends StatelessWidget {
  const _TroubleshootingTips({required this.tips});

  final List<String> tips;

  @override
  Widget build(BuildContext context) {
    return _Panel(
      title: 'Koreksi rasa',
      icon: Icons.tips_and_updates,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final tip in tips)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.check_circle,
                    size: 18,
                    color: BrewColors.sage,
                  ),
                  const SizedBox(width: 8),
                  Expanded(child: Text(tip)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _Panel extends StatelessWidget {
  const _Panel({
    required this.title,
    required this.icon,
    required this.child,
  });

  final String title;
  final IconData icon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: BrewColors.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: BrewColors.line),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D241915),
            blurRadius: 22,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: BrewColors.sage),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  color: BrewColors.ink,
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

class AddRecipeSheet extends StatefulWidget {
  const AddRecipeSheet({super.key});

  @override
  State<AddRecipeSheet> createState() => _AddRecipeSheetState();
}

class _AddRecipeSheetState extends State<AddRecipeSheet> {
  final formKey = GlobalKey<FormState>();
  final imagePicker = ImagePicker();
  final nameController = TextEditingController();
  final methodController = TextEditingController(text: 'V60');
  final descriptionController = TextEditingController();
  final coffeeController = TextEditingController(text: '18');
  final ratioController = TextEditingController(text: '15');
  final temperatureController = TextEditingController(text: '92');
  final grindController = TextEditingController(text: 'Medium fine');
  final flavorController = TextEditingController();
  final varietyController = TextEditingController(text: 'Arabica');
  final processController = TextEditingController(text: 'Washed');
  final roastController = TextEditingController(text: 'Medium light');
  final originController = TextEditingController(text: 'Indonesia');
  final beanCharacterController = TextEditingController();
  String? selectedPhotoPath;

  @override
  void dispose() {
    nameController.dispose();
    methodController.dispose();
    descriptionController.dispose();
    coffeeController.dispose();
    ratioController.dispose();
    temperatureController.dispose();
    grindController.dispose();
    flavorController.dispose();
    varietyController.dispose();
    processController.dispose();
    roastController.dispose();
    originController.dispose();
    beanCharacterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, bottomInset + 20),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Tambah resep manual brew',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 6),
              const Text(
                'Isi parameter utama. Aplikasi akan membuat langkah seduh dasar yang bisa dipakai langsung.',
                style: TextStyle(color: BrewColors.muted, height: 1.35),
              ),
              const SizedBox(height: 18),
              _TextInput(
                controller: nameController,
                label: 'Nama resep',
                icon: Icons.local_cafe,
                validator: _requiredValidator,
              ),
              _TextInput(
                controller: methodController,
                label: 'Metode',
                icon: Icons.coffee_maker,
                validator: _requiredValidator,
              ),
              _TextInput(
                controller: descriptionController,
                label: 'Deskripsi',
                icon: Icons.notes,
                maxLines: 2,
                validator: _requiredValidator,
              ),
              Row(
                children: [
                  Expanded(
                    child: _TextInput(
                      controller: coffeeController,
                      label: 'Kopi (g)',
                      icon: Icons.coffee,
                      keyboardType: TextInputType.number,
                      validator: _numberValidator,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _TextInput(
                      controller: ratioController,
                      label: 'Rasio 1:x',
                      icon: Icons.scale,
                      keyboardType: TextInputType.number,
                      validator: _numberValidator,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: _TextInput(
                      controller: temperatureController,
                      label: 'Suhu (C)',
                      icon: Icons.thermostat,
                      keyboardType: TextInputType.number,
                      validator: _numberValidator,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _TextInput(
                      controller: grindController,
                      label: 'Grind size',
                      icon: Icons.grain,
                      validator: _requiredValidator,
                    ),
                  ),
                ],
              ),
              _TextInput(
                controller: flavorController,
                label: 'Profil rasa',
                icon: Icons.spa,
                validator: _requiredValidator,
              ),
              _PhotoPickerField(
                photoPath: selectedPhotoPath,
                onPickPhoto: _pickPhoto,
                onClearPhoto: _clearPhoto,
              ),
              const SizedBox(height: 6),
              const Text(
                'Profil biji kopi',
                style: TextStyle(
                  color: BrewColors.ink,
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: _TextInput(
                      controller: varietyController,
                      label: 'Varietas',
                      icon: Icons.eco,
                      validator: _requiredValidator,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _TextInput(
                      controller: processController,
                      label: 'Proses',
                      icon: Icons.bubble_chart,
                      validator: _requiredValidator,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: _TextInput(
                      controller: roastController,
                      label: 'Roast',
                      icon: Icons.local_fire_department,
                      validator: _requiredValidator,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _TextInput(
                      controller: originController,
                      label: 'Origin',
                      icon: Icons.public,
                      validator: _requiredValidator,
                    ),
                  ),
                ],
              ),
              _TextInput(
                controller: beanCharacterController,
                label: 'Karakter biji',
                icon: Icons.tune,
                maxLines: 2,
                validator: _requiredValidator,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Batal'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: _submit,
                      icon: const Icon(Icons.save),
                      label: const Text('Simpan'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    final coffeeGrams = double.parse(coffeeController.text.trim()).round();
    final ratio = double.parse(ratioController.text.trim());
    final temperature = double.parse(temperatureController.text.trim()).round();
    final waterGrams = (coffeeGrams * ratio).round();
    final method = methodController.text.trim();

    Navigator.of(context).pop(
      BrewRecipe(
        name: nameController.text.trim(),
        method: method,
        description: descriptionController.text.trim(),
        difficulty: 'Custom',
        ratio: ratio,
        coffeeGrams: coffeeGrams,
        waterGrams: waterGrams,
        temperatureCelsius: temperature,
        grindSize: grindController.text.trim(),
        totalTimeSeconds: 180,
        flavorProfile: flavorController.text.trim(),
        photoPath: selectedPhotoPath,
        photoHint:
            'Foto ${methodController.text.trim()} ${nameController.text.trim()}',
        beanProfile: CoffeeBeanProfile(
          variety: varietyController.text.trim(),
          process: processController.text.trim(),
          roastLevel: roastController.text.trim(),
          origin: originController.text.trim(),
          character: beanCharacterController.text.trim(),
          brewTemperatureHint: _temperatureHint(temperature),
          grindHint: _grindHint(grindController.text.trim()),
          extractionHint: _extractionHint(ratio),
        ),
        steps: [
          BrewStep(
            title: 'Bloom',
            instruction:
                'Tuang ${coffeeGrams * 2} g air untuk membasahi semua kopi.',
            startSecond: 0,
          ),
          BrewStep(
            title: 'Pour utama',
            instruction:
                'Tuang perlahan sampai sekitar ${(waterGrams * 0.65).round()} g.',
            startSecond: 40,
          ),
          BrewStep(
            title: 'Final pour',
            instruction: 'Lanjutkan tuang sampai total $waterGrams g.',
            startSecond: 95,
          ),
          const BrewStep(
            title: 'Drawdown',
            instruction: 'Tunggu air turun dan catat hasil rasa setelah selesai.',
            startSecond: 140,
          ),
        ],
        tips: [
          'Jika terlalu asam, coba grind lebih halus atau naikkan suhu.',
          'Jika terlalu pahit, coba grind lebih kasar atau turunkan suhu.',
          'Simpan perubahan kecil satu per satu agar resep mudah diulang.',
        ],
      ),
    );
  }

  String? _requiredValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Wajib diisi';
    }

    return null;
  }

  String? _numberValidator(String? value) {
    final parsedValue = double.tryParse(value?.trim() ?? '');
    if (parsedValue == null || parsedValue <= 0) {
      return 'Masukkan angka';
    }

    return null;
  }

  Future<void> _pickPhoto() async {
    final photo = await imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );

    if (photo == null) {
      return;
    }

    if (!mounted) {
      return;
    }

    setState(() {
      selectedPhotoPath = photo.path;
    });
  }

  void _clearPhoto() {
    setState(() {
      selectedPhotoPath = null;
    });
  }

  String _temperatureHint(int temperature) {
    if (temperature <= 89) {
      return 'Cocok untuk roast lebih gelap atau karakter mudah pahit.';
    }
    if (temperature >= 94) {
      return 'Cocok untuk roast terang agar sweetness dan acidity keluar.';
    }

    return 'Rentang aman untuk cup seimbang dan mudah dikontrol.';
  }

  String _grindHint(String grindSize) {
    final normalized = grindSize.toLowerCase();
    if (normalized.contains('fine')) {
      return 'Grind halus membantu ekstraksi, jaga pouring tetap lembut.';
    }
    if (normalized.contains('coarse')) {
      return 'Grind kasar memberi body bersih, perhatikan agar tidak under.';
    }

    return 'Grind medium cocok untuk resep fleksibel dan konsisten.';
  }

  String _extractionHint(double ratio) {
    if (ratio <= 14) {
      return 'Rasio pekat, cocok untuk body tebal atau bypass setelah seduh.';
    }
    if (ratio >= 17) {
      return 'Rasio lebih ringan, cocok untuk karakter floral dan clean.';
    }

    return 'Rasio seimbang untuk sweetness, clarity, dan body sedang.';
  }
}

class _TextInput extends StatelessWidget {
  const _TextInput({
    required this.controller,
    required this.label,
    required this.icon,
    required this.validator,
    this.keyboardType,
    this.maxLines = 1,
  });

  final TextEditingController controller;
  final String label;
  final IconData icon;
  final String? Function(String?) validator;
  final TextInputType? keyboardType;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        validator: validator,
      ),
    );
  }
}

class _PhotoPickerField extends StatelessWidget {
  const _PhotoPickerField({
    required this.photoPath,
    required this.onPickPhoto,
    required this.onClearPhoto,
  });

  final String? photoPath;
  final VoidCallback onPickPhoto;
  final VoidCallback onClearPhoto;

  @override
  Widget build(BuildContext context) {
    final fileName = photoPath == null ? null : XFile(photoPath!).name;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: BrewColors.surfaceHigh,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: BrewColors.line),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.add_photo_alternate_outlined,
                color: BrewColors.sage,
              ),
              SizedBox(width: 8),
              Text(
                'Foto resep',
                style: TextStyle(
                  color: BrewColors.ink,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            fileName ?? 'Belum ada foto. Pilih gambar JPG/PNG dari galeri.',
            style: const TextStyle(color: BrewColors.muted, height: 1.35),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: FilledButton.icon(
                  onPressed: onPickPhoto,
                  icon: const Icon(Icons.photo_library_outlined),
                  label: const Text('Pilih foto'),
                ),
              ),
              if (photoPath != null) ...[
                const SizedBox(width: 10),
                IconButton.outlined(
                  onPressed: onClearPhoto,
                  icon: const Icon(Icons.close),
                  tooltip: 'Hapus foto',
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class BrewRecipe {
  const BrewRecipe({
    required this.name,
    required this.method,
    required this.description,
    required this.difficulty,
    required this.ratio,
    required this.coffeeGrams,
    required this.waterGrams,
    required this.temperatureCelsius,
    required this.grindSize,
    required this.totalTimeSeconds,
    required this.flavorProfile,
    this.photoPath,
    this.photoUrl,
    required this.photoHint,
    required this.beanProfile,
    required this.steps,
    required this.tips,
  });

  final String name;
  final String method;
  final String description;
  final String difficulty;
  final double ratio;
  final int coffeeGrams;
  final int waterGrams;
  final int temperatureCelsius;
  final String grindSize;
  final int totalTimeSeconds;
  final String flavorProfile;
  final String? photoPath;
  final String? photoUrl;
  final String photoHint;
  final CoffeeBeanProfile beanProfile;
  final List<BrewStep> steps;
  final List<String> tips;

  String get ratioLabel => '1:${ratio.toStringAsFixed(0)}';
  String get totalTimeLabel => '${totalTimeSeconds ~/ 60} menit';
}

class CoffeeBeanProfile {
  const CoffeeBeanProfile({
    required this.variety,
    required this.process,
    required this.roastLevel,
    required this.origin,
    required this.character,
    required this.brewTemperatureHint,
    required this.grindHint,
    required this.extractionHint,
  });

  final String variety;
  final String process;
  final String roastLevel;
  final String origin;
  final String character;
  final String brewTemperatureHint;
  final String grindHint;
  final String extractionHint;
}

class BrewStep {
  const BrewStep({
    required this.title,
    required this.instruction,
    required this.startSecond,
  });

  final String title;
  final String instruction;
  final int startSecond;
}

const recipes = [
  BrewRecipe(
    name: 'Classic V60 Ethiopia',
    method: 'V60',
    description:
        'A vibrant and floral profile, featuring notes of bergamot and jasmine, characteristic of high-altitude Ethiopian beans.',
    difficulty: 'Light',
    ratio: 15,
    coffeeGrams: 20,
    waterGrams: 300,
    temperatureCelsius: 92,
    grindSize: 'Medium',
    totalTimeSeconds: 180,
    flavorProfile: 'Bright floral notes, citrus acidity, jasmine finish',
    photoUrl: BrewImages.heroV60,
    photoHint: 'Foto V60 pour over',
    beanProfile: CoffeeBeanProfile(
      variety: 'Typica / Bourbon',
      process: 'Washed',
      roastLevel: 'Medium light',
      origin: 'Indonesia',
      character:
          'Acidity cerah, sweetness tebu, body medium, dan finish bersih.',
      brewTemperatureHint:
          'Gunakan 91-93 C untuk menjaga acidity tetap hidup tanpa pahit.',
      grindHint: 'Medium fine agar ekstraksi cukup tanpa drawdown terlalu lama.',
      extractionHint:
          'Pour bertahap dan lembut membantu clarity pada biji washed.',
    ),
    steps: [
      BrewStep(
        title: 'Bloom',
        instruction: 'Tuang 45 g air, basahi semua kopi, lalu tunggu.',
        startSecond: 0,
      ),
      BrewStep(
        title: 'Pour pertama',
        instruction: 'Tuang pelan melingkar sampai total 150 g.',
        startSecond: 35,
      ),
      BrewStep(
        title: 'Pour kedua',
        instruction: 'Lanjutkan tuang sampai total 270 g.',
        startSecond: 75,
      ),
      BrewStep(
        title: 'Drawdown',
        instruction: 'Biarkan air turun sampai bed kopi terlihat rata.',
        startSecond: 125,
      ),
    ],
    tips: [
      'Jika terlalu asam, pakai grind sedikit lebih halus.',
      'Jika terlalu pahit, turunkan suhu 1-2 C atau kasar sedikit.',
    ],
  ),
  BrewRecipe(
    name: 'Sunset Bloom Kenya',
    method: 'Chemex',
    description:
        'Bright, berry-forward profile with a clean finish using the Chemex method.',
    difficulty: 'Light',
    ratio: 16,
    coffeeGrams: 20,
    waterGrams: 320,
    temperatureCelsius: 93,
    grindSize: 'Medium',
    totalTimeSeconds: 300,
    flavorProfile: 'Bright berry, clean finish, elegant sweetness',
    photoUrl: BrewImages.chemex,
    photoHint: 'Foto Kalita dripper',
    beanProfile: CoffeeBeanProfile(
      variety: 'Caturra / Catuai',
      process: 'Honey',
      roastLevel: 'Medium',
      origin: 'Central America',
      character:
          'Manis karamel, acidity lembut, body bulat, dan tekstur nyaman.',
      brewTemperatureHint:
          'Gunakan 92-94 C untuk membuka sweetness honey process.',
      grindHint: 'Medium agar aliran stabil dan sweetness tetap tebal.',
      extractionHint:
          'Pulse pouring pendek membantu cup lebih manis dan tidak flat.',
    ),
    steps: [
      BrewStep(
        title: 'Bloom',
        instruction: 'Tuang 50 g air dan swirl ringan.',
        startSecond: 0,
      ),
      BrewStep(
        title: 'Pulse 1',
        instruction: 'Tuang sampai 160 g dengan aliran stabil.',
        startSecond: 40,
      ),
      BrewStep(
        title: 'Pulse 2',
        instruction: 'Tuang sampai 240 g, jaga slurry tetap rendah.',
        startSecond: 95,
      ),
      BrewStep(
        title: 'Final pour',
        instruction: 'Selesaikan sampai 320 g dan tunggu drawdown.',
        startSecond: 145,
      ),
    ],
    tips: [
      'Jika cup terasa flat, naikkan suhu air sedikit.',
      'Jika body terlalu berat, kurangi agitasi saat menuang.',
    ],
  ),
  BrewRecipe(
    name: 'Midnight Bold Brazil',
    method: 'AeroPress',
    description:
        'A heavy-bodied, nutty experience perfect for those who love intense flavors.',
    difficulty: 'Dark',
    ratio: 14,
    coffeeGrams: 16,
    waterGrams: 224,
    temperatureCelsius: 88,
    grindSize: 'Medium fine',
    totalTimeSeconds: 180,
    flavorProfile: 'Nutty, bold, heavy body',
    photoUrl: BrewImages.aeroPress,
    photoHint: 'Foto AeroPress brew',
    beanProfile: CoffeeBeanProfile(
      variety: 'Heirloom / Mixed cultivar',
      process: 'Natural',
      roastLevel: 'Medium dark',
      origin: 'Ethiopia / Blend',
      character:
          'Aroma buah matang, body tebal, sweetness tinggi, dan acidity rendah.',
      brewTemperatureHint:
          'Gunakan 86-89 C agar natural process tidak terlalu pahit.',
      grindHint: 'Medium fine untuk cup pekat tanpa rasa kasar.',
      extractionHint:
          'Steep singkat dan press pelan menjaga sweetness tetap bersih.',
    ),
    steps: [
      BrewStep(
        title: 'Isi chamber',
        instruction: 'Masukkan kopi dan 80 g air, aduk 5 kali.',
        startSecond: 0,
      ),
      BrewStep(
        title: 'Tambah air',
        instruction: 'Tambah air sampai 224 g, pasang plunger.',
        startSecond: 25,
      ),
      BrewStep(
        title: 'Steep',
        instruction: 'Diamkan agar ekstraksi lebih manis.',
        startSecond: 45,
      ),
      BrewStep(
        title: 'Press',
        instruction: 'Tekan pelan selama 25-30 detik.',
        startSecond: 90,
      ),
    ],
    tips: [
      'Jika terlalu pekat, bypass dengan 30-50 g air panas.',
      'Jika pahit, tekan lebih pelan dan gunakan suhu lebih rendah.',
    ],
  ),
];
