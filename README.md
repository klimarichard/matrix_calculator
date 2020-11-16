# Maticov� kalkul�tor
Richard Kl�ma, 2. ro&#269;n�k, Zimn� semestr 2017/2018, Programov�n� I

## Stru&#269;n� zad�n�
Program nab�z� maticov� kalkul�tor s grafick�m u�ivatelsk�m rozhran�m.

## P&#345;esn� zad�n�
Maticov� kalkul�tor pracuje s maticemi, jejich� prvky jsou racion�ln� &#269;�sla
v desetinn�m i zlomkov�m z�pisu. Pomoc� maticov�ho kalkul�toru je mo�n� matice
mezi sebou s&#269;�tat, od&#269;�tat a n�sobit, je-li to mo�n�. Jednotliv� matice lze tak�
n�sobit racion�ln� konstantou, transponovat, p&#345;ev�d�t do Gaussova tvaru a
po&#269;�tat jejich determinant. S v�sledn�mi maticemi lze d�le pracovat nebo je
exportovat do textov�ho souboru.\
\
Maticov� kalkul�tor tak� umo��uje po&#269;�tat soustavy line�rn�ch rovnic a� o sedmi
nezn�m�ch, pokud maj� pr�v� jedno &#345;e&#352;en�. U�ivatel zad� matici soustavy, a pokud
m� soustava pr�v� jedno &#345;e&#352;en�, maticov� kalkul�tor ho najde. Pokud m� soustava
nekone&#269;n� mnoho &#345;e&#352;en�, program u�ivateli ozn�m�, �e soustava nem� jednozna&#269;n�
&#345;e&#352;en�. Pokud soustava &#345;e&#352;en� nem�, program tuto skute&#269;nost u�ivateli rovn�
ozn�m�.

## Zvolen� algoritmus
Algoritmy pou�it� v implementaci maticov�ho kalkul�toru jsou p&#345;�mo&#269;ar� algoritmy
pro prov�d�n� z�kladn�ch operac� se zlomky a maticemi. Tyto algoritmy zahrnuj�
nap&#345;. s&#269;�t�n� zlomk&#367;, n�soben� zlomk&#367;, kr�cen� zlomk&#367; na z�kladn� tvar, p&#345;evod
matice do Gaussova tvaru, vyhodnocen� matice soustavy line�rn�ch rovnic, atd.

## Diskuze v�b�ru algoritmu
Algoritmy pou�it� v programu jsou standardn� u��van� algoritmy pro pr�ci s
maticemi. Algoritmy pro pr�ci se zlomky jsou navr�eny tak, aby pr�ce se zlomky
byla co nejp&#345;�mo&#269;a&#345;ej&#352;� a nejjednodu&#352;&#352;�.

## Program
Hlavn� jednotkou je formul�&#345;ov� jednotka `Unit1`. Ta se star� o b�h formul�&#345;e,
o jeho vzhled a zm�ny vzhledu, o na&#269;�t�n� vstupn�ch dat od u�ivatele a z
textov�ch soubor&#367;, v�pis v�stupn�ch dat do ur&#269;en�ch m�st na formul�&#345;i,
exportov�n� v�stupn�ch dat do textov�ch soubor&#367; a zobrazov�n� zpr�v ur&#269;en�ch
u�ivateli. Jej� funkc� je tak� vol�n� metod ostatn�ch jednotek. Nejd&#367;le�it�j&#352;�mi
funkcemi t�to jednotky jsou:
	- `Button1Click` � na&#269;ten� matice z formul�&#345;ov�ho okna pro zad�v�n� matic,
	- `Button3Click` � na&#269;ten� matice z textov�ho souboru,
	- `Button14Click` � exportov�n� v�sledn� matice do textov�ho souboru,
	- `Button15Click` � vol�n� Gaussovy metody v jednotce UMatice.

Dal&#352;� jednotkou v programu je jednotka `UMatice`. Ta se star� o pr�ci s maticemi
jako takov�mi, tedy o s&#269;�t�n�, od&#269;�t�n�, n�soben� a transpozici matic, p&#345;evod
do Gaussova tvaru, po&#269;�t�n� determinantu a vyhodnocov�n� matice soustavy
line�rn�ch rovnic. Jej�mi nejd&#367;le�it�j&#352;�mi funkcemi jsou:
	- `Secti(TMatice, var TMatice)`, `Odecti(TMatice, var TMatice)`, 
