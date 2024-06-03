# Lab03 - Łączenie ASM z C i optymalizacja

Prowadzący: [dr inż. Dominik Żelazny](https://wit.pwr.edu.pl/wydzial/struktura-organizacyjna/pracownicy/dominik-zelazny)

## Treść

Zadania do wykonania:

1. Napisać kod w asemblerze pozwalający używać funkcji napisanych w języku C i operujących na różnych argumentach stałoprzecinkowych i zmiennoprzecinkowych. Należy wziąć pod uwagę zarówno funkcje biblioteczne, jak i funkcje utworzone własnoręcznie.
2. Napisać zestaw funkcji w asemblerze umożliwiających ich użycie z poziomu języka C. Funkcje te powinny operować na argumentach różnych typów i zwracać wartości różnych typów.
3. Napisać w języku C zestaw funkcji wykonujących operacje na dużych (o rozmiarze liczonym w MB lub dziesiątkach MB) tablicach jedno­ i dwuwymiarowych. Na podstawie pomiarów czasu wykonania oraz analizy kodu asemblerowego powstałego podczas kompilacji zlokalizować najbardziej czasochłonne fragmenty programu i odpowiednio je modyfikując zmniejszyć czas wykonania programu. Do pomiaru czasu wykonania programu należy wykorzystać zarówno odpowiednie narzędzia (np. gprof), jak i mechanizmy wbudowane w procesor (ang. Time Stamp Counter).
4. *Napisać kod pozwalający na używanie zmiennych i stałych zdefiniowanych w C z poziomu asemblera i zdefiniowanych w asemblerze z poziomu C.

