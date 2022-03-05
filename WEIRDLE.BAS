Hierbeginthet:
CLEAR
SCREEN 0
WIDTH 80, 25
BLOAD "WEIRDLE.WP1"

DIM music(1000) AS SINGLE
FOR i = 1 TO 34
READ music(i)
NEXT i
DATA 64,70,83,105,64,105,83,105,64,105,93,110,64,110,93,110,64,110,105,125,64,125,105,125,64,125,140,125,112,105,112,105,93,83

LUS:
KEY 1, "Û"
  
FOR t = 1 TO 34
SOUND music(t), 3
    a$ = INKEY$
    IF a$ = "Û" THEN GOTO Helpscreen
    IF a$ = CHR$(27) THEN COLOR 15, 0: CLS : PRINT " Bye-bye!": PRINT : END
    IF a$ <> "" THEN GOTO BEGIN:
    drum = drum + 1
    IF drum = 2 THEN SOUND 158, .3: SOUND 97, .3: LET drum = 0
    IF a$ = CHR$(27) THEN COLOR 15, 0: CLS : PRINT " Bye-bye!": PRINT : END
NEXT t

a$ = INKEY$
SLEEP (5)
GOTO LUS:

BEGIN:
CLEAR
'*** BACKGROUND ***
COLOR 8, 1
CLS
COLOR 7, 1: LOCATE 1, 1: PRINT "Ú"; STRING$(78, 196); "¿";
FOR a = 2 TO 24
    COLOR 7, 1: LOCATE a, 1: PRINT "³";
    COLOR 7, 1: LOCATE a, 80: PRINT "³";
NEXT a
COLOR 7, 1: LOCATE 25, 1: PRINT "À"; STRING$(78, 196); "Ù";
FOR r = 1 TO 16 STEP 3
    COLOR 8, 0: LOCATE 2 + r, 28: PRINT "ÚÄÄÄ¿ÚÄÄÄ¿ÚÄÄÄ¿ÚÄÄÄ¿ÚÄÄÄ¿"
    COLOR 8, 0: LOCATE 3 + r, 28: PRINT "³   ³³   ³³   ³³   ³³   ³"
    COLOR 8, 0: LOCATE 4 + r, 28: PRINT "ÀÄÄÄÙÀÄÄÄÙÀÄÄÄÙÀÄÄÄÙÀÄÄÄÙ"
NEXT r
LOCATE 2, 3: COLOR 7, 1: PRINT "WEIRDLE"
LOCATE 24, 72: COLOR 7, 1: PRINT "WEIRDLE";
'LOCATE 2, 57: COLOR 7, 1: PRINT "BEACE=";
LOCATE 2, 3: COLOR 7, 1: PRINT "WEIRDLE"
LOCATE 24, 3: COLOR 8, 1: PRINT "PRESS ESC TO EXIT";


'*** WORD ***
DIM word$(10000)
RANDOMIZE TIMER
Readthatword:
DO
    READ word$
IF word$ = "EIND" THEN EXIT DO
    n = n + 1
    word$(n) = word$
LOOP
r = RND * (n - 1) + 1
word$ = UCASE$(word$(r))

'*** remove the ' if you want to see the right word. ***
' LOCATE 4, 4: PRINT word$

