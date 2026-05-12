import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BrewColors {
  static const ink = Color(0xFFF7EFE5);
  static const muted = Color(0xFFC1B4A8);
  static const cream = Color(0xFFFAF2E8);
  static const surface = Color(0xFF181310);
  static const surfaceHigh = Color(0xFF211A16);
  static const line = Color(0xFF3A3029);
  static const sage = Color(0xFFA8B79B);
  static const sageSoft = Color(0xFF2C382A);
  static const caramel = Color(0xFFD89A5B);
  static const roast = Color(0xFF0F0B09);
  static const danger = Color(0xFFE39A87);
  static const warm = Color(0xFF241B16);
  static const goldSoft = Color(0xFFE6C99B);
  static const photo = Color(0xFF2A211C);
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
      title: 'Manual Brew',
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

  List<String> get methodFilters {
    final methods = allRecipes.map((recipe) => recipe.method).toSet().toList()
      ..sort();
    return ['Semua', ...methods];
  }

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
    final isWide = MediaQuery.sizeOf(context).width >= 760;

    return Scaffold(
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
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 18, 20, 8),
                  child: _Header(recipeCount: allRecipes.length),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 4),
                  child: _BrewFocusCard(recipe: selectedRecipe),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 2),
                  child: _MethodFilterBar(
                    methods: methodFilters,
                    selectedMethod: selectedMethod,
                    onSelected: _selectMethod,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: isWide
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: _RecipeList(
                                recipes: visibleRecipes,
                                selectedRecipe: selectedRecipe,
                                onSelected: _selectRecipe,
                                onAddRecipe: _showAddRecipeForm,
                                onDeleteRecipe: _confirmDeleteRecipe,
                              ),
                            ),
                            const SizedBox(width: 18),
                            Expanded(
                              child: _SelectedRecipeDetail(
                                recipe: selectedRecipe,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _RecipeList(
                              recipes: visibleRecipes,
                              selectedRecipe: selectedRecipe,
                              onSelected: _selectRecipe,
                              onAddRecipe: _showAddRecipeForm,
                              onDeleteRecipe: _confirmDeleteRecipe,
                            ),
                            const SizedBox(height: 18),
                            _SelectedRecipeDetail(recipe: selectedRecipe),
                          ],
                        ),
                      ),
              ),
            ],
          ),
        ),
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
  const _Header({required this.recipeCount});

  final int recipeCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: BrewColors.roast,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x1A4B3329),
                    blurRadius: 18,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
              child: const Icon(Icons.coffee, color: BrewColors.cream),
            ),
            const SizedBox(width: 14),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Manual Brew',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Resep kopi yang tenang, rapi, dan mudah diulang',
                    style: TextStyle(color: BrewColors.muted),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            _StatPill(icon: Icons.local_cafe, label: '$recipeCount resep'),
            const _StatPill(icon: Icons.timer, label: 'Timer langkah'),
            const _StatPill(icon: Icons.scale, label: 'Kalkulator rasio'),
          ],
        ),
      ],
    );
  }
}

class _StatPill extends StatelessWidget {
  const _StatPill({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: BrewColors.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: BrewColors.line),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 17, color: BrewColors.sage),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              color: BrewColors.ink,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _BrewFocusCard extends StatelessWidget {
  const _BrewFocusCard({required this.recipe});

  final BrewRecipe? recipe;

  @override
  Widget build(BuildContext context) {
    final selectedRecipe = recipe;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
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
          ? const Text(
              'Tambahkan resep untuk mulai menyusun brew plan.',
              style: TextStyle(color: BrewColors.cream, height: 1.35),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _RecipePhotoFrame(
                  label: selectedRecipe.photoHint,
                  imagePath: selectedRecipe.photoPath,
                  height: 118,
                ),
                const SizedBox(height: 14),
                const Text(
                  'Brew plan',
                  style: TextStyle(
                    color: Color(0xCCFAF7F1),
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  selectedRecipe.name,
                  style: const TextStyle(
                    color: BrewColors.cream,
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0,
                  ),
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
                      label: '${selectedRecipe.temperatureCelsius} C',
                    ),
                    _FocusMetric(
                      icon: Icons.grain,
                      label: selectedRecipe.grindSize,
                    ),
                  ],
                ),
              ],
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
    this.height = 150,
    this.compact = false,
  });

  final String label;
  final String? imagePath;
  final double height;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final resolvedImagePath = imagePath?.trim();
    final hasImage = resolvedImagePath != null && resolvedImagePath.isNotEmpty;
    final imageFile = hasImage ? XFile(resolvedImagePath) : null;

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
          else
            Positioned.fill(
              child: _PhotoPlaceholder(label: label, compact: compact),
            ),
          if (hasImage)
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

class _MethodFilterBar extends StatelessWidget {
  const _MethodFilterBar({
    required this.methods,
    required this.selectedMethod,
    required this.onSelected,
  });

  final List<String> methods;
  final String selectedMethod;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (final method in methods) ...[
            _MethodFilterChip(
              label: method,
              isSelected: method == selectedMethod,
              onTap: () => onSelected(method),
            ),
            const SizedBox(width: 8),
          ],
        ],
      ),
    );
  }
}

