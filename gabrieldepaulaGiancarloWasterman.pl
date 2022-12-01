/*===================================
||                                 ||
||  TRABALHO PRATICO - PROLOG      ||
||                                 ||
||  UFSJ - Ciencia da Computacao   ||
||  Lógica aplicada a Computacao   ||
||  Professor: Edimilson Batista   ||
||                                 ||
||  INTEGRANTES DO GRUPO           ||
||  Gabriel de Paula Meira         ||
||  Giancarlo Oliveira Teixeira    ||
||  Wasterman Avila Apolinario     ||
||                                 ||
===================================*/





/*..........................................................................................................
............................................................................................................
....PPPPPPPPPPPPP.....AAAAAAA.......RRRRRRRRRRRRR....TTTTTTTTTTTTTTT.EEEEEEEEEEEEEEE............1111........
....PPPPPPPPPPPPPP....AAAAAAA.......RRRRRRRRRRRRRR...TTTTTTTTTTTTTTT.EEEEEEEEEEEEEEE...........11111........
....PPPPPPPPPPPPPP....AAAAAAAA......RRRRRRRRRRRRRRR..TTTTTTTTTTTTTTT.EEEEEEEEEEEEEEE.........1111111........
....PPPPP..PPPPPPPP..AAAAAAAAA......RRRRR...RRRRRRR.......TTTTT......EEEEE.................111111111........
....PPPPP....PPPPPP..AAAAAAAAA......RRRRR.....RRRRR.......TTTTT......EEEEE.................111111111........
....PPPPP.....PPPPP..AAAAAAAAAA.....RRRRR.....RRRRR.......TTTTT......EEEEE.................111111111........
....PPPPP....PPPPPP.PAAAA.AAAAA.....RRRRR...RRRRRRR.......TTTTT......EEEEE.................111111111........
....PPPPP..PPPPPPPP.PAAAA.AAAAAA....RRRRRRRRRRRRRR........TTTTT......EEEEEEEEEEEEEE............11111........
....PPPPPPPPPPPPPP.PPAAAA..AAAAA....RRRRRRRRRRRRRR........TTTTT......EEEEEEEEEEEEEE............11111........
....PPPPPPPPPPPPP..PPAAA...AAAAA....RRRRRRRRRRRR..........TTTTT......EEEEEEEEEEEEEE............11111........
....PPPPPPPPPPPP...PPAAAAAAAAAAAA...RRRRRRRRRRRR..........TTTTT......EEEEE.....................11111........
....PPPPP.........PPPAAAAAAAAAAAA...RRRRR..RRRRRR.........TTTTT......EEEEE.....................11111........
....PPPPP.........PPPAAAAAAAAAAAA...RRRRR..RRRRRRR........TTTTT......EEEEE.....................11111........
....PPPPP.........PPPAA.....AAAAAA..RRRRR...RRRRRR........TTTTT......EEEEE.....................11111........
....PPPPP........PPPPAA......AAAAA..RRRRR....RRRRRR.......TTTTT......EEEEEEEEEEEEEEE...........11111........
....PPPPP........PPPPA.......AAAAAA.RRRRR.....RRRRRR......TTTTT......EEEEEEEEEEEEEEE...........11111........
....PPPPP........PPPPA.......AAAAAA.RRRRR.....RRRRRR......TTTTT......EEEEEEEEEEEEEEE...........11111........
............................................................................................................
...................................... OPERACOES COM LISTAS EM PROLOG ......................................
..........................................................................................................*/


/*==============================================
|| Letra A - Inserir elemento no fim da lista ||
==============================================*/

/* Para realizar a operacao eh necessario percorrer a lista ate chegar na ultima posicao, separando cabeca e 
cauda da lista recursivamente ate que a lista esteja vazia. Com a lista vazia o proximo passo eh inserir o
elemento informado pelo usuario e entao, apos isso, a volta da chamada recursiva deve reconstruir a lista, 
inserindo os elementos anteriores na cabeca um por um. */

% USO DO PREDICADO:
% insereFinal(Lista, Elemento, Resultado)

insereFinal([], Elemento, [Elemento]).    % O caso base da recursao recebe uma lista vazia e insere o Elemento
insereFinal([Cabeca|Cauda], Elemento, [Cabeca|Resto]) :-    % Conserva a Cabeca da lista (primeiro elemento) e repete a operacao com a Cauda
    insereFinal(Cauda, Elemento, Resto).    % Percorre a lista recursivamente ate que ela esteja completamente vazia, executando o caso base e reconstruindo a lista