`Vynasob(TMatice, var TMatice)` � se&#269;te, resp. ode&#269;te, resp. vyn�sob� dv� matice
mezi s sebou,
  -	`NasobKonstantou(string)` � vyn�sob� matici konstantou,
	- `Transponuj` � transponuje matici,
	- `Gauss(var boolean, var TMatice)`, `Gauss (var TMatice)` � p&#345;evede danou
matici do Gaussova tvaru, pokud je to mo�n�; varianta s referen&#269;n�m parametrem
typu boolean nav�c vr�t� informaci, jestli je pot&#345;eba zm�nit znam�nko p&#345i
po&#269;�t�n� determinantu matice (operace prohozen� &#345;�dk&#367; p&#345;i po&#269;�t�n� determinantu
m�n� jeho znam�nko),
  -	`VyhodnoceniGauss(var TDynPole)` � vyhodnot� matici soustavy line�rn�ch
rovnic (p&#345;evede matici do Gaussova tvaru a od posledn�ho &#345;�dku ur&#269;uje &#345;e&#352;en�)
a vrac� vektor &#345;e&#352;en�,
  -	`Determinant(var TZlomek)` � spo&#269;�t� determinant matice (p&#345;evede matici do
Gaussova tvaru a vyn�sob� spolu prvky na hlavn� diagon�le, pop&#345;. podle informace
z metody `Gauss(var boolean, var TMatice)` zm�n� znam�nko determinantu).