DATA poops,chong,chunk,hauls,meals,water,casio,weird,crazy,farts,bones
DATA atari,trash,beach,juice,video,about,above,abuse,actor,acute,admit
DATA adopt,adult,after,again,agent,agree,ahead,alarm,album,alert,alike
DATA alive,allow,alone,along,alter,among,anger,Angle,angry,apart,apple
DATA apply,arena,argue,arise,array,aside,asset,audio,audit,avoid,award
DATA aware,badly,baker,bases,basic,basis,beach,began,begin,begun,being
DATA below,bench,billy,birth,black,blame,blind,block,blood,board,boost
DATA booth,bound,brain,brand,bread,break,breed,brief,bring,broad,broke
DATA brown,build,built,buyer,cable,calif,carry,catch,cause,chain,chair
DATA chart,chase,cheap,check,chest,chief,child,china,chose,civil,claim
DATA class,clean,clear,click,clock,close,coach,coast,could,count,court
DATA cover,craft,crash,cream,crime,cross,crowd,crown,curve,cycle,daily
DATA dance,dated,dealt,death,debut,delay,depth,doing,doubt,dozen,draft
DATA drama,drawn,dream,dress,drill,drink,drive,drove,dying,eager,early
DATA earth,eight,elite,empty,enemy,enjoy,enter,entry,equal,error,event
DATA every,exact,exist,extra,faith,false,fault,fiber,field,fifth,fifty
DATA fight,final,first,fixed,flash,fleet,floor,fluid,focus,force,forth
DATA forty,forum,found,frame,frank,fraud,fresh,front,fruit,fully,funny
DATA giant,given,glass,globe,going,grace,grade,grand,grant,grass,great
DATA green,gross,group,grown,guard,guess,guest,guide,happy,harry,heart
DATA heavy,hence,henry,horse,hotel,house,human,ideal,image,index,inner
DATA input,union,unity,until,upper,upset,urban,usage,usual,valid,value
DATA video,virus,visit,vital,voice,waste,watch,water,wheel,where,which
DATA while,white,whole,whose,woman,women,world,worry,worse,worst,worth
DATA would,wound,write,wrong,wrote,yield,young,youth,issue,japan,jimmy
DATA joint,jones,judge,known,label,large,laser,later,laugh,layer,learn
DATA lease,least,leave,legal,level,lewis,light,limit,links,lives,local
DATA logic,loose,lower,lucky,lunch,lying,magic,major,maker,march,maria
DATA match,maybe,mayor,meant,media,metal,might,minor,minus,mixed,model
DATA money,month,moral,motor,mount,mouse,mouth,movie,music,needs,never
DATA newly,night,noise,north,noted,novel,nurse,occur,ocean,offer,often
DATA order,other,ought,paint,panel,paper,party,peace,peter,phase,phone
DATA photo,piece,pilot,pitch,place,plain,plane,plant,plate,point,pound
DATA power,press,price,pride,prime,print,prior,prize,proof,proud,prove
DATA queen,quick,quiet,quite,radio,raise,range,rapid,ratio,reach,ready
DATA refer,right,rival,river,robin,roger,roman,rough,round,route,royal
DATA rural,scale,scene,scope,score,sense,serve,seven,shall,shape,share
DATA sharp,sheet,shelf,shell,shift,shirt,shock,shoot,short,shown,sight
DATA since,sixth,sixty,sized,skill,sleep,slide,small,smart,smile,smith
DATA smoke,solid,solve,sorry,sound,south,space,spare,speak,speed,spend
DATA spent,split,spoke,sport,staff,stage,stake,stand,start,state,steam
DATA steel,stick,still,stock,stone,stood,store,storm,story,strip,stuck
DATA study,stuff,style,sugar,suite,super,sweet,table,taken,taste,taxes
DATA teach,teeth,terry,texas,thank,theft,their,theme,there,these,thick
DATA thing,think,third,those,three,threw,throw,tight,times,tired,title
DATA today,topic,total,touch,tough,tower,track,trade,train,treat,trend
DATA trial,tried,tries,truck,truly,trust,truth,twice,under,undue,EIND

'*** INPUT ***

WordGuess:

'*** If the string had < 4 characters, pick a new word ***

IF LEN(word$) < 4 THEN CLEAR : GOTO Readthatword:

FOR beurt = 1 TO 6 STEP 1 ' You can gues six times


    COLOR 9, 1
    LOCATE 21, 37: PRINT "ÚÄÄÄÄÄ¿";
    LOCATE 22, 37: PRINT "³     ³";
    LOCATE 23, 37: PRINT "ÀÄÄÄÄÄÙ";
    COLOR 15, 1: LOCATE 22, 38: PRINT STRING$(5, 8);
