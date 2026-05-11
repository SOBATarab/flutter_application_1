import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const ManualBrewApp());
}

class ManualBrewApp extends StatelessWidget {
  const ManualBrewApp({super.key});

  @override
  Widget build(BuildContext context) {
    const espresso = Color(0xFF3D2417);
    const sage = Color(0xFF5E7C62);
    const paper = Color(0xFFF7F0E6);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Manual Brew',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: sage,
          brightness: Brightness.light,
          primary: espresso,
          secondary: sage,
          surface: paper,
        ),
        scaffoldBackgroundColor: paper,
        textTheme: Typography.blackMountainView.apply(
          bodyColor: espresso,
          displayColor: espresso,
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
  final List<BrewRecipe> userRecipes = [];
  late BrewRecipe selectedRecipe = recipes.first;

  List<BrewRecipe> get allRecipes => [...userRecipes, ...recipes];

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.sizeOf(context).width >= 760;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 18, 20, 8),
                child: _Header(recipeCount: allRecipes.length),
              ),
            ),
            SliverToBoxAdapter(
              child: isWide
                  ? Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _RecipeList(
                              recipes: allRecipes,
                              selectedRecipe: selectedRecipe,
                              onSelected: _selectRecipe,
                              onAddRecipe: _showAddRecipeForm,
                            ),
                          ),
                          const SizedBox(width: 18),
                          Expanded(child: RecipeDetail(recipe: selectedRecipe)),
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _RecipeList(
                            recipes: allRecipes,
                            selectedRecipe: selectedRecipe,
                            onSelected: _selectRecipe,
                            onAddRecipe: _showAddRecipeForm,
                          ),
                          const SizedBox(height: 18),
                          RecipeDetail(recipe: selectedRecipe),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void _selectRecipe(BrewRecipe recipe) {
    setState(() {
      selectedRecipe = recipe;
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
      userRecipes.insert(0, recipe);
      selectedRecipe = recipe;
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
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0xFF3D2417),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.coffee, color: Color(0xFFF7F0E6)),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Manual Brew',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
                  ),
                  Text('Resep kopi rumahan yang mudah diulang'),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),
        Wrap(
          spacing: 8,
          runSpacing: 8,
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
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE1D5C6)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 17, color: const Color(0xFF5E7C62)),
          const SizedBox(width: 6),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w700)),
        ],
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
  });

  final List<BrewRecipe> recipes;
  final BrewRecipe selectedRecipe;
  final ValueChanged<BrewRecipe> onSelected;
  final VoidCallback onAddRecipe;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Pilih resep',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
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
        for (final recipe in recipes) ...[
          RecipeCard(
            recipe: recipe,
            isSelected: recipe == selectedRecipe,
            onTap: () => onSelected(recipe),
          ),
          const SizedBox(height: 10),
        ],
      ],
    );
  }
}

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    super.key,
    required this.recipe,
    required this.isSelected,
    required this.onTap,
  });

  final BrewRecipe recipe;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected ? const Color(0xFFFFF8EA) : Colors.white,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected
                  ? const Color(0xFFB78045)
                  : const Color(0xFFE1D5C6),
              width: isSelected ? 1.4 : 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      recipe.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Icon(
                    isSelected ? Icons.check_circle : Icons.chevron_right,
                    color: isSelected
                        ? const Color(0xFF5E7C62)
                        : const Color(0xFF9E8F7E),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                recipe.flavorProfile,
                style: const TextStyle(color: Color(0xFF685B4E)),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _MiniTag(recipe.method),
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
        color: const Color(0xFFEAF1E8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
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
        Text(
          recipe.name,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 6),
        Text(
          recipe.description,
          style: const TextStyle(color: Color(0xFF685B4E), height: 1.4),
        ),
        const SizedBox(height: 16),
        _RecipeSpecs(recipe: recipe),
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE1D5C6)),
      ),
      child: Row(
        children: [
          Icon(data.icon, color: const Color(0xFF5E7C62)),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data.label,
                  style: const TextStyle(fontSize: 12, color: Color(0xFF685B4E)),
                ),
                Text(
                  data.value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w800),
                ),
              ],
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
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
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
            style: const TextStyle(color: Color(0xFF685B4E)),
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
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.w900),
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
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 4),
          Text(
            currentStep.instruction,
            style: const TextStyle(color: Color(0xFF685B4E), height: 1.35),
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
                      color: const Color(0xFFEAF1E8),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      _formatTime(step.startSecond),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          step.title,
                          style: const TextStyle(fontWeight: FontWeight.w800),
                        ),
                        Text(
                          step.instruction,
                          style: const TextStyle(
                            color: Color(0xFF685B4E),
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
                    color: Color(0xFF5E7C62),
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE1D5C6)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: const Color(0xFF5E7C62)),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
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
  final nameController = TextEditingController();
  final methodController = TextEditingController(text: 'V60');
  final descriptionController = TextEditingController();
  final coffeeController = TextEditingController(text: '18');
  final ratioController = TextEditingController(text: '15');
  final temperatureController = TextEditingController(text: '92');
  final grindController = TextEditingController(text: 'Medium fine');
  final flavorController = TextEditingController();

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
                style: TextStyle(color: Color(0xFF685B4E), height: 1.35),
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
  final List<BrewStep> steps;
  final List<String> tips;

  String get ratioLabel => '1:${ratio.toStringAsFixed(0)}';
  String get totalTimeLabel => '${totalTimeSeconds ~/ 60} menit';
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
