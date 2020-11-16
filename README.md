# Maticovı kalkulátor
Richard Klíma, 2. ro&#269;ník, Zimní semestr 2017/2018, Programování I

## Stru&#269;né zadání
Program nabízí maticovı kalkulátor s grafickım uivatelskım rozhraním.

## P&#345;esné zadání
Maticovı kalkulátor pracuje s maticemi, jejich prvky jsou racionální &#269;ísla
v desetinném i zlomkovém zápisu. Pomocí maticového kalkulátoru je moné matice
mezi sebou s&#269;ítat, od&#269;ítat a násobit, je-li to moné. Jednotlivé matice lze také
násobit racionální konstantou, transponovat, p&#345;evádìt do Gaussova tvaru a
po&#269;ítat jejich determinant. S vıslednımi maticemi lze dále pracovat nebo je
exportovat do textového souboru.\
\
Maticovı kalkulátor také umoòuje po&#269;ítat soustavy lineárních rovnic a o sedmi
neznámıch, pokud mají právì jedno &#345;e&#352;ení. Uivatel zadá matici soustavy, a pokud
má soustava právì jedno &#345;e&#352;ení, maticovı kalkulátor ho najde. Pokud má soustava
nekone&#269;nì mnoho &#345;e&#352;ení, program uivateli oznámí, e soustava nemá jednozna&#269;né
&#345;e&#352;ení. Pokud soustava &#345;e&#352;ení nemá, program tuto skute&#269;nost uivateli rovnì
oznámí.

## Zvolenı algoritmus
Algoritmy pouité v implementaci maticového kalkulátoru jsou p&#345;ímo&#269;aré algoritmy
pro provádìní základních operací se zlomky a maticemi. Tyto algoritmy zahrnují
nap&#345;. s&#269;ítání zlomk&#367;, násobení zlomk&#367;, krácení zlomk&#367; na základní tvar, p&#345;evod
matice do Gaussova tvaru, vyhodnocení matice soustavy lineárních rovnic, atd.

## Diskuze vıbìru algoritmu
Algoritmy pouité v programu jsou standardnì uívané algoritmy pro práci s
maticemi. Algoritmy pro práci se zlomky jsou navreny tak, aby práce se zlomky
byla co nejp&#345;ímo&#269;a&#345;ej&#352;í a nejjednodu&#352;&#352;í.

## Program
Hlavní jednotkou je formulá&#345;ová jednotka `Unit1`. Ta se stará o bìh formulá&#345;e,
o jeho vzhled a zmìny vzhledu, o na&#269;ítání vstupních dat od uivatele a z
textovıch soubor&#367;, vıpis vıstupních dat do ur&#269;enıch míst na formulá&#345;i,
exportování vıstupních dat do textovıch soubor&#367; a zobrazování zpráv ur&#269;enıch
uivateli. Její funkcí je také volání metod ostatních jednotek. Nejd&#367;leitìj&#352;ími
funkcemi této jednotky jsou:
	- `Button1Click` – na&#269;tení matice z formulá&#345;ového okna pro zadávání matic,
	- `Button3Click` – na&#269;tení matice z textového souboru,
	- `Button14Click` – exportování vısledné matice do textového souboru,
	- `Button15Click` – volání Gaussovy metody v jednotce UMatice.

Dal&#352;í jednotkou v programu je jednotka `UMatice`. Ta se stará o práci s maticemi
jako takovımi, tedy o s&#269;ítání, od&#269;ítání, násobení a transpozici matic, p&#345;evod
do Gaussova tvaru, po&#269;ítání determinantu a vyhodnocování matice soustavy
lineárních rovnic. Jejími nejd&#367;leitìj&#352;ími funkcemi jsou:
	- `Secti(TMatice, var TMatice)`, `Odecti(TMatice, var TMatice)`, 