1
    invoer$ = INKEY$
    IF invoer$ <> "" THEN LET a = ASC(UCASE$(invoer$))
    IF a < 65 AND a > 91 THEN invoer$ = ""
    IF invoer$ <> "" AND a > 64 AND a < 91 THEN LET teller = teller + 1
    IF invoer$ = CHR$(13) AND teller = 5 THEN GOTO ingevoerd:  ELSE BEEP
    IF invoer$ = CHR$(13) AND teller < 5 THEN SOUND 700, .05: LET teller = 0: eersteletter$ = "": tweedeletter$ = "": derdeletter$ = "": vierdeletter$ = "": vijfdeletter$ = "": COLOR 15, 1: LOCATE 22, 38: PRINT STRING$(5, 8);
    IF invoer$ <> "" AND teller = 1 THEN LET eersteletter$ = UCASE$(invoer$)
    IF invoer$ <> "" AND teller = 2 THEN LET tweedeletter$ = UCASE$(invoer$)
    IF invoer$ <> "" AND teller = 3 THEN LET derdeletter$ = UCASE$(invoer$)
    IF invoer$ <> "" AND teller = 4 THEN LET vierdeletter$ = UCASE$(invoer$)
    IF invoer$ <> "" AND teller = 5 THEN LET vijfdeletter$ = UCASE$(invoer$): woordcompleet = 1
    IF teller < 0 THEN LET teller = 0
    IF teller > 5 THEN LET teller = 5
    IF invoer$ = CHR$(8) THEN SOUND 700, .05: LET teller = 0: eersteletter$ = "": tweedeletter$ = "": derdeletter$ = "": vierdeletter$ = "": vijfdeletter$ = "": COLOR 15, 1: LOCATE 22, 38: PRINT STRING$(5, 8);
    LOCATE 22, 44: COLOR 7, 1: PRINT teller
    COLOR 15, 1:
    LOCATE 22, 38: PRINT eersteletter$
    LOCATE 22, 39: PRINT tweedeletter$
    LOCATE 22, 40: PRINT derdeletter$
    LOCATE 22, 41: PRINT vierdeletter$
    LOCATE 22, 42: PRINT vijfdeletter$
    IF invoer$ = CHR$(27) THEN COLOR 15, 0: CLS : PRINT " Bye-bye!": PRINT : END
    GOTO 1