/*========================================================
|| Letra B - Inserir elemento em uma determinda posicao ||
========================================================*/

/* O predicado para inserir um elemento em uma posicao deve percorrer a lista ate chegar na posicao informada 
pelo usuario, separando a cabeca e a cauda da lista recursivamente. Durante esse processo o indice eh subtraido 
em 1 unidade, ate que se iguale a 1 (momento em que o elemento sera inserido na cabeca), depois desse processo 
a lista eh reconstruida na volta da chamada recursiva. */

% USO DO PREDICADO:
% insereIndice(Lista, Elemento, Posicao, Resultado)

insereIndice(Lista, Elemento, 1, [Elemento|Lista]).     % O caso base da recursao insere o Elemento na Posicao 1 da Lista
insereIndice([Cabeca|Cauda], Elemento, Posicao, [Cabeca|Resto]) :-      % Conserva a Cabeca da Lista e repete a operacao com a Cauda, passando a Posicao para inserir
    NovaPosicao is Posicao - 1,     % Descresce o a Posicao em 1 unidade em toda repeticao, atribuindo o valor para a variavel NovaPosicao
    insereIndice(Cauda, Elemento, NovaPosicao, Resto).      % Percorre a lista recursivamente usando a Cauda ate que a NovaPosicao para inserir o Elemento seja o primeiro (cabeca)


/*=========================================================
|| Letra C - Remover elemento em uma determinada posicao ||
=========================================================*/

/* Para remover um elemento numa posicao informada pelo usuario eh necessario percorrer a lista ate chegar
nessa posicao, separando a cabeca e a cauda da lista recursivamente. A cada chamada o indice eh subtraido em
1 unidade ate que se iguale a 1 (momento em que o elemento a ser removido esta na cabeca da lista), apos isso
o elemento que se localizava na cauda eh substituido pelo resto da lista original. */

% USO DO PREDICADO:
% remove(Lista, Indice, Resultado)

remove([_|Cauda], 1, Cauda).    % O caso base ocorre quando o indice a ser removido eh igual a 1 (cabeca da lista), recebendo uma lista e retornando sua Cauda
remove([Cabeca|Cauda], Posicao, [Cabeca|Resto]) :-      % O predicado recebe a Posicao a ser removida, a lista e conserva a Cabeca utilizando a Cauda nas chamadas recursivas
    NovaPosicao is Posicao - 1,     % Descresce o a Posicao em 1 unidade em toda repeticao, atribuindo o valor para a variavel NovaPosicao
    remove(Cauda, NovaPosicao, Resto).      % Percorre a lista recursivamente usando a Cauda ate que a NovaPosicao para inserir o elemento seja o primeiro (cabeca)


/*=========================================================
|| Letra D - Retornar o maior valor contido em uma lista ||
=========================================================*/

/* Encontrar o maior valor em uma lista eh uma tarefa que necessita que todos os elementos sejam comparados, 
do primeiro ao ultimo, para isso o predicado deve realizar chamadas recursivas comparando o maior valor com
o restante da lista. */

% USO DO PREDICADO:
% maiorValor(Lista, Resultado)

maiorValor([], Elemento, Elemento).       % Em uma lista de um Elemento, ele eh o maior
maiorValor([Atual|Resto], AntigoMaior, Resultado) :-    % Separa a cabeca (Atual) para comparar com o valor que era considerado o maior (AntigoMaior)
    ( Atual > AntigoMaior ->  maiorValor(Resto, Atual, Resultado); maiorValor(Resto, AntigoMaior, Resultado) ).   % O elemento Atual eh comparado com o AntigoMaior, o maior entre os dois eh usado na recursao
maiorValor([Cabeca|Cauda], Resultado) :- maiorValor(Cauda, Cabeca, Resultado).      % Na primeira iteracao o maior valor eh a Cabeca da lista, dando inicio as chamadas recursivas


/*================================
|| Letra E - Inverter uma lista ||
================================*/

/* Para inverter uma lista eh necessario inserir o elemento cabeca de uma lista em outra recursivamente ate
que a primeira lista esteja vazia e a segunda completa. O metodo de concatenar serve para inserir os elementos
na lista final, tornando o predicado "inverte" mais simples de ser construido. */

% USO DO PREDICADO:
% inverte(Lista, Resultado)