`Vynasob(TMatice, var TMatice)` – se&#269;te, resp. ode&#269;te, resp. vynásobí dvì matice
mezi s sebou,
  -	`NasobKonstantou(string)` – vynásobí matici konstantou,
	- `Transponuj` – transponuje matici,
	- `Gauss(var boolean, var TMatice)`, `Gauss (var TMatice)` – p&#345;evede danou
matici do Gaussova tvaru, pokud je to moné; varianta s referen&#269;ním parametrem
typu boolean navíc vrátí informaci, jestli je pot&#345;eba zmìnit znaménko p&#345i
po&#269;ítání determinantu matice (operace prohození &#345;ádk&#367; p&#345;i po&#269;ítání determinantu
mìní jeho znaménko),
  -	`VyhodnoceniGauss(var TDynPole)` – vyhodnotí matici soustavy lineárních
rovnic (p&#345;evede matici do Gaussova tvaru a od posledního &#345;ádku ur&#269;uje &#345;e&#352;ení)
a vrací vektor &#345;e&#352;ení,
  -	`Determinant(var TZlomek)` – spo&#269;ítá determinant matice (p&#345;evede matici do
Gaussova tvaru a vynásobí spolu prvky na hlavní diagonále, pop&#345;. podle informace
z metody `Gauss(var boolean, var TMatice)` zmìní znaménko determinantu).

