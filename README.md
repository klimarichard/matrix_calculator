# Maticovı kalkulátor
Richard Klíma, 2. ro&#269ník, Zimní semestr 2017/2018, Programování I

## Stru&#269né zadání
Program nabízí maticovı kalkulátor s grafickım uivatelskım rozhraním.

## P&#345esné zadání
Maticovı kalkulátor pracuje s maticemi, jejich prvky jsou racionální &#269ísla
v desetinném i zlomkovém zápisu. Pomocí maticového kalkulátoru je moné matice
mezi sebou s&#269ítat, od&#269ítat a násobit, je-li to moné. Jednotlivé matice lze také
násobit racionální konstantou, transponovat, p&#345evádìt do Gaussova tvaru a
po&#269ítat jejich determinant. S vıslednımi maticemi lze dále pracovat nebo je
exportovat do textového souboru.\
\
Maticovı kalkulátor také umoòuje po&#269ítat soustavy lineárních rovnic a o sedmi
neznámıch, pokud mají právì jedno &#345e&#352ení. Uivatel zadá matici soustavy, a pokud
má soustava právì jedno &#345e&#352ení, maticovı kalkulátor ho najde. Pokud má soustava
nekone&#269nì mnoho &#345e&#352ení, program uivateli oznámí, e soustava nemá jednozna&#269né
&#345e&#352ení. Pokud soustava &#345e&#352ení nemá, program tuto skute&#269nost uivateli rovnì
oznámí.

## Zvolenı algoritmus
Algoritmy pouité v implementaci maticového kalkulátoru jsou p&#345ímo&#269aré algoritmy
pro provádìní základních operací se zlomky a maticemi. Tyto algoritmy zahrnují
nap&#345. s&#269ítání zlomk&#367, násobení zlomk&#367, krácení zlomk&#367 na základní tvar, p&#345evod
matice do Gaussova tvaru, vyhodnocení matice soustavy lineárních rovnic, atd.

## Diskuze vıbìru algoritmu
Algoritmy pouité v programu jsou standardnì uívané algoritmy pro práci s
maticemi. Algoritmy pro práci se zlomky jsou navreny tak, aby práce se zlomky
byla co nejp&#345ímo&#269a&#345ej&#352í a nejjednodu&#352&#352í.

## Program
Hlavní jednotkou je formulá&#345ová jednotka `Unit1`. Ta se stará o bìh formulá&#345e,
o jeho vzhled a zmìny vzhledu, o na&#269ítání vstupních dat od uivatele a z
textovıch soubor&#367, vıpis vıstupních dat do ur&#269enıch míst na formulá&#345i,
exportování vıstupních dat do textovıch soubor&#367 a zobrazování zpráv ur&#269enıch
uivateli. Její funkcí je také volání metod ostatních jednotek. Nejd&#367leitìj&#352ími
funkcemi této jednotky jsou:
	- `Button1Click` – na&#269tení matice z formulá&#345ového okna pro zadávání matic,
	- `Button3Click` – na&#269tení matice z textového souboru,
	- `Button14Click` – exportování vısledné matice do textového souboru,
	- `Button15Click` – volání Gaussovy metody v jednotce UMatice.

Dal&#352í jednotkou v programu je jednotka `UMatice`. Ta se stará o práci s maticemi
jako takovımi, tedy o s&#269ítání, od&#269ítání, násobení a transpozici matic, p&#345evod
do Gaussova tvaru, po&#269ítání determinantu a vyhodnocování matice soustavy
lineárních rovnic. Jejími nejd&#367leitìj&#352ími funkcemi jsou:
	- `Secti(TMatice, var TMatice)`, `Odecti(TMatice, var TMatice)`, 
`Vynasob(TMatice, var TMatice)` – se&#269te, resp. ode&#269te, resp. vynásobí dvì matice
mezi s sebou,
  -	`NasobKonstantou(string)`` – vynásobí matici konstantou,
	- `Transponuj` – transponuje matici,
	- `Gauss(var boolean, var TMatice)`, `Gauss (var TMatice)`` – p&#345evede danou
matici do Gaussova tvaru, pokud je to moné; varianta s referen&#269ním parametrem
typu boolean navíc vrátí informaci, jestli je pot&#345eba zmìnit znaménko p&#345i
po&#269ítání determinantu matice (operace prohození &#345ádk&#367 p&#345i po&#269ítání determinantu
mìní jeho znaménko),
  -	`VyhodnoceniGauss(var TDynPole)`` – vyhodnotí matici soustavy lineárních
rovnic (p&#345evede matici do Gaussova tvaru a od posledního &#345ádku ur&#269uje &#345e&#352ení)
a vrací vektor &#345e&#352ení,
  -	`Determinant(var TZlomek)`` – spo&#269ítá determinant matice (p&#345evede matici do
Gaussova tvaru a vynásobí spolu prvky na hlavní diagonále, pop&#345. podle informace
z metody `Gauss(var boolean, var TMatice)` zmìní znaménko determinantu).