concatena([], Elemento, Elemento).    % Caso base da recursao, um Elemento inserido numa lista vazia eh o proprio Elemento
concatena([Cabeca|Lista1], Lista2, [Cabeca|Lista3]) :-    % Recursivamente junta a Cabeca com a Cauda, formando a Lista3 com os elementos da Lista1 e da Lista2
    concatena(Lista1, Lista2, Lista3).

inverte([], []).    % Caso base da recursao, o inverso de uma lista vazia eh ela mesma
inverte([Cabeca|Resto], ListaInversa) :-      % Separa a Cabeca do Resto para usar nas chamadas recursivas
    inverte(Resto, Lista),     % Recursivamente usa o Resto para realizar novamente o predicado
    concatena(Lista, [Cabeca], ListaInversa).    % Insere a Cabeca na Lista formando a ListaInversa ate que o ultimo elemento seja o primeiro




/*..........................................................................................................
............................................................................................................
....PPPPPPPPPPPPP.....AAAAAAA.......RRRRRRRRRRRRR....TTTTTTTTTTTTTTT.EEEEEEEEEEEEEEE..........22222222......
....PPPPPPPPPPPPPP....AAAAAAA.......RRRRRRRRRRRRRR...TTTTTTTTTTTTTTT.EEEEEEEEEEEEEEE.........2222222222.....
....PPPPPPPPPPPPPP....AAAAAAAA......RRRRRRRRRRRRRRR..TTTTTTTTTTTTTTT.EEEEEEEEEEEEEEE........222222222222....
....PPPPP..PPPPPPPP..AAAAAAAAA......RRRRR...RRRRRRR.......TTTTT......EEEEE..................222222222222....
....PPPPP....PPPPPP..AAAAAAAAA......RRRRR.....RRRRR.......TTTTT......EEEEE.................22222...22222....
....PPPPP.....PPPPP..AAAAAAAAAA.....RRRRR.....RRRRR.......TTTTT......EEEEE.................22222...22222....
....PPPPP....PPPPPP.PAAAA.AAAAA.....RRRRR...RRRRRRR.......TTTTT......EEEEE.........................22222....
....PPPPP..PPPPPPPP.PAAAA.AAAAAA....RRRRRRRRRRRRRR........TTTTT......EEEEEEEEEEEEEE...............22222.....
....PPPPPPPPPPPPPP.PPAAAA..AAAAA....RRRRRRRRRRRRRR........TTTTT......EEEEEEEEEEEEEE..............222222.....
....PPPPPPPPPPPPP..PPAAA...AAAAA....RRRRRRRRRRRR..........TTTTT......EEEEEEEEEEEEEE.............222222......
....PPPPPPPPPPPP...PPAAAAAAAAAAAA...RRRRRRRRRRRR..........TTTTT......EEEEE.....................222222.......
....PPPPP.........PPPAAAAAAAAAAAA...RRRRR..RRRRRR.........TTTTT......EEEEE....................222222........
....PPPPP.........PPPAAAAAAAAAAAA...RRRRR..RRRRRRR........TTTTT......EEEEE...................222222.........
....PPPPP.........PPPAA.....AAAAAA..RRRRR...RRRRRR........TTTTT......EEEEE..................222222..........
....PPPPP........PPPPAA......AAAAA..RRRRR....RRRRRR.......TTTTT......EEEEEEEEEEEEEEE.......2222222222222....
....PPPPP........PPPPA.......AAAAAA.RRRRR.....RRRRRR......TTTTT......EEEEEEEEEEEEEEE.......2222222222222....
....PPPPP........PPPPA.......AAAAAA.RRRRR.....RRRRRR......TTTTT......EEEEEEEEEEEEEEE.......2222222222222....
............................................................................................................
.................................... ARVORE GENEALOGICA DA FAMILIA REAL ....................................
..........................................................................................................*/

/*==========================
|| declaracao dos generos ||
==========================*/

masculino(george).
masculino(spencer).
masculino(philip).
masculino(charles).
masculino(mark).
masculino(andrew).
masculino(edward).
masculino(william).
masculino(harry).
masculino(peter).
masculino(james).

feminino(mum).
feminino(kydd).
feminino(elizabeth).
feminino(margaret).
feminino(diana).
feminino(anne).
feminino(sarah).
feminino(sophie).
feminino(zara).
feminino(beatrice).
feminino(eugenie).
feminino(louise).