V&#352;echny tyto funkce vrac� hodnotu typu `boolean`, kter� &#345;�k�, jestli dan� funkce
prob�hla v po&#345;�dku, nebo jestli b�hem jej�ho vyhodnocov�n� nastal n�jak�
speci�ln� p&#345;�pad a operace tak nemohla prob�hnout (nap&#345;. pokud matice, ze kter�
u�ivatel chce po&#269;�tat determinant, nen� &#269;tvercov�, funkce
`Determinant(var TZlomek)` vr�t� `false`).\
\
D�le tato jednotka obsahuje pomocn� funkce na hled�n� maxim�ln� hodnoty ve
sloupci matice, prohazov�n� &#345;�dk&#367;, apod.\
\
Posledn� jednotkou pou��vanou v programu je jednotka `UZlomky`. Ta zaji&#352;�uje
pr�ci se zlomky ve tvaru `p/q`, kde `p&#8712Z`, `q&#8712N`, konkr�tn� nap&#345;. o
kr�cen�, s&#269;�t�n�, od&#269;�t�n� a n�soben� zlomk&#367;. Nejd&#367;le�it�j&#352;�mi funkcemi t�to
jednotky jsou:
  -	`Zkrat` � zkr�t� zlomek na jeho z�kladn� tvar (tj. `p, q` jsou nesoud�ln�
&#269;�sla),
  -	`Secti(TZlomek)`, `Odecti(TZlomek)`, `Nasob(TZlomek)` � se&#269;te, resp. ode&#269;te,
resp. vyn�sob� vlastn� zlomek se zlomkem p&#345;edan�m v parametru,
	- `Vysledek`� vr�t� hodnotu vlastn�ho zlomku jako re�ln� &#269;�slo.

D�le tato jednotka obsahuje pomocn� funkce pro pr�ci se zlomky, nap&#345;. p&#345;evr�cen�
hodnoty zlomku, ur&#269;en� absolutn� hodnoty zlomku, porovn�n� dvou zlomk&#367;, apod.

## Alternativn� programov� &#345;e&#352;en�
Algoritmy pou�it� v implementaci jsou co nejp&#345;�mo&#269;a&#345;ej&#352;�. N�kter� algoritmy by
pravd�podobn� &#352;lo nahradit v�konn�j&#352;�mi, nicm�n� nep&#345;isp�lo by to k p&#345;ehlednosti
zdrojov�ho k�du.\
\
Funkce formul�&#345;ov� jednotky `Unit1` maj� defaultn� n�zvy, co� trochu
znep&#345;�jem�uje &#269;ten� k�du, nicm�n� u ka�d� z t�chto funkc� je stru&#269;n� koment�&#345;,
k &#269;emu dan� funkce slou��, aby bylo na prvn� pohled jasn�, o jakou funkci se
jedn�.

## Reprezentace vstupn�ch dat a jejich p&#345;�prava
U�ivatel komunikuje s programem pomoc� tla&#269;�tkov�ho formul�&#345;e, kde ka�d�
tla&#269;�tko obsahuje popis sv� funkcionality. Vyskytuj� se tak� p&#345;ep�na&#269;e, kter�
slou�� k tomu, aby bylo jednozna&#269;n� ur&#269;eno, se kterou matic� se m� pracovat.
Zad�vat matice m&#367;�e u�ivatel p&#345;�mo ve formul�&#345;i prost&#345;ednictv�m p&#345;ipraven�
m&#345;�ky (kter� je omezen� maxim�ln�mi rozm�ry `12 � 12`) nebo na&#269;ten�m matice z
textov�ho souboru, ve kter�m je na prvn�m &#345;�dku po&#269;et &#345;�dk&#367; a po&#269;et sloupc&#367;
matice odd�len� mezerami a na dal&#352;�ch &#345;�dc�ch jsou po &#345;�dc�ch vypsan� prvky
matice dan�ho rozm�ru. Pokud vstupn� soubor nen� ve spr�vn�m form�tu, program
u�ivatele uv�dom� a na&#269;ten� neprob�hne. Matici soustavy line�rn�ch rovnic
u�ivatel zad�v� p&#345;�mo ve formul�&#345;i do p&#345;ipraven� m&#345;�ky, jej� velikost si p&#345;ed
t�m s�m nastav�.\
\
Program nab�z� tak� li&#352;tov� menu v horn� &#269;�sti formul�&#345;e, kter� ale poskytuje
stejn� mo�nosti jako tla&#269;�tkov� formul�&#345;.

## Reprezentace v�stupn�ch dat a jejich p&#345;�prava
V�stupn� data jsou graficky reprezentov�na ve formul�&#345;i, kde u�ivatel vid�
v�sledky sv�ch operac� s maticemi a vyhodnocov�n� soustav rovnic v p&#345;ipraven�ch
m&#345;�k�ch. U�ivatel tak� m&#367;�e v�sledek sv�ch operac� a vyhodnocov�n� soustav
rovnic exportovat do v�stupn�ho textov�ho souboru, kter� m� stejn� form�t jako
platn� vstupn� soubor programu a m&#367;�e tak b�t pou�it pro dal&#352;� na&#269;ten� matice
ze souboru.

## Pr&#367;b�h pr�ce
Pr�ce na programu prob�hala relativn� hladce, z po&#269;�tku nejv�ce &#269;asu zabral
grafick� n�vrh formul�&#345;e, posl�ze byly nejn�ro&#269;n�j&#352;�mi funkcemi na implementaci
funkce pro p&#345;evod do Gaussova tvaru a vyhodnocen� matice soustavy line�rn�ch
rovnic. Jednotka pro pr�ci se zlomky byla naps�na samostatn� ji� d&#345;�ve pro jin�
m&#367;j program, a tedy mi p&#345;i&#352;lo v�hodn� ji vyu��t i v tomto programu (proto se v
jednotce vyskytuj� n�kter� funkce a procedury, kter� nejsou nikde v programu
pou�ity).

## Co nebylo dod�l�no
Nebylo dod�l�no lep&#352;� po&#269;�t�n� soustav line�rn�ch rovnic, kdy p&#345;i nekone&#269;n�m
po&#269;tu &#345;e&#352;en� program pouze vypisuje informaci o tomto stavu, p&#345;i&#269;em� by mohl
soustavu vy&#345;e&#352;it parametrizac� n�jak�ch prom�nn�ch a vr�tit vektor v�sledk&#367;.\
\
Za zamy&#353;len� by st�la tak� historie proveden�ch operac� a s t�m se v�zaj�c�
funkce Undo a Redo.

<p>
Dal&#353;�m n�padem, kter� by &#353;lo realizovat, by byla jak�si p&#345;�kazov� &#345;�dka, kde by
u�ivatel mohl po na&#269;ten� matic (ne nutn� nejv�&#353;e dvou z�rove� � tak� by &#353;lo
dod�lat) zad�vat p&#345;�kazy, kter� by s maticemi cht�l prov�st, nap&#345;. ve tvaru
<code>((A - B) * (1/3) * C) � (D * (E + I<sub>6</sub>))</code> a tyto operace by
se n�sledn� provedly. Jednalo by se tedy o p&#345;ips�n� n�jak�ho interpreteru pro
tuto p&#345;�kazovou &#345;�dku.
</p>


