/*facts*/

male(faiyaz).
male(farid).
male(ashraf).
male(mohsin).
male(tanvir).
male(sarder).
male(rana).
male(kudus).
male(rahman).
male(bhuiyan).
male(mukhtar).
male(sohail).
male(karim).
male(rahim).
male(farouk).
male(yasin).
male(aziz).
male(habib).
male(rashiq).
male(nawaz).
male(jalal).
male(zaman).
male(fazlul).
male(zahir).
male(taher).
male(nahid).
male(nuhash).
male(jahin).

female(rukhsar).
female(jamila).
female(jahanara).
female(sadia).
female(marzia).
female(farzana).
female(nargis).
female(shabnam).
female(rabia).
female(shirin).
female(asma).
female(jamila).
female(lubna).
female(rahsiqa).
female(zeba).
female(lubna).
female(jasmin).
female(rokeya).
female(lubna).
female(shirin).
female(ferdousi).
female(zainab).
female(nakiba).
female(nasiha).
female(nusrat).
female(nasiha).
female(naima).
female(nayanika).

/* Knowledge */
father(faiyaz,farid).
father(faiyaz,ashraf).
father(farid,mohsin).
father(farid,tanvir).
father(mohsin,kudus).
father(kudus,mukhtar).
father(kudus,sohail).
father(mukhtar,yasin).
father(sohail,aziz).
father(sohail,habib).
father(aziz,lubna).
father(tanvir,asma).
father(ashraf,sarder).
father(ashraf,rana).
father(sarder,rahman).
father(rahman,karim).
father(rahman,rahim).
father(karim,nizami).
father(rahim,rashiq).
father(nizami,ferdousi).
father(rashiq,zaman).
father(nawaz,fazlul).
father(zaman,zahir).
father(tanvir,taher).
father(taher,nasiha).
father(taher,nahid).
father(nahid,nuhash).
father(nuhash,jahin).

mother(rukhsar,farid).
mother(rukhsar,ashraf).
mother(jamila,mohsin).
mother(jamila,tanvir).
mother(marzia,asma).
mother(shabnam,mukhtar).
mother(shabnam,sohail).
mother(raisa,yasin).
mother(taslima,aziz).
mother(taslima,habib).
mother(jahanara,sarder).
mother(jahanara,rana).
mother(farzana,rahman).
mother(nargis,bhuiyan).
mother(rabia,karim).
mother(rabia,rahim).
mother(shirin,farouk).
mother(jasmin,nizami).
mother(rahima,rashiq).
mother(nizami,ferdousi).
mother(rashiqa,zaman).
mother(nadia,nawaz).
mother(lubna,fazlul).
mother(zainab,zahir).
mother(marzia,taher).
mother(nakiba,nasiha).
mother(naima,nuhash).
mother(nayanika,jahin).

/*rules*/

parent(X,Y):-
     mother(X,Y);
     father(X,Y).

sibling(X,Y):-
    parent(Z,X),
    parent(Z,Y),
    X\=Y.

sibling(Y,X):-
    parent(Z,X),
    parent(Z,Y),
    X\=Y.

grandparent(X,Y):-
     parent(Z,Y),
     parent(X,Z).


greatgrandparent(X,Y):-
    parent(X,P),
    parent(P,Z),
    parent(Z,Y).

greatgreatgrandparent(X,Y):-
     parent(A,Y),
     parent(B,A),
     parent(C,B),
     parent(X,C).

firstcousin(Y,X):-
    parent(Z,X),
    parent(W,Y),
    sibling(Z,W).

secondcousin(X,Y):-
    greatgrandparent(Z,X),
    greatgrandparent(Z,Y),
    \+firstcousin(X,Y),
    \+sibling(X,Y),
    X\=Y.
	
thirdcousin(X,Y):-
    greatgreatgrandparent(Z,X),
    greatgreatgrandparent(Z,Y),
    \+firstcousin(X,Y),
    \+secondcousin(X,Y),
    \+sibling(X,Y),
    X\=Y.

firstcousin_onceremoved(X,Y):-
    parent(Z,Y),
    firstcousin(X,Z).

firstcousin_twiceremoved(X,Y):-
    firstcousin(X,Z),
    grandparent(Z,Y).

secondcousin_onceremoved(X,Y):-
     parent(Z,Y),
     secondcousin(X,Z).

secondcousin_twiceremoved(X,Y):-
     grandparent(Z,Y),
     secondcousin(X,Z).
     

thirdcousin_onceremoved(X,Y):-
     parent(Z,Y),
     thirdcousin(X,Z).

thirdcousin_twiceremoved(X,Y):-
     grandparent(Z,Y),
     thirdcousin(X,Z).