V&#352;echny tyto funkce vrací hodnotu typu `boolean`, která &#345;íká, jestli daná funkce
probìhla v po&#345;ádku, nebo jestli bìhem jejího vyhodnocování nastal nìjakı
speciální p&#345;ípad a operace tak nemohla probìhnout (nap&#345;. pokud matice, ze které
uivatel chce po&#269;ítat determinant, není &#269;tvercová, funkce
`Determinant(var TZlomek)` vrátí `false`).\
\
Dále tato jednotka obsahuje pomocné funkce na hledání maximální hodnoty ve
sloupci matice, prohazování &#345;ádk&#367;, apod.\
\
Poslední jednotkou pouívanou v programu je jednotka `UZlomky`. Ta zaji&#352;uje
práci se zlomky ve tvaru `p/q`, kde `p&#8712Z`, `q&#8712N`, konkrétnì nap&#345;. o
krácení, s&#269;ítání, od&#269;ítání a násobení zlomk&#367;. Nejd&#367;leitìj&#352;ími funkcemi této
jednotky jsou:
  -	`Zkrat` – zkrátí zlomek na jeho základní tvar (tj. `p, q` jsou nesoudìlná
&#269;ísla),
  -	`Secti(TZlomek)`, `Odecti(TZlomek)`, `Nasob(TZlomek)` – se&#269;te, resp. ode&#269;te,
resp. vynásobí vlastní zlomek se zlomkem p&#345;edanım v parametru,
	- `Vysledek`– vrátí hodnotu vlastního zlomku jako reálné &#269;íslo.

Dále tato jednotka obsahuje pomocné funkce pro práci se zlomky, nap&#345;. p&#345;evrácení
hodnoty zlomku, ur&#269;ení absolutní hodnoty zlomku, porovnání dvou zlomk&#367;, apod.

## Alternativní programová &#345;e&#352;ení
Algoritmy pouité v implementaci jsou co nejp&#345;ímo&#269;a&#345;ej&#352;í. Nìkteré algoritmy by
pravdìpodobnì &#352;lo nahradit vıkonnìj&#352;ími, nicménì nep&#345;ispìlo by to k p&#345;ehlednosti
zdrojového kódu.\
\
Funkce formulá&#345;ové jednotky `Unit1` mají defaultní názvy, co trochu
znep&#345;íjemòuje &#269;tení kódu, nicménì u kadé z tìchto funkcí je stru&#269;nı komentá&#345;,
k &#269;emu daná funkce slouí, aby bylo na první pohled jasné, o jakou funkci se
jedná.

## Reprezentace vstupních dat a jejich p&#345;íprava
Uivatel komunikuje s programem pomocí tla&#269;ítkového formulá&#345;e, kde kadé
tla&#269;ítko obsahuje popis své funkcionality. Vyskytují se také p&#345;epína&#269;e, které
slouí k tomu, aby bylo jednozna&#269;nì ur&#269;eno, se kterou maticí se má pracovat.
Zadávat matice m&#367;e uivatel p&#345;ímo ve formulá&#345;i prost&#345;ednictvím p&#345;ipravené
m&#345;íky (která je omezená maximálními rozmìry `12 × 12`) nebo na&#269;tením matice z
textového souboru, ve kterém je na prvním &#345;ádku po&#269;et &#345;ádk&#367; a po&#269;et sloupc&#367;
matice oddìlenı mezerami a na dal&#352;ích &#345;ádcích jsou po &#345;ádcích vypsané prvky
matice daného rozmìru. Pokud vstupní soubor není ve správném formátu, program
uivatele uvìdomí a na&#269;tení neprobìhne. Matici soustavy lineárních rovnic
uivatel zadává p&#345;ímo ve formulá&#345;i do p&#345;ipravené m&#345;íky, její velikost si p&#345;ed
tím sám nastaví.\
\
Program nabízí také li&#352;tové menu v horní &#269;ásti formulá&#345;e, které ale poskytuje
stejné monosti jako tla&#269;ítkovı formulá&#345;.

## Reprezentace vıstupních dat a jejich p&#345;íprava
Vıstupní data jsou graficky reprezentována ve formulá&#345;i, kde uivatel vidí
vısledky svıch operací s maticemi a vyhodnocování soustav rovnic v p&#345;ipravenıch
m&#345;íkách. Uivatel také m&#367;e vısledek svıch operací a vyhodnocování soustav
rovnic exportovat do vıstupního textového souboru, kterı má stejnı formát jako
platnı vstupní soubor programu a m&#367;e tak bıt pouit pro dal&#352;í na&#269;tení matice
ze souboru.

## Pr&#367;bìh práce
Práce na programu probíhala relativnì hladce, z po&#269;átku nejvíce &#269;asu zabral
grafickı návrh formulá&#345;e, posléze byly nejnáro&#269;nìj&#352;ími funkcemi na implementaci
funkce pro p&#345;evod do Gaussova tvaru a vyhodnocení matice soustavy lineárních
rovnic. Jednotka pro práci se zlomky byla napsána samostatnì ji d&#345;íve pro jinı
m&#367;j program, a tedy mi p&#345;i&#352;lo vıhodné ji vyuít i v tomto programu (proto se v
jednotce vyskytují nìkteré funkce a procedury, které nejsou nikde v programu
pouity).

## Co nebylo dodìláno
Nebylo dodìláno lep&#352;í po&#269;ítání soustav lineárních rovnic, kdy p&#345;i nekone&#269;ném
po&#269;tu &#345;e&#352;ení program pouze vypisuje informaci o tomto stavu, p&#345;i&#269;em by mohl
soustavu vy&#345;e&#352;it parametrizací nìjakıch promìnnıch a vrátit vektor vısledk&#367;.\
\
Za zamy&#353;lení by stála také historie provedenıch operací a s tím se vázající
funkce Undo a Redo.

<p>
Dal&#353;ím nápadem, kterı by &#353;lo realizovat, by byla jakási p&#345;íkazová &#345;ádka, kde by
uivatel mohl po na&#269;tení matic (ne nutnì nejvı&#353;e dvou zároveò – také by &#353;lo
dodìlat) zadávat p&#345;íkazy, které by s maticemi chtìl provést, nap&#345;. ve tvaru
<code>((A - B) * (1/3) * C) – (D * (E + I<sub>6</sub>))</code> a tyto operace by
se následnì provedly. Jednalo by se tedy o p&#345;ipsání nìjakého interpreteru pro
tuto p&#345;íkazovou &#345;ádku.
</p>