class _MethodFilterChip extends StatelessWidget {
  const _MethodFilterChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected ? BrewColors.roast : BrewColors.surface,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? BrewColors.roast : BrewColors.line,
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? BrewColors.cream : BrewColors.ink,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}

class _RecipeList extends StatelessWidget {
  const _RecipeList({
    required this.recipes,
    required this.selectedRecipe,
    required this.onSelected,
    required this.onAddRecipe,
    required this.onDeleteRecipe,
  });

  final List<BrewRecipe> recipes;
  final BrewRecipe? selectedRecipe;
  final ValueChanged<BrewRecipe> onSelected;
  final VoidCallback onAddRecipe;
  final ValueChanged<BrewRecipe> onDeleteRecipe;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                'Resep tersedia',
                style: TextStyle(
                  color: BrewColors.ink,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Text(
              '${recipes.length} item',
              style: const TextStyle(
                color: BrewColors.muted,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: FilledButton.icon(
            onPressed: onAddRecipe,
            icon: const Icon(Icons.add),
            label: const Text('Tambah resep'),
          ),
        ),
        const SizedBox(height: 10),
        if (recipes.isEmpty)
          const _EmptyRecipeList()
        else
          for (final recipe in recipes) ...[
            RecipeCard(
              recipe: recipe,
              isSelected: recipe == selectedRecipe,
              onTap: () => onSelected(recipe),
              onDelete: () => onDeleteRecipe(recipe),
            ),
            const SizedBox(height: 10),
          ],
      ],
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

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    super.key,
    required this.recipe,
    required this.isSelected,
    required this.onTap,
    required this.onDelete,
  });

  final BrewRecipe recipe;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected ? BrewColors.warm : BrewColors.surface,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.fromLTRB(14, 14, 10, 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? BrewColors.caramel : BrewColors.line,
              width: isSelected ? 1.3 : 1,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0F241915),
                blurRadius: 18,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _RecipePhotoFrame(
                label: recipe.photoHint,
                imagePath: recipe.photoPath,
                height: 88,
                compact: true,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      recipe.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                  Icon(
                    isSelected ? Icons.check_circle : Icons.chevron_right,
                    color: isSelected ? BrewColors.sage : BrewColors.muted,
                  ),
                  const SizedBox(width: 4),
                  IconButton(
                    onPressed: onDelete,
                    icon: const Icon(Icons.delete_outline),
                    tooltip: 'Hapus ${recipe.name}',
                    color: BrewColors.danger,
                    visualDensity: VisualDensity.compact,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                recipe.flavorProfile,
                style: const TextStyle(color: BrewColors.muted, height: 1.35),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _MiniTag(recipe.method),
                  _MiniTag(recipe.beanProfile.variety),
                  _MiniTag(recipe.ratioLabel),
                  _MiniTag(recipe.totalTimeLabel),
                  _MiniTag(recipe.difficulty),
                ],
              ),
            ],
          ),
        ),
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
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: BrewColors.warm,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: BrewColors.line),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _RecipePhotoFrame(
            label: recipe.photoHint,
            imagePath: recipe.photoPath,
            height: 180,
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: BrewColors.goldSoft,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.coffee,
                  color: BrewColors.roast,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  recipe.name,
                  style: const TextStyle(
                    color: BrewColors.ink,
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            recipe.description,
            style: const TextStyle(color: BrewColors.muted, height: 1.45),
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _MiniTag(recipe.beanProfile.process),
              _MiniTag(recipe.beanProfile.roastLevel),
              _MiniTag(recipe.beanProfile.origin),
            ],
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
    name: 'V60 Balanced Daily Cup',
    method: 'V60',
    description:
        'Resep harian yang seimbang untuk sweetness, acidity ringan, dan finish bersih.',
    difficulty: 'Mudah',
    ratio: 15,
    coffeeGrams: 18,
    waterGrams: 270,
    temperatureCelsius: 92,
    grindSize: 'Medium fine',
    totalTimeSeconds: 180,
    flavorProfile: 'Sweet, clean, citrus ringan',
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
    name: 'Kalita Sweet Cup',
    method: 'Kalita',
    description:
        'Cup yang manis dan stabil dengan aliran lebih forgiving untuk pagi hari.',
    difficulty: 'Mudah',
    ratio: 16,
    coffeeGrams: 20,
    waterGrams: 320,
    temperatureCelsius: 93,
    grindSize: 'Medium',
    totalTimeSeconds: 210,
    flavorProfile: 'Caramel, round, soft acidity',
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
    name: 'AeroPress Quick Morning',
    method: 'AeroPress',
    description:
        'Resep cepat untuk cup pekat, manis, dan mudah dibuat sebelum berangkat.',
    difficulty: 'Cepat',
    ratio: 14,
    coffeeGrams: 16,
    waterGrams: 224,
    temperatureCelsius: 88,
    grindSize: 'Medium fine',
    totalTimeSeconds: 120,
    flavorProfile: 'Bold, sweet, low bitterness',
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
