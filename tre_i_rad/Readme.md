#  Beskrivning


##Tre-i-rad - Examinationsuppgift 1

Skapa ett Tre-i-rad spel som kan spelas av två mänskliga spelare. Varje spelare turas om att ange var i ett 3x3-rutnät som spelaren önskar placera X (eller O). När en spelare har tre X (eller O) i rad horisontellt, vertikalt eller diagonalt så vinner spelaren, och spelet skall meddela detta och avsluta. Har ingen spelare tre i rad när inga tomma rutor finns kvar längre, så ska spelet vara oavgjort.

Spelet måste vara en native iOS app som är skriven i Swift och som använder sig utav UIKit (Storyboard).

## Krav

### För godkänt krävs samtliga punkter nedan:

• Spelet måste vara spelbart mellan två mänskliga spelare som kan turas om.
• Spelet ska kontrollera och meddela vilken spelare som vunnit eller om spelet slutat oavgjort
• Spelet ska vid varje drag kontrollera att den valda rutan är tom, så att man inte kan lägga ett X eller O på en ruta som redan innehåller ett X eller O.
• När en spelare vunnit så ska spelet avslutas, och antingen börja om från början
alternativt gå tillbaka till en startmeny (om ni väljer att lägga en startmeny)
• All er kod ska vara skriven på engelska. Det vill säga variabelnamn, kommentarer,
klassnamn samt metodnamn.
• Projektet skall läggas upp som ett GitHub repository, och länkas till det när det lämnas in.

### För väl godkänt krävs samtliga punkter ovan, samt punkterna nedan:

• Spelarna kan ange sina namn och vid varje drag skriva ut vems tur det är.
• Spelet ska räkna och hålla koll på hur många vinster en spelare har totalt.
• Koden håller sig till MVC mönstret, d.v.s. a6 separera eran logik från vyn.
• Komplett Github historik från att ni skapat projektet till att ni slufört det.
• Spelet ska ha stöd för att spela mot datorspelare som slumpar fram sina drag.

## Redovisning

Projektet skall redovisas individuellt den 26 september