ingevoerd:
    guess$ = eersteletter$ + tweedeletter$ + derdeletter$ + vierdeletter$ + vijfdeletter$
    teller = 0: eersteletter$ = "": tweedeletter$ = "": derdeletter$ = "": vierdeletter$ = "": vijfdeletter$ = ""
   
 ' Splits string into seprate letters
    g1$ = MID$(guess$, 1, 1)
    g2$ = MID$(guess$, 2, 1)
    g3$ = MID$(guess$, 3, 1)
    g4$ = MID$(guess$, 4, 1)
    g5$ = MID$(guess$, 5, 1)

    ' Splits picked word into seprate letters
    L1$ = MID$(word$, 1, 1)
    L2$ = MID$(word$, 2, 1)
    L3$ = MID$(word$, 3, 1)
    L4$ = MID$(word$, 4, 1)
    l5$ = MID$(word$, 5, 1)


    ' Checking for double letters
    IF g1$ = g2$ OR g1$ = g3$ OR g1$ = g4$ OR g1$ = g5$ THEN letter1dubbel = 1
    IF g2$ = g1$ OR g2$ = g3$ OR g2$ = g4$ OR g2$ = g5$ THEN letter2dubbel = 1
    IF g3$ = g1$ OR g3$ = g2$ OR g3$ = g4$ OR g3$ = g5$ THEN letter3dubbel = 1
    IF g4$ = g1$ OR g4$ = g2$ OR g4$ = g3$ OR g4$ = g5$ THEN letter4dubbel = 1
    IF g5$ = g1$ OR g5$ = g2$ OR g5$ = g3$ OR g5$ = g4$ THEN letter5dubbel = 1


    ' variable 1 means correct, 2 means wrong position
    IF LETTER1 <> 1 AND g1$ = L2$ OR g1$ = L3$ OR g1$ = L4$ OR g1$ = l5$ THEN LETTER1 = 2
    IF letter2 <> 1 AND g2$ = L1$ OR g2$ = L3$ OR g2$ = L4$ OR g2$ = l5$ THEN letter2 = 2
    IF letter3 <> 1 AND g3$ = L1$ OR g3$ = L2$ OR g3$ = L4$ OR g3$ = l5$ THEN letter3 = 2
    IF letter4 <> 1 AND g4$ = L1$ OR g4$ = L2$ OR g4$ = L3$ OR g4$ = l5$ THEN letter4 = 2
    IF letter5 <> 1 AND g5$ = L1$ OR g5$ = L2$ OR g5$ = L3$ OR g5$ = L4$ THEN letter5 = 2


    ' If the letter is in the right position, then give it the value 1.
    IF g1$ = L1$ THEN LETTER1 = 1
    IF g2$ = L2$ THEN letter2 = 1
    IF g3$ = L3$ THEN letter3 = 1
    IF g4$ = L4$ THEN letter4 = 1
    IF g5$ = l5$ THEN letter5 = 1


    getal = getal + 3 ' Skips 3 lines so the guessed words appear in the
    ' boxes.

    ' Shows letters, with different colors depening on the value.

    IF letter1dubbel = 1 AND LETTER1 <> 1 THEN LETTER1 = 0
    IF LETTER1 = 2 THEN COLOR 15, 6: LOCATE getal, 28: PRINT "ÚÄÄÄ¿"; : LOCATE 1 + getal, 28: PRINT "³ "; UCASE$(g1$); " ³"; : LOCATE 2 + getal, 28: PRINT "ÀÄÄÄÙ"; : SOUND 400, 2: SOUND 29999, 4
    IF LETTER1 = 1 THEN COLOR 15, 2: LOCATE getal, 28: PRINT "ÚÄÄÄ¿"; : LOCATE 1 + getal, 28: PRINT "³ "; UCASE$(g1$); " ³"; : LOCATE 2 + getal, 28: PRINT "ÀÄÄÄÙ"; : SOUND 800, 2: SOUND 29999, 4
    IF LETTER1 = 0 THEN COLOR 15, 7: LOCATE getal, 28: PRINT "ÚÄÄÄ¿"; : LOCATE 1 + getal, 28: PRINT "³ "; UCASE$(g1$); " ³"; : LOCATE 2 + getal, 28: PRINT "ÀÄÄÄÙ"; : SOUND 99, 2: SOUND 29999, 4

    IF letter2dubbel = 1 AND letter2 <> 1 THEN letter2 = 0
    IF letter2 = 2 THEN COLOR 15, 6: LOCATE getal, 33: PRINT "ÚÄÄÄ¿"; : LOCATE 1 + getal, 33: PRINT "³ "; UCASE$(g2$); " ³"; : LOCATE 2 + getal, 33: PRINT "ÀÄÄÄÙ"; : SOUND 400, 2: SOUND 29999, 4
    IF letter2 = 1 THEN COLOR 15, 2: LOCATE getal, 33: PRINT "ÚÄÄÄ¿"; : LOCATE 1 + getal, 33: PRINT "³ "; UCASE$(g2$); " ³"; : LOCATE 2 + getal, 33: PRINT "ÀÄÄÄÙ"; : SOUND 800, 2: SOUND 29999, 4
    IF letter2 = 0 THEN COLOR 15, 7: LOCATE getal, 33: PRINT "ÚÄÄÄ¿"; : LOCATE 1 + getal, 33: PRINT "³ "; UCASE$(g2$); " ³"; : LOCATE 2 + getal, 33: PRINT "ÀÄÄÄÙ"; : SOUND 99, 2: SOUND 29999, 4

    IF letter3dubbel = 1 AND letter3 <> 1 THEN letter3 = 0
    IF letter3 = 2 THEN COLOR 15, 6: LOCATE getal, 38: PRINT "ÚÄÄÄ¿"; : LOCATE 1 + getal, 38: PRINT "³ "; UCASE$(g3$); " ³"; : LOCATE 2 + getal, 38: PRINT "ÀÄÄÄÙ"; : SOUND 400, 2: SOUND 29999, 4
    IF letter3 = 1 THEN COLOR 15, 2: LOCATE getal, 38: PRINT "ÚÄÄÄ¿"; : LOCATE 1 + getal, 38: PRINT "³ "; UCASE$(g3$); " ³"; : LOCATE 2 + getal, 38: PRINT "ÀÄÄÄÙ"; : SOUND 800, 2: SOUND 29999, 4
    IF letter3 = 0 THEN COLOR 15, 7: LOCATE getal, 38: PRINT "ÚÄÄÄ¿"; : LOCATE 1 + getal, 38: PRINT "³ "; UCASE$(g3$); " ³"; : LOCATE 2 + getal, 38: PRINT "ÀÄÄÄÙ"; : SOUND 99, 2: SOUND 29999, 4

    IF letter4dubbel = 1 AND letter4 <> 1 THEN letter4 = 0
    IF letter4 = 2 THEN COLOR 15, 6: LOCATE getal, 43: PRINT "ÚÄÄÄ¿"; : LOCATE 1 + getal, 43: PRINT "³ "; UCASE$(g4$); " ³"; : LOCATE 2 + getal, 43: PRINT "ÀÄÄÄÙ"; : SOUND 400, 2: SOUND 29999, 4
    IF letter4 = 1 THEN COLOR 15, 2: LOCATE getal, 43: PRINT "ÚÄÄÄ¿"; : LOCATE 1 + getal, 43: PRINT "³ "; UCASE$(g4$); " ³"; : LOCATE 2 + getal, 43: PRINT "ÀÄÄÄÙ"; : SOUND 800, 2: SOUND 29999, 4
    IF letter4 = 0 THEN COLOR 15, 7: LOCATE getal, 43: PRINT "ÚÄÄÄ¿"; : LOCATE 1 + getal, 43: PRINT "³ "; UCASE$(g4$); " ³"; : LOCATE 2 + getal, 43: PRINT "ÀÄÄÄÙ"; : SOUND 99, 2: SOUND 29999, 4
 
    IF letter5dubbel = 1 AND letter5 <> 1 THEN letter5 = 0
    IF letter5 = 2 THEN COLOR 15, 6: LOCATE getal, 48: PRINT "ÚÄÄÄ¿"; : LOCATE 1 + getal, 48: PRINT "³ "; UCASE$(g5$); " ³"; : LOCATE 2 + getal, 48: PRINT "ÀÄÄÄÙ"; : SOUND 400, 2: SOUND 29999, 4
    IF letter5 = 1 THEN COLOR 15, 2: LOCATE getal, 48: PRINT "ÚÄÄÄ¿"; : LOCATE 1 + getal, 48: PRINT "³ "; UCASE$(g5$); " ³"; : LOCATE 2 + getal, 48: PRINT "ÀÄÄÄÙ"; : SOUND 800, 2: SOUND 29999, 4
    IF letter5 = 0 THEN COLOR 15, 7: LOCATE getal, 48: PRINT "ÚÄÄÄ¿"; : LOCATE 1 + getal, 48: PRINT "³ "; UCASE$(g5$); " ³"; : LOCATE 2 + getal, 48: PRINT "ÀÄÄÄÙ"; : SOUND 99, 2: SOUND 29999, 4
    '
    IF L1$ = g1$ AND L2$ = g2$ AND L3$ = g3$ AND L4$ = g4$ AND l5$ = g5$ THEN GOTO winner:

    ' deletes the input
    g1$ = "": g2$ = "": g3$ = "": g4$ = "": g5$ = ""


    ' resets the status of letter1-4
    LETTER1 = 0: letter2 = 0: letter3 = 0: letter4 = 0: letter5 = 0

    ' resets the doubleletterstatus
    letter1dubbel = 0: letter2dubbel = 0: letter3dubbel = 0: letter4dubbel = 0: letter5dubbel = 0:


NEXT beurt ' Moves to next guessing attempt of the six attempts.

GOTO LOSER:

END
winner:
FOR a = 1 TO 7
    COLOR 15, a: LOCATE getal, 28: PRINT "ÚÄÄÄ¿"; : LOCATE 1 + getal, 28: PRINT "³ "; UCASE$(g1$); " ³"; : LOCATE 2 + getal, 28: PRINT "ÀÄÄÄÙ"; : SOUND 100, .5
    SOUND 58, 1
    COLOR 15, a: LOCATE getal, 33: PRINT "ÚÄÄÄ¿"; : LOCATE 1 + getal, 33: PRINT "³ "; UCASE$(g2$); " ³"; : LOCATE 2 + getal, 33: PRINT "ÀÄÄÄÙ"; : SOUND 200, .5
    SOUND 58, 1
    COLOR 15, a: LOCATE getal, 38: PRINT "ÚÄÄÄ¿"; : LOCATE 1 + getal, 38: PRINT "³ "; UCASE$(g3$); " ³"; : LOCATE 2 + getal, 38: PRINT "ÀÄÄÄÙ"; : SOUND 400, .5
    SOUND 58, 1
    COLOR 15, a: LOCATE getal, 43: PRINT "ÚÄÄÄ¿"; : LOCATE 1 + getal, 43: PRINT "³ "; UCASE$(g4$); " ³"; : LOCATE 2 + getal, 43: PRINT "ÀÄÄÄÙ"; : SOUND 800, .5
    SOUND 58, 1
    COLOR 15, a: LOCATE getal, 48: PRINT "ÚÄÄÄ¿"; : LOCATE 1 + getal, 48: PRINT "³ "; UCASE$(g5$); " ³"; : LOCATE 2 + getal, 48: PRINT "ÀÄÄÄÙ"; : SOUND 1600, .5
    SOUND 58, 1