/*=========================
|| declaracao dos casais ||
=========================*/

casal(george, mum).
casal(spencer, kid).
casal(elizabeth, philip).
casal(diana, charles).
casal(anne, mark).
casal(andrew, sarah).
casal(edward, sophie).

% casados eh uma relacao simetrica
casados(X, Y) :- casal(X, Y).
casados(X, Y) :- casal(Y, X).


/*============================
|| declaracao dos genitores ||
============================*/

genitor(goerge, elizabeth).
genitor(mum, elizabeth).
genitor(goerge, margaret).
genitor(mum, margaret).

genitor(spencer, diana).
genitor(kydd, diana).

genitor(philip, charles).
genitor(elizabeth, charles).
genitor(philip, anne).
genitor(elizabeth, anne).
genitor(philip, andrew).
genitor(elizabeth, andrew).
genitor(philip, edward).
genitor(elizabeth, edward).

genitor(charles, william).
genitor(diana, william).
genitor(charles, harry).
genitor(diana, harry).

genitor(mark, peter).
genitor(anne, peter).
genitor(mark, zara).
genitor(anne, zara).

genitor(andrew, beatrice).
genitor(sarah, beatrice).
genitor(andrew, eugenie).
genitor(sarah, eugenie).

genitor(edward, louise).
genitor(sophie, louise).
genitor(edward, james).
genitor(sophie, james).


/*=============================
|| declaracao dos predicados ||
=============================*/

% para ser X ser neto de Z eh necessario que Z seja genitor de Y e esse mesmo Y seja genitor de X.
netoOUneta(X, Z) :- genitor(Z, Y), genitor(Y, X).

% para W ser bisavo de Z eh preciso que W seja genitor de um X, este sendo genitor de um Y, que por sua vez eh genitor de Z.
bisavo(W, Z) :- genitor(W, X), genitor(X, Y), genitor(Y, Z).

% para saber se um X qualquer eh ancestral de Z eh necessario que o predicado realize chamadas recursivas verificando se existe uma relacao de genitores conectando X e Z.
ancestral(X, Z) :- genitor(X, Z).
ancestral(X, Z) :- genitor(Y, Z), ancestral(X, Y).

% para X ser irmao de Y eh necessario que tenham os mesmos genitores, alem de que X deve ser do genero maculino e X seja diferente de Y, evitando que uma pessoa seja irmao de si proprio.
irmao(X, Y) :- genitor(Z, X), genitor(Z, Y), masculino(X), X \= Y.

% analogamente, o conceito anterior vale para irmas, com a diferenca de que X precisa ser do genero feminino.
irma(X, Y) :- genitor(Z, X), genitor(Z, Y), feminino(X), X \= Y.

% para X ser filho de Y eh preciso que Y seja genitor de X e que X seja masculino.
filho(X, Y) :- genitor(Y, X), masculino(X).

% analogamente, o mesmo conceito vale para filha, com a diferenca de que X deve ser feminino.
filha(X, Y) :- genitor(Y, X), feminino(X).

% X e Y sendo primos de primeiro grau possuem avos em comum, com excecao do caso onde X e Y sao irmaos ou a mesma pessoa, a funcao restringe X como masculino.
primoIrmao(X, Y) :- netoOUneta(X, Z), netoOUneta(Y, Z), masculino(X), not(irmao(X, Y)), X \= Y.

% existem dois casos de cunhados, onde X eh cunhado de Z por Z ser casado com seu/sua irmao/irma e o caso em que X eh casado com Y, que por sua vez eh irmao/irma de Z.
cunhado(X, Z) :- casados(Y, Z), irmao(X, Y).
cunhado(X, Z) :- casados(X, Y), (irmao(Y, Z) ; irma(Y, Z)), masculino(X).

% o mesmo conceito anterior se aplica para cunhadas, com a diferenca de que X deve ser feminino.
cunhada(X, Z) :- casados(Y, Z), irma(X, Y).
cunhada(X, Z) :- casados(X, Y), (irmao(Y, Z) ; irma(Y, Z)), feminino(X).

% para X ser tia de Y eh necessario que X seja irma de um Z que seja genitor(a) de Y.
tia(X, Y) :- irma(X, Z), genitor(Z, Y).

% analogamente, um tio eh irmao do pai/mae de Y.
tio(X, Y) :- irmao(X, Z), genitor(Z, Y).