V&#352echny tyto funkce vrací hodnotu typu `boolean`, která &#345íká, jestli daná funkce
probìhla v po&#345ádku, nebo jestli bìhem jejího vyhodnocování nastal nìjakı
speciální p&#345ípad a operace tak nemohla probìhnout (nap&#345. pokud matice, ze které
uivatel chce po&#269ítat determinant, není &#269tvercová, funkce
`Determinant(var TZlomek)` vrátí `false`).\
\
Dále tato jednotka obsahuje pomocné funkce na hledání maximální hodnoty ve
sloupci matice, prohazování &#345ádk&#367, apod.\
\
Poslední jednotkou pouívanou v programu je jednotka `UZlomky`. Ta zaji&#352uje
práci se zlomky ve tvaru `p/q`, kde `p&#8712Z`, `q&#8712N`, konkrétnì nap&#345. o
krácení, s&#269ítání, od&#269ítání a násobení zlomk&#367. Nejd&#367leitìj&#352ími funkcemi této
jednotky jsou:
  -	`Zkrat` – zkrátí zlomek na jeho základní tvar (tj. `p, q` jsou nesoudìlná
&#269ísla),
  -	`Secti(TZlomek)`, `Odecti(TZlomek)`, `Nasob(TZlomek)` – se&#269te, resp. ode&#269te,
resp. vynásobí vlastní zlomek se zlomkem p&#345edanım v parametru,
	- `Vysledek`– vrátí hodnotu vlastního zlomku jako reálné &#269íslo.

Dále tato jednotka obsahuje pomocné funkce pro práci se zlomky, nap&#345. p&#345evrácení
hodnoty zlomku, ur&#269ení absolutní hodnoty zlomku, porovnání dvou zlomk&#367, apod.

## Alternativní programová &#345e&#352ení
Algoritmy pouité v implementaci jsou co nejp&#345ímo&#269a&#345ej&#352í. Nìkteré algoritmy by
pravdìpodobnì &#352lo nahradit vıkonnìj&#352ími, nicménì nep&#345ispìlo by to k p&#345ehlednosti
zdrojového kódu.\
\
Funkce formulá&#345ové jednotky `Unit1` mají defaultní názvy, co trochu
znep&#345íjemòuje &#269tení kódu, nicménì u kadé z tìchto funkcí je stru&#269nı komentá&#345,
k &#269emu daná funkce slouí, aby bylo na první pohled jasné, o jakou funkci se
jedná.

## Reprezentace vstupních dat a jejich p&#345íprava
Uivatel komunikuje s programem pomocí tla&#269ítkového formulá&#345e, kde kadé
tla&#269ítko obsahuje popis své funkcionality. Vyskytují se také p&#345epína&#269e, které
slouí k tomu, aby bylo jednozna&#269nì ur&#269eno, se kterou maticí se má pracovat.
Zadávat matice m&#367e uivatel p&#345ímo ve formulá&#345i prost&#345ednictvím p&#345ipravené
m&#345íky (která je omezená maximálními rozmìry `12 × 12`) nebo na&#269tením matice z
textového souboru, ve kterém je na prvním &#345ádku po&#269et &#345ádk&#367 a po&#269et sloupc&#367
matice oddìlenı mezerami a na dal&#352ích &#345ádcích jsou po &#345ádcích vypsané prvky
matice daného rozmìru. Pokud vstupní soubor není ve správném formátu, program
uivatele uvìdomí a na&#269tení neprobìhne. Matici soustavy lineárních rovnic
uivatel zadává p&#345ímo ve formulá&#345i do p&#345ipravené m&#345íky, její velikost si p&#345ed
tím sám nastaví.\
\
Program nabízí také li&#352tové menu v horní &#269ásti formulá&#345e, které ale poskytuje
stejné monosti jako tla&#269ítkovı formulá&#345.

## Reprezentace vıstupních dat a jejich p&#345íprava
Vıstupní data jsou graficky reprezentována ve formulá&#345i, kde uivatel vidí
vısledky svıch operací s maticemi a vyhodnocování soustav rovnic v p&#345ipravenıch
m&#345íkách. Uivatel také m&#367e vısledek svıch operací a vyhodnocování soustav
rovnic exportovat do vıstupního textového souboru, kterı má stejnı formát jako
platnı vstupní soubor programu a m&#367e tak bıt pouit pro dal&#352í na&#269tení matice
ze souboru.

## Pr&#367bìh práce
Práce na programu probíhala relativnì hladce, z po&#269átku nejvíce &#269asu zabral
grafickı návrh formulá&#345e, posléze byly nejnáro&#269nìj&#352ími funkcemi na implementaci
funkce pro p&#345evod do Gaussova tvaru a vyhodnocení matice soustavy lineárních
rovnic. Jednotka pro práci se zlomky byla napsána samostatnì ji d&#345íve pro jinı
m&#367j program, a tedy mi p&#345i&#352lo vıhodné ji vyuít i v tomto programu (proto se v
jednotce vyskytují nìkteré funkce a procedury, které nejsou nikde v programu
pouity).

## Co nebylo dodìláno
Nebylo dodìláno lep&#352í po&#269ítání soustav lineárních rovnic, kdy p&#345i nekone&#269ném
po&#269tu &#345e&#352ení program pouze vypisuje informaci o tomto stavu, p&#345i&#269em by mohl
soustavu vy&#345e&#352it parametrizací nìjakıch promìnnıch a vrátit vektor vısledk&#367.\
\
Za zamy&#353lení by stála také historie provedenıch operací a s tím se vázající
funkce Undo a Redo.

<p>
Dal&#353ím nápadem, kterı by &#353lo realizovat, by byla jakási p&#345íkazová &#345ádka, kde by
uivatel mohl po na&#269tení matic (ne nutnì nejvı&#353e dvou zároveò – také by &#353lo
dodìlat) zadávat p&#345íkazy, které by s maticemi chtìl provést, nap&#345. ve tvaru
<code>((A - B) * (1/3) * C) – (D * (E + I<sub>6</sub>))</code> a tyto operace by
se následnì provedly. Jednalo by se tedy o p&#345ipsání nìjakého interpreteru pro
tuto p&#345íkazovou &#345ádku.
</p>


