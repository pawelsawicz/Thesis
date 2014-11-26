[1mdiff --git a/Documentation/Thesis.docx b/Documentation/Thesis.docx[m
[1mindex 41dd9aa..d6874fd 100644[m
[1m--- a/Documentation/Thesis.docx[m
[1m+++ b/Documentation/Thesis.docx[m
[36m@@ -109,10 +109,23 @@[m [mAsd[m
 Asdasd[m
 2.6 Charakterystyki użytych języków[m
 2.6.1 Język R[m
[31m-Język ten jest dość mocno abstrakcyjny dzięki czemu możemy w bardzo szybki oraz przystępny sposób za prototypować nasz algorytm. Posiada bardzo wielką bazę zewnętrznych pakietów które umożliwiają nam na skupieniu się implementacji naszego algorytmu.[m
[31m-„R" jest darmowym językiem wydanym na licencji GNU PL, dlatego też zdecydowa [m
[32m+[m[32mJęzyk ten jest dość mocno abstrakcyjny dzięki czemu możemy w bardzo szybki oraz przystępny sposób stworzyć prototyp naszego algorytmu. Środowisko oosiada bardzo wielką bazę zewnętrznych pakietów (np. gotowe sieci neuronowe), jest to dość fajne ponieważ możemy się skupić na implementacji naszego algorytmu.[m
[32m+[m[32m„R" jest darmowym językiem wydanym na licencji GNU PL, dlatego też jest to jeden z czynników dla czego wybrałem tę język. Dodatkowo język ten jest używamy głównie do celów LISTNUM  statystycznych, został mi on polecony przez jednego współpracownika.[m[41m [m
 2.6.2 Język Haskell[m
[31m-asdasd[m
[32m+[m[32mHaskell jest z rodzimy języków funkcyjnych, sam haskell jest językiem czysto funkcyjnym. Haskell jest intensywnie rozwijany przy Uniwersytecie Glasgow najbardziej popularnym kompilatorem jest GHC (Glasgow Haskell Compilator).[m
[32m+[m[32mNajbardziej charakterystyczne cechy tego języka to :[m
[32m+[m[32m* Lazy evaluetion[m
[32m+[m[32m* Monady[m
[32m+[m[32m* Statyczny polimorfizm[m
[32m+[m[32m* Typeclass[m
[32m+[m[32m* Guards[m
[32m+[m[32m* Curried functions & partial functions[m
[32m+[m[32mGłówną różnicą pomiędzy językiem funkcyjnym a imperatywnym jest formowanie problemu oraz zapis. W języku imperatywnym nasza funkcja posiada kilka kroków do wykonania i może zmieniać swój stan w zależności jakie zmienne przyjmiemy w implementacji , kiedy w języku funkcyjnym nasza funkcja nie może zmieniać swojego stanu w trakcie jej wykonywania dodatkowo zmienne są „niezmienne" (ang. unmutable). Dodatkowo kiedy w języku funkcyjnym będziemy chcieli każdy element listy pomnożyć razy dwa, wtedy wynik zawsze będzie reprezentowany przez nowy wynik ponieważ nie możemy zmieniać stanów istniejących zmiennych.[m
[32m+[m[32mPonadto kompilator GHC wspiera pisanie równoległe oraz współbieżne, na potrzeby mojego projektu inżynierskiego algorytm będzie tylko zrównoleglony bez zarządzania wątkami jak to się ma przy programowaniu współbieżnym. (do sprawdzenia!!!!)[m
[32m+[m
[32m+[m[32m2.7 Pisanie równoległe a współbieżne[m[41m [m
[32m+[m[32m* Równoległe  -  oznacza to że nasz program będzie pracował na wielu procesorach jeśli takowe komputer posiada, zazwyczaj zrównoleglanie odbywa się „nie widocznie" oraz bez większych zmian implementacyjnych.[m
[32m+[m[32m* Współbieżne[m[41m  [m
 [m
 Rozdział 3 Implementacja algorytmu.[m
 3.1 Opis stanowiska oraz środowiska[m
[36m@@ -121,15 +134,28 @@[m [mCałą pracę wykonałem na laptopie o następującej specyfikacji, procesor - A[m
 	Pisząc program w języku R skorzystałem z środowiska o nazwie RStudio które pozwoliło mi na dość szybką implementacje algorytmu oraz pomaga przy zarzadzaniu różnymi bibliotekami.[m
 	Przy pisaniu algorytmu w języku Haskell korzystałem z kompilatora GHC oraz programu Cabal do zarządzania zewnętrznymi bibliotekami. Dodatkowo do diagnostyki oraz pomiaru algorytmu w trybie zrównoleglonym używałem narzędzia o nazwie „ThreadScope", który pozwala obejrzeć ilość tworzonych wątków, czasy procesora czy zużycie jest to dość zaawansowanie narzędzie. [m
 [m
[31m-[m
[31m-[m
[31m-[m
[31m-[m
 4 Badania[m
[31m-4.1 Badanie implementacji w języku R [m
[31m-Asdasdasd[m
[31m-4.2 Badanie implementacji w języku Haskell[m
[31m-Asdasdas[m
[32m+[m[32mPrzy badaniu wydajności algorytmu każda z implementacji została uruchomiona dziesięć razy przy następujących konfiguracjach.[m
[32m+[m[32mRandomPoints=100000[m
[32m+[m[32mSubsetWidth=0.5[m
[32m+[m[32mlGlobalDomain=0[m
[32m+[m[32mrGlobalDomain=15[m
[32m+[m[32mkwSteps=100[m
[32m+[m[32mfunctionToSolve=fx= 2*sinx2+cosx2+x*0.1[m
[32m+[m	[32mRandomPoints  -  jest to zmienna która określa nam ile losowych punktów będzie wygenerowanych w E-sieci.[m
[32m+[m	[32mSubsetWidth  -  wartość która określa nam szerokość podprzedziału.[m
[32m+[m	[32mlGlobalDoman oraz rGlobalDomain  -  zakres przedziału do przeszukiwania globalnego minimum.[m
[32m+[m	[32mkwSteps  -  ilość iteracji dla algorytmu Kiefer  -  Wolfowitz[m
[32m+[m	[32mfunctionToSolve  -  wzorcowa funkcja w której poszukujemy minimum globalne.[m
[32m+[m[32m4.1 Przebieg oraz badanie implementacji w języku R[m[41m [m
[32m+[m[32mW pierwszej kolejności zdecydowałem się zaimplementować algorytm w języku R, jak już wcześniej wspomniałem chciałem jak najszybciej dostać działająca wersje algorytmu.[m
[32m+[m[32mNa początku zaimplementowałem Random Search bez poszukiwania lokalnego minimum metoda Kiefer-Wolfowitza w podzbiorach Rd.[m
[32m+[m[32mNastępnie kiedy już metoda RS zostałą poprawnie zaimplementowana zacząłem pracę nad implementacja algorytmu do poszukiwania minimum / maksimum lokalnego. Na tym etapie prac nie napotkałem żadnych większych problemów. Dodatkowo trzeba tutaj nadmienić iż algorytm na razie działa dla funkcji jednej zmiennej.[m
[32m+[m[32m4.2 Przebieg oraz badanie implementacji w języku Haskell[m
[32m+[m[32mKiedy skończyłem implementacje algorytmu w R posiadałem już pogląd jak algorytm ma wyglądać oraz jakie wyzwania na mnie czekają przy przepisywaniu na następny język. Od początku nie było łatwo ponieważ wcześniej nie wiedziałem nic na temat Haskella i praktycznie uczyłem się jego na potrzeby pracy inżynierskiej. Największym wyzwaniem była zmiana myślenia oraz pojmowania problemu.[m
[32m+[m[32mPierwszym z widocznych rezultatów przepisywania wszystkich algorytmó LISTNUM w numerycznych na języki funkcyjne jest prostota zapisu. Implementacja w haskell jest o wiele bardziej czytelna i krótsza.[m
 4.3 Badanie implementacji w języku Haskell zrównoleglone na CPU[m
[32m+[m[32mPrzy zrównoleglaniu algorytmu używałem biblioteki „Parallel" która zainstalowałem poprzez program „Cabal"[m
[32m+[m[32mKompilator pozwala nam na zrównoleglenie naszego programu na symetrycznych procesorach (WTF?!). Dodatkowo oprócz specjalnej implementacji na etapie kompilacji trzeba zaznaczyć kompilatorowi że chcemy skompilować nasz program w trybie „threaded", w tym przypadku musimy skompilować program wraz z flagą „-threaded"[m
 [m
 5 Podsumowanie[m