NEXT a
FOR a = 2 TO 2
    COLOR 15, a: LOCATE getal, 28: PRINT "ÚÄÄÄ¿"; : LOCATE 1 + getal, 28: PRINT "³ "; UCASE$(g1$); " ³"; : LOCATE 2 + getal, 28: PRINT "ÀÄÄÄÙ"; : SOUND 100, .5
    COLOR 15, a: LOCATE getal, 33: PRINT "ÚÄÄÄ¿"; : LOCATE 1 + getal, 33: PRINT "³ "; UCASE$(g2$); " ³"; : LOCATE 2 + getal, 33: PRINT "ÀÄÄÄÙ"; : SOUND 200, .5
    COLOR 15, a: LOCATE getal, 38: PRINT "ÚÄÄÄ¿"; : LOCATE 1 + getal, 38: PRINT "³ "; UCASE$(g3$); " ³"; : LOCATE 2 + getal, 38: PRINT "ÀÄÄÄÙ"; : SOUND 400, .5
    COLOR 15, a: LOCATE getal, 43: PRINT "ÚÄÄÄ¿"; : LOCATE 1 + getal, 43: PRINT "³ "; UCASE$(g4$); " ³"; : LOCATE 2 + getal, 43: PRINT "ÀÄÄÄÙ"; : SOUND 800, .5
    COLOR 15, a: LOCATE getal, 48: PRINT "ÚÄÄÄ¿"; : LOCATE 1 + getal, 48: PRINT "³ "; UCASE$(g5$); " ³"; : LOCATE 2 + getal, 48: PRINT "ÀÄÄÄÙ"; : SOUND 1600, .5
NEXT a
GOTO BEGIN:

LOSER:
COLOR 7, 0
CLS
WIDTH 80, 25
LOCATE 25, 14: COLOR 30, 0: PRINT "SORRY, YOU DIDN'T GUESS THE WORD. THE WORD WAS "; CHR$(34); word$; CHR$(34); "."
LOCATE 1, 1
FOR a = 1 TO 80 STEP 5
    FOR B = 1 TO 24
        achtergrondkleur = INT(RND * 7)
        voorgrondkleur = INT(RND * 7) + 7
        COLOR voorgrondkleur, achtergrondkleur
        LOCATE B, a: PRINT word$;
    NEXT B
NEXT a
FOR a = 1999 TO 1 STEP -90
    FOR f = 1 TO 50
        SOUND 50 + f + a, .04
        SOUND 48 + f + f + f + a, .025
    NEXT f
NEXT a
GOTO BEGIN

END
Helpscreen:
BLOAD "weirdle.WP2"
Luske:
f$ = INKEY$
IF f$ <> "" THEN GOTO Hierbeginthet:
COLOR 15, 1
LOCATE 3, 27: PRINT "Frequently Asked Questions"
COLOR 14, 1
LOCATE 5, 4: PRINT "Q: What is Weirdle?"
COLOR 10, 1
LOCATE 6, 4: PRINT "A: Weird Paul's word game, comparable to games like Wordle."
COLOR 14, 1
LOCATE 7, 4: PRINT "Q: What is the object of the game?"
COLOR 10, 1
LOCATE 8, 4: PRINT "A: To guess a five letter word."


COLOR 14, 1
LOCATE 9, 4: PRINT "Q: What do the colors mean?"
COLOR 10, 1
LOCATE 10, 4: PRINT "A: White: The letter is wrong, orange: The letter you see is right but in"
LOCATE 11, 4: PRINT "   the wrong position, green: The letter you see is right and in the right"
LOCATE 12, 4: PRINT "   position."


COLOR 14, 1
LOCATE 13, 4: PRINT "Q: How many words are there in the Weirdle database?"
COLOR 10, 1
LOCATE 14, 4: PRINT "A: Over 500 English words."

COLOR 14, 1
LOCATE 15, 4: PRINT "Q: What is the brand of Weird Paul's water heater?"
COLOR 10, 1
LOCATE 16, 4: PRINT "A: Good question. It's State Select."

COLOR 14, 1
LOCATE 17, 4: PRINT "Q: What is one of Weird Paul's favorite foods?"
COLOR 10, 1
LOCATE 18, 4: PRINT "A: Peanut butter."

COLOR 14, 1
LOCATE 19, 4: PRINT "Q: What brands did he try?"
COLOR 10, 1
LOCATE 20, 4: PRINT "A: Many, including brands like Jif, Peter Pan, Skippy, Superman, Reeses,"
LOCATE 21, 4: PRINT "   Smuckers, and Planters."

COLOR 14, 1
LOCATE 22, 4: PRINT "Q: Why are there ridiculous questions in this Q&A?"
COLOR 10, 1
LOCATE 23, 4: PRINT "A: I don't know. Stop asking them frequently!"

LOCATE 4, 26: COLOR 27: PRINT "<<Press any key to return>>";
GOTO Luske
END

