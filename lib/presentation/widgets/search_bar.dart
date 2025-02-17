import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
    required this.isSeachVisible,
  });

  final bool isSeachVisible;

  @override
  Widget build(BuildContext context) {
    final scaffoldBackground = Theme.of(context).scaffoldBackgroundColor;

    final widtScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;

    return SizedBox(
      height: heightScreen * .065,
      width: widtScreen * .9,
      child: AnimatedOpacity(
        opacity: isSeachVisible ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 500), // Duración de la animación
        child: SearchBar(
          enabled: isSeachVisible,
          hintText: 'Buscar animes',
          hintStyle: WidgetStatePropertyAll(
            TextStyle(
              color: isSeachVisible
                  ? const Color(0xFF0B2A58)
                  : const Color(0x000166D9),
            ),
          ),
          backgroundColor: isSeachVisible
              ? const WidgetStatePropertyAll(Colors.white)
              : WidgetStatePropertyAll(scaffoldBackground),
        ),
      ),
    );
  }
}
