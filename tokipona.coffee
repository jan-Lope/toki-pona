getRandomEntry = ->
  dictionary[Math.floor Math.random() * dictionary.length]


filterEntry = (exp, prefix='') ->
  try re = new RegExp "#{prefix}#{exp.trim()}" catch then return -> false
  return (entry) -> re.test(entry.tokipona) or re.test(entry.english)


search = (exp) ->
  if !exp then return []
  exactMatches = dictionary.filter filterEntry exp, '^'
  otherMatches = dictionary.filter((e) -> e not in exactMatches).filter filterEntry exp
  return exactMatches.concat(otherMatches)[...100]


setSearchResults = ->
  results = search document.getElementById('search').value
  document.getElementById('results').innerHTML = results.map((e) -> "#{e.tokiponaHTML} :: #{e.englishHTML}").join '<br />'


setSearchValue = (text) ->
  document.getElementById('search').value = text
  setSearchResults()


selectable = (text) ->
  text.replace /[A-Za-z]+/g, (word) -> """
    <a onclick='tokipona.setSearchValue("#{word}")'>#{word}</a>
  """


#
#
#
onclickRandomState = null

pickQuestionAndAnswer = ->
  if !onclickRandomState
    entry = getRandomEntry()

    [q, a] = if Math.random() > .5 then ['tokipona', 'english'] else ['english', 'tokipona']
    onclickRandomState =
      question: entry[q+'HTML']
      answer: entry[a+'HTML']

    document.getElementById('question').innerHTML = onclickRandomState.question
    document.getElementById('answer').innerHTML = '?'

  else
    document.getElementById('answer').innerHTML = onclickRandomState.answer
    onclickRandomState = null


#
#
#
window.tokipona = {pickQuestionAndAnswer, setSearchResults, setSearchValue}


#
#
#
dictionary = '''
   ... o tawa tomo sina! :: ... go to your house! 
   a a a! ni li musi.   :: Hahaha! That's funny.  
   a! akesi li wile moku e mi!   :: Ahh! The dinosaur wants to eat me!  
   ijo ike li lon monsi mi.   :: Bad things are behind me. 
   ijo li lon oko mi.   :: Something is in my eye.  
   ijo li lukin e mi.   :: Something is watching me. 
   ilo li lon poki.   :: The tools are in the container.  
   jan Lisa o, toki.   :: Hello, Lisa.  
   jan Susan li nasa.   :: Susan is crazy.  
   jan ike li kama la o seli e lipu ni.   :: If the enemy comes, burn these papers.  
   jan ike li utala e ona mute.   :: An enemy is attacking them. 
   jan ike ni li jo e len nasa.   :: That bad person has strange clothes.  
   jan jelo laso lili li kama tan sewi.    :: A little green person came from the sky.  
   jan laso jelo lili li kama tan sewi. /   :: A little green person came from the sky.  
   jan lawa li moku e telo jaki.   :: The leader drank dirty water.  
   jan lawa pi tomo tawa telo li moku.   :: The captain of the ship is eating.  
   jan li lukin sama pipi.   :: People look like ants.  
   jan li pona.   :: People are good. 
   jan lili li lukin e jan suli.   :: Children watch adults.  
   jan lili pi jan Keli li musi.   :: Keli's child is funny.  
   jan mute li kama.   :: Many people are coming.  
   jan mute lili li kama.   :: Some (but not a lot) of people are coming.  
   jan pi nanpa wan li lon.   :: The first person is here.  
   jan pona mi li lon poka mi.   :: My friend is beside me. 
   jan seme li lon? / jan seme li lon ni?   :: Who's there?  
   jan seme li olin e sina?   :: Who loves you?  
   jan seme pi kulupu ni li suli?   :: Which people of this group are important?  
   jan sin li kama ala kama?   :: Are more people coming?  
   kalama musi pi jan Enja li pona.   :: Enya's music is good.  
   kasi kule li pona lukin.   :: Flowers are pretty.  
   ken la jan Susan li kama.   :: Maybe Susan will come.  
   ken la ona li lon tomo sona.   :: Maybe he's in school.  
   kili li moku li pona.   :: Pineapple is a food and is good. 
   kule laso loje li pona tawa mi.   :: I like the color purple.  
   kule loje laso li pona tawa mi. /   :: I like the color purple.  
   kule seme li pona tawa sina?   :: Which color do you like?  
   linja mi li telo.   :: My hair is wet.  
   lipu ni li pilin lete.   :: This paper feels cold.  
   lon   :: yes 
   lon ala   :: no 
   lupa ni li suli.   :: That hole is big.  
   ma li lon anpa mi.   :: The land is beneath me. 
   mama meli o awen.   :: Mama, wait.  
   mani pi ma ante li pona tawa mi.   :: I like currency of other nations.  
   mi jan pi toki pona.   :: I am a Toki Ponan.  
   mi jo e ilo.   :: I have a tool. 
   mi jo e tomo tawa tu.   :: I own two cars.  
   mi kama tan ma Elopa.   :: I come from Europe. 
   mi ken ala kute e toki sina.   :: I can't hear your talking.  
   mi ken ala lape.   :: I can't sleep.  
   mi kin wile tawa tomo mi.   :: I still want to go to my house.  
   mi lon. ::  Yes, i do. 
   mi lukin ala e poki laso.   :: I don't see the blue bag.  
   mi lukin e ma lon poka pi jan pona mi.   :: I look at the land with my friend.  
   mi lukin e ma poka jan pona mi.   :: I look at the land with my friend.  
   mi lukin e waso tu wan.   :: I saw three birds.  
   mi moku.   :: I'm eating. 
   mi mute li moku e telo nasa mute.   :: We drank a lot of vodka.  
   mi mute li pana e moku tawa ona mute.   :: We gave them food.  
   mi mute o moku e kala.   :: Let's eat fish.  
   mi pona ala pona tawa sina?   :: Do you like me?  
   mi pona e ilo suno kepeken ilo lili.   :: I fixed the flashlight using a small tool.  
   mi pona tan ni: mi lon.   :: I'm okay because I'm alive. 
   mi taso li lon.   :: I'm alone.  
   mi tawa (said by person leaving); tawa pona (said by person staying)   :: good-bye 
   mi tawa supa lape.   :: I'm going to bed.  
   mi tawa!    :: Bye!  
   mi wile ala toki tawa sina.   :: I don't want to talk to you.  
   mi wile e ilo moku.   :: I need a fork.  
   mi wile e sitelen ma.   :: I want the map.  
   mi wile e soweli lili.   :: I want a puppy.  
   mi wile pana e ko jaki.   :: I need to crap.  
   mi wile pana e telo jelo.   :: I need to pee.  
   mi wile tawa ma Oselija.    :: I want to go to Australia. 
   mi wile tawa tomo ona kepeken tomo tawa mi.   :: I want to go to his house using my car.  
   mi wile tawa. taso mi ken ala.   :: I want to go, but I can't.  
   moku li pona tawa ona.   :: He loves to eat.  
   mu.   :: Meow.  
   mute seme?   :: how much? 
   ni   :: that one 
   ni li musi ala musi? musi.   :: Is that funny? Yes.  
   ni li suwi ala suwi?   :: Is that sweet?  
   ni li tawa jan pona mi.   :: This is for my friend.  
   nimi mi li Ken.   :: My name is Ken.  
   o lukin e pipi loje ni.    :: Look at that red bug.  
   o open e lupa.   :: Open the door.  
   o pana e suwi tawa mi!   :: Give me a lollipop!  
   o pilin e uta mi kepeken uta sina.   :: Kiss me.  
   o tawa!   :: Go!  
   o wan!   :: Unite!  
   ona li jan pona pi kalama musi.   :: He is a good musician.  
   ona li moku e kili.   :: She's eating fruit. 
   ona li pali e ni kepeken nasin seme?   :: How did she make that?  
   ona li tawa ala telo.   :: He didn't go to the lake.  
   ona li wile pakala e pipi.   :: He wants to squish the spider. 
   ona mute li  utala toki.   :: They are arguing.  
   pakala!   :: F-ck! 
   pipi li lon ala lon poka mi?   :: Is a bug beside me?  
   pipi li moku e mi.    :: The mosquito bit me.  
   pipi li wile moku e telo.   :: The bug is thirsty. 
   pipi seme li pakala e sina?   :: Which bug hurt you?  
   poki ni li lon jaki.   :: That bottle is in the dirt.  
   pona   :: thank you 
   seli li lon la mi pana e telo tan selo mi.   :: When it's hot, I sweat.  
   sewi li laso.   :: The sky is blue.  
   sina lukin ala lukin e sitelen tawa X-Files?   :: Do you watch The X-Files?  
   sina sona ala sona e toki Inli?   :: Do you speak English? 
   sina suli.   :: You're tall. 
   sina tawa poka jan seme?   :: Whom did you go with?  
   sina wile e moku anu telo?   :: Do you want food, or do you want water?  
   sina wile kama anu seme?   :: Do you want to come or what?  
   sina wile pali e seme?   :: What do you want to do?  
   sina wile toki e tan tawa mi.   :: You have to tell me why.  
   soweli li toki e mu.   :: Cows say moo.  
   suno li lon sewi mi.   :: The sun is above me. 
   telo li pona.   :: Water is simple. 
   telo li suli.   :: The lake is big. 
   telo nasa pona!   :: generic toast 
   tenpo pimeja ni la mun li suli.   :: The moon is big tonight.  
   tenpo pimeja pini la mi lukin e sitelen tawa X-Files.   :: Last night I watched X-Files.  
   tenpo suno kama la mi wile pali.   :: I have to work tomorrow.  
   toki Inli   :: English 
   toki pona   :: Toki Pona 
   toki pona li pona tawa mi.   :: I like Toki Pona.  
   toki!   :: hello 
   tomo pi mi mute li pakala.   :: Our house is messed up.  
   waso li tawa lon kon.   :: Birds fly in air.  
  (mi meli.) mi olin e meli. :: I am a lesbian 
  (mi mije.) mi olin e mije. :: I am gay (male) 
  (ona) li ike :: (she/he/it) is bad, I don't like (her/him/it) 
  (ona) li pona :: (he/she/it) is good, I like (him/her/it) 
  (ona) li seme? :: what is (she/he) like? 
  A: a! sina lukin ala lukin e ijo nasa ni? :: Whoa! Do you see that weird thing? 
  A: mi mute o tawa. :: Let's go. 
  A: mi tawa ma Elopa. :: I went to Europe. 
  Akanisan :: Afghanistan 
  Alan :: Ireland, Irish Gaelic 
  Alensina :: Argentina 
  Anku :: Korea, Korean 
  Antola :: Andorra 
  Awisi :: Haiti, Haitian Creole 
  B: mi kin lukin e ona. :: I see it indeed. 
  B: mi ken ala. mi kin moku. :: I can't. I'm still eating. 
  B: pona! mi kin tawa ma Elopa. :: Cool! I also went to Europe. 
  Ekato :: Ecuador 
  Elena :: Greece, Greek 
  Epanja :: Spain, Spanish 
  Esi :: Estonia, Estonian 
  Esuka :: Basque Country, Basque 
  I like plants.  :: kasi li pona tawa mi. 
  Ilakija :: Iraq 
  Ilan :: Iran, Persian 
  Inli :: England, English 
  Intonesija :: Indonesia, Indonesian 
  Isale :: Israel 
  Isilan :: Iceland, Icelandic 
  Italija :: Italy, Italian 
  Jamanija :: Yemen 
  Kalalinuna :: Greenland, Greenlandic 
  Kana :: Ghana	 
  Kanata :: Canada	 
  Kanse :: France, French	 
  Katala :: Qatar	 
  Katelo :: Georgia, Georgian 
  Katemala :: Guatemala 
  Kenata :: Grenada 
  Kepeka :: Quebec 
  Keposi :: Cyprus 
  Kilipasi :: Kiribati 
  Kinla :: Wales, Welsh 
  Konko (pi ma tomo Kinsasa) :: Congo, Dem. Rep. 
  Konko (pi ma tomo Pasawi) :: Congo, P. Rep. 
  Kosalika :: Costa Rica 
  Kosiwa :: Côte d'Ivoire 
  Kupa :: Cuba 
  Kusala :: Gujarat, Gujarati 
  Kuwasi :: Kuweit 
  Lanka :: Sri Lanka 
  Lesi :: Brittany, Breton 
  Lipija :: Libya 
  Lisensan :: Liechtenstein 
  Lomani :: Romania, Romanian 
  Losi :: Russia, Russian 
  Lowasi :: Croatia, Croatian 
  Lowenki :: Slovakia, Slovak 
  Lowensina :: Slovenia, Slovenian 
  Lunpan :: Lebanon 
  Lusepu :: Luxemburg 
  Luwanta :: Rwanda 
  Maketonija :: Macedonia 
  Malakasi :: Madagascar, Malagasy 
  Malasija :: Malaysia, Malay 
  Malawi :: Malawi 
  Mali :: Mali 
  Malipe :: Morocco 
  Masija :: Hungary, Hungarian 
  Masu :: Egypt 
  Mesiko :: Mexico 
  Mewika :: USA, American 
  Mijama :: Myanmar	 
  Motowa :: Moldova	 
  Mulitanija :: Mauritania 
  Namipija :: Namibia 
  Naselija :: Nigeria 
  Netelan :: Netherlands, Dutch 
  Nijon :: Japan, Japanese 
  Nise :: Niger 
  Nosiki :: Norway, Norwegian Bokmål 
  Nusilan :: New Zealand 
  Ontula :: Honduras 
  Osalasi :: Austria 
  Oselija :: Australia 
  Pakisan :: Pakistan 
  Palakawi :: Paraguay 
  Palani :: Bahrein 
  Palata :: India 
  Panama :: Panama 
  Panla :: Bangladesh, Bengali 
  Papeto :: Barbados 
  Papuwanijukini :: Papua New Guinea 
  Pasila :: Brasil 
  Pawama :: Bahamas 
  Pelalusi :: Belarus, Belarussian 
  Pelu :: Peru 
  Pemuta :: Bermuda 
  Penesuwela :: Venezuela 
  Penin :: Benin 
  Pesije :: Belgium 
  Pilipina :: Philipines, Tagalog 
  Pilisin :: Palestine 
  Pisi :: Fiji 
  Piten :: Britain, UK 
  Pokasi :: Bulgaria, Bulgarian 
  Posan :: Bosnia and Herzegovina, Bosnian 
  Posuka :: Poland, Polish 
  Potuke :: Portugal, Portugese 
  Samalino :: San Marino 
  Sameka :: Jamaica, Jamaican Patoi 
  Samowa :: Samoa 
  Sasali :: Algeria 
  Sawa :: Java, Javanese 
  Sawasi :: Swaziland 
  Seki :: Czech (Republic) 
  Seneka :: Senegal 
  Setapika :: South Africa 
  Sile :: Chile 
  Sinita :: Trinidad and Tobago 
  Sipusi :: Djibouti 
  Sonko :: China, Chinese 
  Sopisi :: Serbia, Serbian 
  Sukosi :: Scotland, Scots 
  Sulija :: Syria 
  Sumi :: Finland, Finnish 
  Sutan :: Sudan 
  Suwasi :: Switzerland, Swiss 
  Tansi :: Denmark, Danish 
  Tawi :: Thailand, Thai 
  Toko :: Togo 
  Tominika :: Dominican Republic 
  Tona :: Tonga, Tongan 
  Tosi :: Germany, German 
  Tuki :: Turkey, Turkish 
  Tunisi :: Tunisia 
  Tuwalu :: Tuvalu 
  Ukanta :: Uganda 
  Ukawina :: Ukraine, Ukrainian 
  Ulukawi :: Uruguay 
  Uman :: Oman 
  Utun :: Jordan 
  Wanuwatu :: Vanuatu 
  Wasikano :: Vatican 
  Wensa :: Sweden, Swedish 
  a :: interj ah! ha! oh! ooh! aw! (emotion word) 
  akesi :: n non-cute animal, reptile, amphibian, dinosaur, monster 
  ala :: mod no, not, none, un-   n nothingness, negation, zero   interj no! 
  ala li jaki. :: Nothing is dirty. 
  ali / (ale) :: n everything, anything, life, the universe   mod all, every, complete, whole 
  anpa :: n bottom, down, under, below, floor, beneath   mod low, lower, bottom   vt lower, down, defeat, overcome 
  ante :: n difference   mod different   cont otherwise, or else  
  anu :: conj or 
  awen :: vi stay, wait, remain   vt keep   mod remaining, stationary, permanent, sedentary 
  e :: sep (introduces a direct object) 
  en :: conj and (used to coordinate head nouns)  
  ijo :: n thing, something, stuff, anything, object    mod of something  vt objectify 
  ike :: mod bad, evil, wrong, evil, overly complex, (figuratively) unhealthy   interj oh dear! woe! alas!   n negativity, evil, badness  
  ilo :: n tool, device, machine, thing used for a specific purpose  
  insa :: n inside, inner world, centre, stomach   mod internal, central 
  jaki :: mod dirty, gross, filthy   n dirt, pollution, filth   vt pollute, dirty  
  jan :: n person, people, human, being, somebody, anybody   mod personal, human, somebody's, of people   vt personify, humanize, personalize 
  jan Eta li jan unpa. :: Heather is a whore. 
  jan Kanata :: Canadian person 
  jan Keli o, sina pona lukin. :: Kelly, you are pretty. 
  jan Ken o, pipi li lon len sina. :: Ken, a bug is on your shirt. 
  jan Lisa li pona. :: Lisa is cool. 
  jan Mawen o, sina wile ala wile moku? :: Marvin, are you hungry? 
  jan Mesiko :: Mexican person 
  jan Mewi li toki tawa mi. :: Mary's talking to me. 
  jan Nesan li musi. :: Nathan is funny. 
  jan Pentan li pana e sona tawa mi. :: Brandon teaches to me. 
  jan Tepani o, sina ike tawa mi. :: Steffany, I don't like you. 
  jan seme li moku? :: Who is eating? 
  jan seme li tawa poka sina? :: Who went with you? 
  jelo :: mod yellow, light green 
  jo :: vt have, contain   n having   kama receive, get, take, obtain
  kala :: n fish, sea creature 
  kalama :: n sound, noise, voice   vi make noise   vt sound, ring, play (an instrument) 
  kalama musi "Jingle Bells" li pona tawa mi. :: I like the song "Jingle Bells". 
  kalama musi li pona tawa mi. :: I like music. 
  kalama musi pi jan Elton-John li nasa. :: The music of Elton John is odd. 
  kalama ni li seme? :: What was that noise? 
  kama :: n event, happening, chance, arrival, beginning   mod coming, future   vi come, become, arrive, happen, pursue actions to arrive to (a certain state),  
  kasi :: n plant, leaf, herb, tree, wood 
  kasi anpa :: grass 
  kasi kule :: flower 
  kasi lili :: little weeds 
  kasi suli :: trees, big shrubs 
  ken :: n possibility, ability, power to do things, permission   vi can, is able to, is allowed to, may, is possible   vt make possible, enable, allow, permit  
  ken la ilo li pakala. :: Maybe the tool is broken. 
  ken la jan Lisa li jo e ona. :: Maybe Lisa has it. 
  ken la mi ken tawa ma Elopa. :: Maybe I can go to Europe. 
  ken la ona li lape. :: Maybe he's alseep. 
  kepeken :: vt use   prep with 
  kili :: n fruit, pulpy vegetable, mushroom 
  kin :: mod also, too, even, indeed (emphasizes the word that follows) 
  kiwen :: n hard thing, rock, stone, metal, mineral, clay   mod hard, solid, stone-like, made of stone or metal 
  ko :: n semi-solid substance (paste, powder, gum, etc.) 
  kon :: n air, wind, odour, soul   mod air-like, ethereal, gaseous 
  kule :: n color, paint   vt color, paint   mod colourful 
  kulupu :: n group, community, society, company   mod communal, shared, public, of the society  
  kute :: vt listen, hear   mod auditory, hearing 
  la :: sep (between adverb or phrase of context and sentence) 
  lape :: n, vi sleep, rest   mod sleeping, of sleep 
  laso :: mod blue, blue-green  
  lawa :: n head, mind   mod main, leading, in charge   vt lead, control, rule, steer 
  len :: n clothing, cloth, fabric 
  lete :: n cold   mod cold, uncooked   vt cool down, chill, freeze 
  lete li lon. :: It's cold. 
  lete lili li lon. :: It's cool. 
  lete mute li lon. :: It's very cold. 
  letter   ::    pronounced as in 
  letter   ::    pronounced as in 
  li :: sep (between any subject except mi and sina and its verb;   also used to introduce a new verb for the same subject) 
  lili :: mod small, little, young, a bit, short, fes, less   vt reduce, shorten, shrink, lessen 
  linja :: n long, very thin, floppy thing, e.g. string, rope, hair, thread, cord, chain 
  lipu :: n flat and bendable thing, e.g. paper, card, ticket 
  loje :: mod red 
  lon :: prep be located in/at/on   vi be there, be present, be real/true, exist, be awake   
  luka :: n hand, arm   mod five 
  lukin :: vt see, look at, watch, read   vi look, watch out, pay attention   mod visual 
  lupa :: n hole, orifice, window, door 
  ma :: n land, earth, country, (outdoor) area 
  ma Italija li pona lukin. :: Italy is beautiful. 
  ma Kanata li pona. :: Canada is good. 
  ma tomo Alenta :: Atlanta 
  ma tomo Lantan li suli. :: London is big. 
  ma tomo Loma :: Rome 
  ma tomo Pelin :: Berlin 
  mama :: n parent, mother, father   mod of the parent, parental, maternal, fatherly 
  mani :: n money, material wealth, currency, dollar, capital 
  meli :: n woman, female, girl, wife, girlfriend   mod female, feminine, womanly 
  meli Italija :: Italian woman 
  mi :: n I, we   mod my, our 
  mi jan Pepe. :: I am Pepe. 
  mije :: n man, male, husband, boyfriend   mod male, masculine, manly 
  mije Epanja :: Spanish man 
  moku :: n food, meal   vt eat, drink, swallow, ingest, consume  
  moli :: n death   mod dead, deadly, fatal   vt kill  
  monsi :: n back, rear end, butt, behind   mod back, rear 
  mu :: interj woof! meow! moo! etc. (cute animal noise) 
  mun :: n moon   mod lunar 
  musi :: n fun, playing, game, recreation, art, entertainment   mod artful, fun, recreational   vi play, have fun  
  mute :: mod many, several, very, much, a lot, abundant, numerous, more   n amount, quantity   vt make many or much  
  nanpa :: n number   oth -th (ordinal numbers) 
  nasa :: mod silly, crazy, foolish, drunk, strange, stupid, weird   vt drive crazy, make weird 
  nasin :: n way, manner, custom, road, path, doctrine, system, method 
  nena :: n bump, hill, mountain, button, nose 
  ni :: mod this, that 
  nimi :: n word, name 
  nimi mi li Pepe. :: My name is Pepe. 
  noka :: n leg, foot 
  o :: sep O (vocative or imperative)   interj hey! (calling somebody's attention) 
  o awen. :: Wait. 
  o lukin e ni. :: Watch this. 
  o pali! :: Work! 
  o tawa ma tomo poka jan pona sina. :: Go to the city with your friend. 
  oko :: n eye 
  olin :: n love   mod love   vt to love (a person) 
  ona :: n he, she, it, they   mod his, her, its, their 
  open :: vt open, turn on 
  pakala :: n blunder, accident, mistake, destruction, damage, breaking   vt screw up, fuck up, botch, ruin, break, hurt, injure, damage, bungle, spoil, ruin   vi screw up, fall apart, break  
  pali :: n activity, work, deed, project   mod active, work-related, operating, working   vt do, make, build, create  
  palisa :: n long, mostly hard object, e.g. rod, stick, branch  
  pana :: vt give, put, send, place, release, emit, cause   n giving, transfer, exchange 
  pi :: sep of, belonging to 
  pilin :: n feelings, emotion, heart   vi feel   vt feel, think, sense, touch 
  pimeja :: mod black, dark   n darkness, shadows   vt darken 
  pini :: n end, tip   mod completed, finished, past, done, ago   vt finish, close, end, turn off  
  pipi :: n bug, insect, spider 
  poka :: n side, hip, next to   mod neighboring   prep in the accompaniment of, with 
  poka telo :: water side, the beach 
  poki :: n container, box, bowl, cup, glass 
  pona :: n good, simplicity, positivity   mod good, simple, positive, nice, correct, right   interj great! good! thanks! OK! cool! yay!  
  sama :: mod same, similar, equal, of equal status or position   prep like, as, seem   cont similarly, in the same way that 
  sama li ike. :: Equality is bad. 
  seli :: n fire, warmth, heat   mod hot, warm, cooked   vt heat, warm up, cook 
  seli li lon. :: It's hot. 
  seli lili li lon. :: It's warm. 
  seli mute li lon. :: It's very hot. 
  selo :: n outside, surface, skin, shell, bark, shape, peel 
  seme :: oth what, which, wh- (question word) 
  seme li lon poka mi? :: What is beside me? 
  seme li lon tomo mi? :: What is in my house? 
  seme li moku e kili mi? :: What is eating my fruit? 
  seme li pona tawa sina? :: What do you like?  
  seme li utala e sina? :: What attacked you? 
  sewi :: n high, up, above, top, over, on   mod superior, elevated, religious, formal 
  sijelo :: n body, physical state 
  sike :: n circle, wheel, sphere, ball, cycle   mod round, cyclical 
  sin :: mod new, fresh, another, more   vt renew, renovate, freshen 
  sina :: n you   mod your 
  sinpin :: n front, chest, torso, wall 
  sitelen :: n picture, image   vt draw, write 
  sitelen ma :: map 
  sitelen tawa  :: movie, TV show 
  sitelen tawa "Bowling for Columbine" li kin pona. :: The movie "Bowling for Columbine" is also good. 
  sitelen tawa "Fahrenheit 9/11" li pona tawa mi. :: I like the movie "Fahrenheit 9/11". 
  sona :: n knowledge, wisdom, intelligence, understanding   vt know, understand, know how to   vi know, understand  
  soweli :: n animal, especially land mammal, lovable animal 
  soweli ni li pona moku. :: This cow is good to eat. 
  suli :: mod big, tall, long, adult, important   vt enlarge, lengthen   n size   
  suno :: n sun, light 
  supa  :: table, chair, sofa, ...  
  supa :: n horizontal surface, e.g furniture, table, chair, pillow, floor 
  supa lape ::  bed 
  suwi :: n candy, sweet food   mod sweet, cute   vt sweeten 
  tan :: prep from, by, because of, since   n origin, cause 
  taso :: mod only, sole   conj but 
  tawa :: prep to, in order to, towards, for, until   n movement, transportation   mod moving, mobile  
  telo :: n water, liquid, juice, sauce   vt water, wash with water 
  tenpo :: n time, period of time, moment, duration, situation 
  tenpo kama la mi lape. :: In the future, I'll sleep. 
  tenpo ni la mi lon. :: At this time, I am here. 
  tenpo pimeja pini la mi kama nasa. :: Last night, I became drunk. 
  tenpo pini la mi weka. :: In the past, I was away. 
  tenpo tu tu la mi sike e suno. :: Four times (la) I circled the sun. 
  toki :: n language, talking, speech, communication   vt say   vi talk, chat, communicate  
  toki Epelanto :: Esperanto 
  toki Inli li pona. :: The English language is good. 
  toki Kanse :: French language 
  tomo :: n indoor constructed space, e.g. house, home, room, building   mod urban, domestic, household 
  tu :: mod two   n duo, pair   vt double, separate/cut/divide in two 
  unpa :: n sex, sexuality   mod erotic, sexual   vt have sex with, sleep with, fuck  
  uta :: n mouth   mod oral 
  utala :: n conflict, disharmony, competition, fight, war, battle, attack, blow,   argument, physical or verbal violence   vt hit, strike, attack, compete against 
  walo :: mod white, light (colour)   n white thing/part, whiteness, lightness 
  wan :: mod one, a   n unit, element, particle, part, piece   vt unite, make one 
  waso :: n bird, winged animal 
  wawa :: n energy, strength, power   mod energetic, strong, fierce, intense, sure, confident   vt strengthen, energize, empower 
  weka :: mod away, absent, missing   n absence   vt throw away, remove, get rid of 
  wile :: vt to want, need, wish, have to, must, will, should   n desire, need, will   mod necessary
  a :: ahh, ha!, umm, hmm, ooh, etc. 
  a a a! :: Hahaha! (laughter) 
  a a a! :: ha ha ha! 
  a! telo sijelo loje li kama tan nena kute mi!  :: Ahh! Blood is coming from my ear! 
  a. :: Ooh, ahh, unh, oh, etc. 
  akesi :: reptile, amphibian 
  akesi pi telo moli :: venomous snakes, poisonous frogs 
  akesi li pana e telo moli.  :: The snake emitted venom ("deadly fluid"). 
  ala :: not, none; nothing, negation 
  ala :: zero 
  ale / ali :: everything, all 
  ale li jo e tenpo.  :: There is a time for everything. Everything in its right context. 
  ale li pona :: all is well, I feel calm, I am at peace 
  ale li pona.  :: All is good. Life is beautiful. Everything will be OK.  
  ali :: everything, all 
  anpa :: ground; low, deep; to lower, to defeat  
  anpa lawa :: neck (bottom of head) 
  anpa lawa :: neck, throat 
  anpa pi sinpin lawa :: chin 
  ante :: other, different 
  ante li kama.  :: Change comes. Times change.  
  anu :: or 
  awen :: to wait, to pause, to stay; remaining       
  awen pona :: patient 
  e ::  introduces direct object  
  en :: and 
  ijo ::  something, anything, stuff, thing                
  ijo lon tomo :: household things 
  ijo uta walo :: teeth 
  ike :: Bad 
  ike :: bad, evil, complicated 
  ike li kama. :: Bad comes. Shit happens.   
  ike lukin :: ugly  
  ike lukin :: ugly 
  ike! :: Oh no!, Uh oh!, Alas!, etc. 
  ilo :: tool, device, machine 
  ilo lape :: sleeping pill 
  ilo lape soweli :: animal tranquilizer or anesthetic, e.g. ketamine 
  ilo li pakala. :: The tool is broken. 
  ilo moku :: an eating utensil (fork/spoon/knife) 
  ilo moku :: utensil, fork, spoon, knife, etc. 
  ilo musi :: toy, thing used for entertainment 
  ilo nanpa :: computer 
  ilo nasa :: drugs 
  ilo nasa wawa :: energy-giving drug, e.g. amphetamine 
  ilo ni li pilin lete. :: This axe feels cold. 
  ilo pi sitelen tawa :: TV 
  ilo pi sitelen tawa :: tv 
  ilo pi sitelen toki :: pen, pencil 
  ilo sona :: smart tool or machine, e.g. computer 
  ilo suno  :: a tool of light 
  ilo suno :: flashlight  
  ilo suno :: lamp 
  ilo toki :: communications device, e.g. telephone, online chat 
  ilo unpa :: sex toy 
  ilo wan ma :: Internet 
  insa :: inside, stomach 
  jaki :: dirty, nasty, trash 
  jan (pi pali) moku :: chef, cook 
  jan (pi pali) unpa :: sex worker 
  jan (pi pali) unpa :: sex worker, prostitute  
  jan :: People 
  jan :: person, people, inhabitant, member 
  jan :: somebody, anybody, person, etc.                       
  jan Ana o pana e moku tawa mi.  :: Ana, give me food. 
  jan Epi o a! :: Oh Abbie! 
  jan Ken o, mi olin e sina.  :: Ken, I love you. 
  jan Lisa taso li kama. :: Only Lisa came. 
  jan Lisa o, toki. :: Hello, Lisa. 
  jan Mose o lawa e mi mute tawa ma pona.  :: Moses, lead us to the good land. 
  jan Pawe o, mi wile ala moli.  :: Forrest, I don't want to die. 
  jan San o tawa tomo sina!  :: John, go to your house! 
  jan San o, ...  :: John, ... 
  jan San li seme? :: Who is John? 
  jan Santa :: Santa Claus 
  jan Sesi o moku e kili ni. :: Jessie, eat this fruit. 
  jan Susan anu jan Lisa li moku e suwi?  :: Susan or Lisa ate the cookies? 
  jan Ta o toki ala tawa mi. :: Todd, don't talk to me. 
  jan Wasintan [Washington] li jan lawa pona pi ma Mewika.  :: Washington was a good leader of America. 
  jan ala li toki. :: Nobody is talking. 
  jan ali li wile tawa. :: Everybody wants to travel. 
  jan kala :: mermaid. 
  jan mute li kama. :: Many people came. 
  jan mute lili li kama. :: A small amount (of) people are coming. 
  jan mute mute mute li kama! :: Many, many, many people are coming! 
  jan pi ike lukin :: an ugly person 
  jan pi ma tomo :: person of the city, a city-dweller 
  jan pi nanpa tu tu :: 4th person 
  jan pi nasin sewi Kolisu :: person of Christian religion, a Christian 
  jan pi pona lukin :: an attractive person 
  jan pi wawa ala :: a weak person 
  jan poka :: neighbor, someone who is beside you 
  jan sin li kama. :: More people are coming. 
  jan ike :: bad person, jerk, negative person, enemy 
  jan ike :: enemy 
  jan kulupu :: member of a group 
  jan lawa :: leader 
  jan lawa :: leader, boss, master, chairperson, president, director 
  jan lawa pi jan utala :: leader of soldiers (commander, general) 
  jan lawa pi tomo tawa kon :: leader of airplanes, a pilot 
  jan lawa ma :: president of country, governor of state, premier of province 
  jan lawa pi ma tomo :: mayor 
  jan li moli e waso. :: The person killed the bird. 
  jan li lon insa tomo.  :: Somebody's inside the house. 
  jan li moku. :: Somebody is eating. 
  jan li moli :: murder 
  jan li seme :: personal traits 
  jan li suli mute. mani li suli lili.  :: People are more important than money.  
  jan li toki kepeken toki pona lon tomo toki.  :: People talk in/using Toki Pona in the chat room. 
  jan li wile jo e ma. :: People want to own land. 
  jan lili :: child 
  jan lili :: child, daughter, son  
  jan lili :: small, short, thin or young person, child 
  jan lili en jan suli li toki. :: The child and the adult are talking. 
  jan lili pi jan Ken en jan Lisa li suwi. :: Ken and Lisa's baby is sweet. 
  jan lili tu wan :: 3 children 
  jan lili li ken ala moku e telo nasa.  :: Children can't drink beer. 
  jan lili li sona ala e ike.  :: Children are innocent.  
  jan lili li wile e telo kili.  :: Children want fruit juice. 
  jan lili sina li suwi. :: Your baby is cute. 
  jan luka tu :: 7 people 
  jan moli :: dead man 
  jan nasa :: strange, foolish, unconventional or crazy person 
  jan nasa utala :: fighting fool 
  jan ni li sama mi. :: That person is like me. 
  jan ni li pona lukin :: That person is pretty. 
  jan olin :: loved one 
  jan olin :: significant other, partner 
  jan pakala :: an injured person, victim, etc. 
  jan pali :: worker, employee 
  jan pi jan unpa mute :: promiscuous person 
  jan pi kama sona :: student 
  jan pi ma ante :: foreigner 
  jan pi ma sama :: fellow citizen of same country or land 
  jan pi musi sijelo :: athlete 
  jan pi pana sona :: teacher 
  jan pi pona pilin :: good psychotherapist 
  jan pi pona sijelo :: good doctor, healer 
  jan pi tomo pali :: office worker, etc. 
  jan pi tomo sama :: housemate, roommate 
  jan pona :: friend (good person) 
  jan pona :: good person, friend, positive person 
  jan sama :: similar person, counterpart, peer, person in same situation, sibling 
  jan sama :: sister, brother, sibling  
  jan seme li meli sina?  :: Who is your girlfriend/wife? 
  jan sewi :: God 
  jan sona :: knowledgeable person, wise person, educated person, academic, specialist 
  jan sona li jan nasa.  :: A wise man is a fool. A genius thinks unconventionally.  
  jan sona nanpa :: mathematician 
  jan sona pilin :: psychologist 
  jan sona sijelo :: doctor, physician 
  jan suli :: adult 
  jan suli :: big, tall or fat person, adult 
  jan toki :: speaker, messenger, person communicating 
  jan unpa :: lover, prostitute 
  jan unpa :: sexual partner 
  jan utala :: soldier  
  jan utala ali li nasa. :: All soldiers are stupid.
  jan utala ali li nasa :: All soldiers are stupid. 
  jan utala li seli ala seli e tomo?  :: Is the warrior burning the house? 
  jan utala nasa :: stupid soldier  
  jan utala nasa :: stupid soldier  
  jan utala nasa mute :: many stupid soldiers  
  jan utala nasa ni :: this stupid soldier  
  jan utala pi ma Mewika li ike tawa ma ali. :: Soldiers of the USA are bad for the world. 
  jan wawa :: strong person 
  jelo :: yellow 
  jelo :: yellow, light green 
  jo ::  to have, ownership, possession 
  jo ala e selo lon pini palisa :: circumcised, cut 
  jo e linja mute :: to be hairy 
  jo e mani mute :: to be rich 
  jo e pilin pona :: to have positive feelings, be mentally healthy 
  jo e selo lon pini palisa :: uncircumcised, uncut 
  jo e sijelo pona :: to be (physically) healthy 
  jo ijo li ike e jan.  :: Possession corrupts.  
  kala :: fish or an animal that live in water        
  kala :: fish, seafood 
  kala lete :: raw fish, sushi 
  kalama :: sound, noise; to make noise,   to play an instrument 
  kalama ala li lon :: No sound exists.
  kalama musi en meli li pona tawa mi. :: I like music and girls. 
  kama :: to come 
  kama :: to come, to happen, to cause           
  kama jo :: get 
  kama jo e lupa meli :: to get genital reconstruction surgery as a women, i.e. vaginoplasty  
  kama jo e palisa mije :: to get genital reconstruction surgery as a man, i.e. metoidioplasty, phalloplasty 
  kama jo e sinpin lawa meli :: to get facial feminization surgery 
  kama jo e sinpin mije :: to get male chest reconstruction surgery 
  kama olin :: fall in love with 
  kama pona! :: Come well! Welcome! 
  kasi :: herb, plant 
  kasi :: plant 
  kasi nasa / kasi sona :: hemp  
  kasi nasa :: intoxicating plant, e.g. marijuana 
  kasi pi tenpo pona Kolisu :: Chrismas tree 
  kasi sona :: intoxicating plant used in meditation, e.g. marijuana 
  kasi wawa :: spice 
  ken :: can, to be able to; possibility  
  ken la jan lili li wile moku e telo.  :: Maybe the baby is thirsty. 
  kepeken :: to use, with, using 
  kepeken e kasi nasa :: to smoke pot 
  kepeken e utala :: to use violence 
  kepeken ike e ilo nasa :: to abuse drugs  
  kepeken lili e ilo nasa :: to use drugs in moderation 
  kili :: fruit, vegetable  
  kili :: fruit, vegetable 
  kili :: vegetable, fruit 
  kili pi jan Susan :: Susan's fruit 
  kili li lon poki. :: The fruit is in the basket. 
  kili li pona tawa mi. :: I like fruit. 
  kili li tawa anpa poka kasi. :: The appel drops not far from the tree. 
  kili lili :: small vegetable, fruit, e.g. berry, olive 
  kili lili kiwen :: nut 
  kili loje :: reddish fruit or vegetable, e.g. tomato 
  kili ma :: earth vegetable, e.g. potato 
  kili mi :: my fruit 
  kili palisa :: long fruit or vegetable, e.g. carrot, banana, cucumber 
  kili pi jan Linta li ike.  :: Linda's fruit is bad. 
  kili suwi :: (sweet) fruit 
  kin :: indeed, still, too     
  kiwen :: stone, rock, hard like a rock 
  ko (walo) wawa :: cocaine 
  ko :: semi-solid substance (glue, powder, etc.) 
  ko jaki :: feces 
  ko jaki :: shit, feces, pooh 
  ko jaki lon nena sinpin :: boogers 
  ko lete li kama :: it's snowing 
  kon :: air, atmosphere, spirit, wind 
  kon en sewi :: weather 
  kon sewi li jo e walo :: it's cloudy 
  kon telo walo :: snow, fog 
  kule :: color, to paint, to color                 
  kule :: colour 
  kule lon palisa luka :: nail polish 
  kule lon palisa luka :: nail polish 
  kulupu :: group, community, society 
  kulupu pi toki pona :: the Toki Pona community 
  kulupu mama :: family 
  kulupu mama :: family 
  kulupu pi tenpo mun :: Month 
  kulupu pi tenpo suno luka tu :: days of the week 
  kute :: to hear 
  la :: separates adverb of context from sentence 
  lape :: to sleep; sleep 
  lape li pona.  :: Sleep and rest are good.  
  lape pona! :: Sleep well! Have a good night! 
  laso :: blue 
  laso :: blue, blue-green 
  laso jelo / jelo laso :: yellowish blue (green) 
  laso jelo :: green (yellowish blue) 
  laso loje / loje laso :: reddish blue (purple 
  laso loje :: purple (reddish blue) 
  laso pimeja :: dark blue 
  lawa :: head 
  lawa :: main, leading, head; to lead           
  lawa e pilin :: to master one's feelings, be composed  
  len ::  clothing, clothe 
  len :: clothes, article of clothing, cloth, fabric 
  len jan :: somebody's clothes 
  len pi jan Lisa :: Lisa's clothes 
  len pi loje en laso :: shirt of red and blue 
  len jan :: somebody's clothes 
  len lawa :: hat, hood, bonnet, headdress 
  len li lon poka mi. :: The clothes are at my side.  
  len luka :: gloves, mittens 
  len ni li kule seme? :: What colour is this article of clothing? 
  len noka :: shoe, pants 
  len pi jan Susan li jaki.  :: Susan's clothes are dirty. 
  len sina li telo ala telo? :: Are your clothes wet? 
  lete :: cold; to freeze 
  lete li lon :: it's cold 
  lete lili li kin lon. :: Here is it little cold too. 
  li :: separates a 3rd person subject   from its verb 
  lili ::  little 
  lili :: small, short, thin, young 
  linja (lawa) :: hair 
  linja :: line, hair 
  linja lawa :: hair (of head) 
  linja lili oko :: eyebrows, eyelashes 
  linja sinpin :: beard, facial hair 
  linja uta :: moustache 
  lipu :: paper, sheet, page, ticket, etc. 
  lipu toki :: paper with written information, document, text, book 
  loje :: red 
  loje :: red 
  loje jelo :: orange (yellowish red) 
  loje laso (pimeja) :: (dark) blueish red, purple 
  loje walo :: light red, pink 
  loje walo :: pink (whitish red) 
  lon  :: truth 
  lon :: to be in/at/on, to exist; in, at, on 
  lon tenpo pi pali ala :: to be taking a sabbatical, break from work 
  luka :: 5 
  luka :: arm, hand 
  luka :: five 
  luka :: hand, arm 
  luka :: hand, arm 
  luka luka :: 5 + 5 = 10 
  luka luka luka :: 5 + 5 + 5 = 15 
  luka luka tu :: 5 + 5 + 2 = 12 
  luka luka tu tu :: 5 + 5 + 2 + 2 = 14 
  luka luka tu wan :: 5 + 5 + 2 + 1 = 13 
  luka luka wan :: 5 + 5 + 1 = 11 
  luka mi li jaki. mi wile telo e ona.  :: My hands are dirty. I want to wash them. 
  luka tu :: 5 + 2 = 7 
  luka tu tu :: 5 + 2 + 2 = 9 
  luka tu wan :: 5 + 2 + 1 = 8 
  luka wan :: 5 + 1 = 6 
  lukin ::  to see, to look at, vision, sight 
  lukin :: aware, attentive 
  lukin e toki :: read 
  lukin jo e pali :: to be looking for a job 
  lupa (meli) :: vagina, pussy 
  lupa (tomo) :: window, door 
  lupa :: hole, orifice 
  lupa :: hole, orifice 
  lupa :: hole, orifice, door, window                
  lupa jaki :: anus 
  lupa kute :: ear 
  lupa meli :: vagina 
  lupa meli :: vagina 
  lupa meli li mama ale.  :: A woman's womb is the mother of all things.  
  lupa monsi :: anus 
  lupa monsi :: anus 
  lupa nena :: nostrils 
  lupa pi telo jelo :: urethra 
  ma ::  land, country, region, outside area  
  ma :: Ecology 
  ma Amelika :: the Americas 
  ma Amelika lete :: North America 
  ma Amelika seli :: South America 
  ma Antasika :: Antarctica 
  ma Apika :: Africa 
  ma Asija :: Asia 
  ma Elopa :: Europe 
  ma Elopa li weka tan ma Mewika. :: Europe is away from the USA. 
  ma Inli li pona. :: England is good. 
  ma Mewika li weka ala tan ma Kupa. :: The USA is not away from Cuba. 
  ma ali li pona. :: All nations are good. 
  ma kasi :: forest, jungle 
  ma pi jan Keli :: Keli's country 
  ma seme li pona tawa sina? :: Which countries do you like? 
  ma sina :: your country 
  ma li pona lukin. :: The countryside is good to look at. 
  ma lon telo :: Island 
  ma mi li pimeja. :: My land is dark. 
  ma ona :: her country 
  ma telo :: mud, swamp 
  ma tomo :: city, town 
  ma tomo :: town 
  ma tomo Akajela :: Cairo (Egypt) 
  ma tomo Alana :: Atlanta (USA) 
  ma tomo Alawa :: Ottawa (Canada) 
  ma tomo Alipasi :: Halifax (Canada) 
  ma tomo Anpu :: Hamburg (Germany) 
  ma tomo Ansetan :: Amsterdam (Netherlands) 
  ma tomo Asina :: Athens (Greece) 
  ma tomo Ele :: Los Angeles (USA) 
  ma tomo Esupo :: Espoo (Finland) 
  ma tomo Iwesun :: Hilversum (Netherlands)  
  ma tomo Kakawi :: Calgary (Canada) 
  ma tomo Kenpisi :: Cambridge (USA, GB) 
  ma tomo Kunte :: Bangkok (Thailand) 
  ma tomo Lanten :: London (England)  
  ma tomo Lesinki :: Helsinki (Finland) 
  ma tomo Loma :: Rome (Italy) 
  ma tomo Manten :: Moncton (Canada) 
  ma tomo Mesiko :: Mexico City (Mexico) 
  ma tomo Milano :: Milan (Italy) 
  ma tomo Minsen :: Munich (Germany) 
  ma tomo Monkela :: Montreal (Canada) 
  ma tomo Napoli :: Naples (Italy) 
  ma tomo Nujoka :: New York City (USA) 
  ma tomo Osaka :: Osaka (Japan)  
  ma tomo Paki :: Paris (France) 
  ma tomo Pasen :: Boston (USA) 
  ma tomo Pelin :: Berlin (Germany) 
  ma tomo Peminan :: Birmingham (England)  
  ma tomo Pesin :: Beijing, Peking (China) 
  ma tomo Pilense :: Florence (Italy) 
  ma tomo Polan :: Portland (USA) 
  ma tomo Putapesi :: Budapest (Hungary) 
  ma tomo Sakata :: Jakarta (Indonesia) 
  ma tomo Sanpansiko :: San Francisco (USA) 
  ma tomo Sawi :: Sackville (Canada) 
  ma tomo Sene :: Geneva (Switzerland) 
  ma tomo Sensan :: St. John's (Canada) 
  ma tomo Sesija :: Shediac (Canada) 
  ma tomo Sije :: Dieppe (Canada) 
  ma tomo Solu :: Seoul (South Korea) 
  ma tomo Tanpele :: Tampere (Finland) 
  ma tomo Telawi :: Tel Aviv (Israel) 
  ma tomo Tokijo :: Tokyo (Japan)  
  ma tomo Towano :: Toronto (Canada) 
  ma tomo Tuku :: Turku (Finland) 
  ma tomo Wankuwa :: Vancouver (Canada) 
  ma tomo Wenesija :: Venice (Italy) 
  ma tomo lawa :: capital 
  mama :: a parent in general (mother or father) 
  mama :: mother, father, parent 
  mama :: parent 
  mama meli :: mother 
  mama mije :: father 
  mama mama :: grandparent 
  mama meli :: mother 
  mama mi li moli la mi pilin ike. :: My parents die, I feel bad. 
  mama mije :: father 
  mama ona li kepeken e kasi nasa.  :: His mother used pot. 
  mani :: money, currency 
  meli (insa) :: person who identifies as female, e.g. male-to-female transsexual person 
  meli (olin) :: wife, girlfriend 
  meli :: woman, wife, girlfriend, female 
  meli en mije :: Gender 
  meli li lon sewi mije :: woman on top 
  meli li nasa e mije. :: Women will drive men crazy.  
  meli lili :: daughter 
  meli mi pi nanpa wan li nasa. :: My first girlfriend was crazy. 
  meli mije :: masculine girl, butch, tomboy 
  meli sama :: sister  
  meli unpa :: female sexual partner 
  mi ::  I, we, me, our  
  mi anpa e jan utala. :: I defeated the warrior. 
  mi en sina li jan pona. :: You and I are friends. 
  mi kalama kepeken ilo. :: I make noise using an instrument. 
  mi kama e pakala. :: I caused an accident. 
  mi kama jo e telo. :: I got the water. 
  mi kepeken e ilo. :: I'm using tools. 
  mi kepeken e poki ni. :: I'm using that cup. 
  mi kule e lipu :: I'm coloring the paper. 
  mi lon e sina. :: I made you aware of reality.    I forced you to be to present and alert. 
  mi lon tomo. :: I'm in the house. 
  mi olin e sina. :: I love you. 
  mi pilin e ni: sina ike. :: I think this: You're bad.  
  mi pilin ijo. :: I'm thinking (about) something. 
  mi pilin ike. :: I feel bad. / I feel sad. 
  mi pilin pi meli ni. :: I'm thinking about that woman. 
  mi pilin pona. :: I feel good. / I feel happy. 
  mi tawa e kiwen. :: I'm moving the rock. 
  mi tawa tomo mi. :: I'm going to my house. 
  mi weka. :: I was away. 
  mi wile e ni: mi lon tomo. :: I want this: I'm at home. 
  mi wile lon tomo. :: I want to be at home. / I want in a house. 
  mi wile lukin e ma. :: I want to see the countryside. 
  mi wile pakala e sina. :: I must destroy you. 
  mi en meli mi li wan. :: My girlfriend and I got married. 
  mi jan li suli. :: I am somebody and am important. 
  mi jo e kili.  ::  I have a fruit. 
  mi kama tan ma Mewika. :: I come from America. 
  mi kama tan ma tomo Pelin. :: I'm from Berlin. 
  mi ken ala ken pilin e monsi sina? :: may I touch your butt? 
  mi kepeken e poki e ilo moku.  :: I'm using a bowl and a spoon. 
  mi kin olin e sina.  :: I still love you. / I love you too.
  mi kute e kalama musi. :: I'm listening to music. 
  mi kute e toki sina. :: I hear your talking.  
  mi lape ala. :: I'm not sleeping.  
  mi lape la ali li pona. :: When I'm asleep, everything is good. 
  mi lape. mi sona. :: I sleep. I know. 
  mi lawa pona e jan. :: I lead people well. 
  mi lon ma kasi.  :: I'm in the forest. 
  mi lon tan seme?  :: Why am I here?  
  mi lukin kepeken ilo suno. :: I look using a flashlight.  
  mi lukin taso e meli ni! ali li pona. :: I only looked at that girl! Everything's okay. 
  mi lukin e ma. ni li pona tawa mi. :: I'm watching the countryside. This is good to me.
  mi lukin e ni. :: I am looking at that. 
  mi lukin e soweli luka.  :: I saw five mammals. 
  mi lukin sewi e tomo suli.  :: I am looking up at the big building. 
  mi moku e kili e telo. :: I eat/drink fruit and water. 
  mi moku e kili. :: I eat fruit. 
  mi moku kepeken ilo moku. :: I eat using a fork/spoon/   any type of eating utensil. 
  mi moku li pakala. :: I eat and destroy. 
  mi moku lon tomo. :: I eat in the house. 
  mi moku poka jan pona mi. :: I ate beside my friend. 
  mi moku tan ni: mi wile moku. ::  I eat because I'm hungry. 
  mi moku lili e kili lili.  :: I nibble (eat a little) the small fruit. 
  mi moku lon poka pi jan pona mi. :: I ate at side of my friend. 
  mi moku mute. sina moku lili. :: I eat more than you. 
  mi moku. :: I eat. / I am food. 
  mi musi ala. :: I'm not having fun. / I'm bored. 
  mi musi taso. :: I'm just joking. 
  mi mute :: we, us 
  mi mute li lukin lili e ona. :: We barely saw it. 
  mi mute o musi. :: Let's have fun. 
  mi mute o tawa. :: Let's go. 
  mi olin e sina :: I love you 
  mi pali taso. :: I just work. (All I ever do is work.)  
  mi pali mute la mi pilin ike. :: When I work a lot, I feel bad. 
  mi pana e ko jaki. :: I crapped. 
  mi pana e sona pi toki pona tawa ona. :: I teach her in toki pona. 
  mi pana e telo jelo. :: I peed. 
  mi pilin e ni: ona li jo ala e mani.  :: I think that he doesn't have money. 
  mi pilin e seli sijelo sina.  :: I feel your bodily warmth. 
  mi pilin lete.  :: I'm cold. 
  mi pini e lape sina. :: I ended your sleep.   I woke you up. 
  mi pona e ijo. :: I'm fixing something. 
  mi pona e ale mi, la mi pona e mi.  :: When I improve all areas of my life, I am making myself good.  
  mi pona e tomo tawa jan pakala. :: I fixed the house for the disabled man. 
  mi pona. :: I (am) good. 
  mi pona. :: I am/was/will be good. 
  mi pona. taso meli mi li pakala. :: I'm okay. But my girlfriend is injured. 
  mi sona ala e tan. :: I don't know the reason. / I don't know why. 
  mi sona ala e nimi pi ona mute.  :: I don't know their names. 
  mi sona e ni taso. :: I know only that. (That's all I know.) 
  mi suli mute. sina suli lili. :: I'm bigger than you. 
  mi suli. :: I'm important. / I'm fat. 
  mi tawa :: I'm going. Bye! 
  mi tawa tomo toki. ona li pona tawa mi.  :: I go the chat room. It is good for me. 
  mi telo e mi lon tomo telo. :: I bathe myself in the restroom. 
  mi toki tawa sina. :: I talk to you. 
  mi toki jan. :: I talked about people 
  mi toki pi jan ike. :: I talked about bad people. 
  mi utala ike. :: I fight badly. 
  mi wawa ala. :: I'm not strong. / I'm weak. 
  mi weka e ijo tu ni.  :: I got rid of those two things. 
  mi weka e ike jan, la mi weka e ike mi. :: When I forgive somebody's wrongdoings, I cleanse myself of negativity.  
  mi weka.  :: I was away. 
  mi wile ala pali. :: I'm lazy. 
  mi wile ala tawa musi. :: I don't want to dance. 
  mi wile e moku e telo. :: I want food and water. 
  mi wile ala e ijo. mi lukin taso.  :: I don't want anything. I'm just looking. 
  mi wile ala pali. :: I'm lazy. 
  mi wile ala toki pi kalama musi.  :: I don't want to talk about music. 
  mi wile e suwi! :: I want a cookie! 
  mi wile e suwi sin! :: I want another/more cookie(s)! 
  mi wile kama sona e toki Inli.  :: I want to learn English. 
  mi wile lukin e ma e suno. :: I want to see the land and the sun. 
  mi wile lukin e ma ante.  :: I want to see other countries. 
  mi wile lukin e tomo mi. taso mi lon ma ante. :: I want to see my house. But I'm in a different country.  
  mi wile moku e waso. :: I want to eat chicken. 
  mi wile moku e kili loje.  :: I want to eat a red fruit. 
  mi wile moku. taso mi jo ala e moku. :: I want to eat. But I don't have food.  
  mi wile pali kepeken nimi "lon". :: I need more exercises with "lon". 
  mi wile sin e telo pi lape ala. :: I need more coffee. 
  mi wile tawa ma Tosi. :: I want to go to Germany. 
  mi wile tawa weka. :: I want to leave. 
  mi wile toki meli.  :: I want to talk about girls. 
  mi wile unpa e ona. :: I want to have sex with him/her.  
  mi wile unpa e sina :: I want to have sex with you 
  mije (insa) :: person who identifies as male, e.g. female-to-male transsexual person 
  mije (olin) :: husband, boyfriend 
  mije :: man, husband, boyfriend, male 
  mije li lon sewi meli :: missionary position 
  mije lili :: son 
  mije meli :: feminine guy 
  mije sama :: brother 
  mije unpa :: male sexual partner 
  mije wan la nimi wan. meli wanla nimi awen. :: One man one word. One woman one dictionary. 
  mile moku e telo :: to be thirsty 
  moku ::  food, eat, drink 
  moku :: food, meal, to eat, to drink 
  moku li pona. :: The food is good. 
  moku e telo :: to drink 
  moku e telo nasa :: to drink alcohol 
  moku li lon insa mi. :: Food is in my stomach. 
  moku lili :: pill 
  moku lili :: snack, small ingestible item 
  moku lili pi pilin pona mute :: strong euphoric drug taken orally, e.g. MDMA 
  moku pona! :: Good food! Enjoy your meal! 
  moku suwi :: sweets, candy, chololate, etc. 
  moku telo :: liquid food, e.g. soup 
  moku walo :: whiteish food, e.g. rice 
  moli :: death; to die, to kill 
  monsi :: a person's back  
  monsi :: back, behind, butt 
  monsi :: back, butt 
  monsi :: butt, ass 
  monsi :: rear, back, behind 
  mu :: woof, meow, moo, any animal sound 
  mu.  :: meow, woof, moo, etc. 
  mu. :: Meow. Woof. Grrr. Moo. (sounds made by animals) 
  mun :: moon, lunar  
  mun li pimeja (ale) :: it's new moon 
  mun li pimeja e suno :: solar eclipse 
  mun li sike (ale) :: it's full moon 
  musi :: to have fun, to amuse; game, fun 
  musi pona! :: Good fun! Have fun! 
  mute ::  many, a lot 
  nanpa :: number     
  nanpa pi ilo toki :: phone number 
  nanpa pi ma tomo :: zip code 
  nasa ::  crazy, stupid, silly, weird, drunk, strange 
  nasa :: crazy, foolish 
  nasa lukin :: funny-looking 
  nasin :: road, way, doctrine, method 
  nasin pi toki pona :: the ideology behind Toki Pona 
  nasin ale :: The Way of Life 
  nasin ante li pona tawa jan ante. :: Different ways are good for different people.  
  nasin li jo e telo kiwen :: the roads are icy 
  nasin mani li ike.  :: Capitalism is negative.  
  nasin pona :: Taoism 
  nasin pona :: Taoism, simple or good path 
  nasin pona Juju :: Unitarian Universalism  
  nasin pona Lasapali :: Rastafarianism 
  nasin pona Latapali :: Rastafarianism 
  nasin pona li mute. :: The good ways are many. There are many right ways of doing things. 
  nasin sewi :: religion 
  nasin sewi :: religion, spiritual path 
  nasin sewi :: religions 
  nasin sewi Jawatu :: Judaism 
  nasin sewi Jawatu :: Judaism 
  nasin sewi Kolisu :: Christianity 
  nasin sewi Kolisu :: Christianity 
  nasin sewi Puta :: Buddhism 
  nasin sewi Puta :: Buddhism 
  nasin sewi Silami :: Islam 
  nasin sewi Silami :: Islam 
  nasin sewi ma :: earth religion, e.g. Native American beliefs 
  nena (lawa) :: nose 
  nena :: bump, hill, extrusion 
  nena kon :: nose  
  nena kute :: ear 
  nena lili (unpa) meli :: clitoris 
  nena lili (unpa) meli :: clitoris 
  nena lili pi nena mama :: nipples 
  nena mama, nena meli  :: breasts 
  nena meli :: breasts 
  nena sike meli :: female breasts 
  nena suli li pana e ko seli :: a volcano is erupting 
  ni ::  this, that  
  ni li ike tawa mi :: That is bad to me. / I don't like that. 
  ni li kule seme? :: What color is that? 
  ni li pilin lete mute. :: This is very cold. 
  ni li pilin seli lili. :: This feels warm. 
  ni li pona tawa mi. :: That is good to me. / I like that. 
  ni li jan lili ona pi nanpa tu. :: This is her second child. 
  ni li jan seme?  :: Who is that? 
  nimi "lon" li pona ala tawa mi. :: "lon" is not easy for me. 
  nimi :: name, word 
  nimi pi mi mute :: our names 
  nimi kepeken @ :: email  ??
  noka :: foot, leg 
  noka :: leg, foot 
  noka :: leg, foot 
  o :: used for vocative and imperative 
  o kalama ala! :: Don't make noise! 
  o tu e palisa ni. :: Split this stick.  
  o weka e jan lili tan ni. :: Remove the kid from here  
  o weka e len sina. :: Remove your clothes. 
  o jo e sijelo pona :: to your health 
  o moli e pipi kepeken palisa.  :: Kill the roach with the stick. 
  o olin e jan poka.  :: Love thy neighbour.  
  o pana e sitelen ma tawa mi. :: Give me the map. 
  o pana e pona tawa ma.  :: Love the earth. Take care of our planet.   
  o pana e sike tawa mi.  :: Give the ball to me. 
  o pilin e nena.  :: Touch the button. 
  o sona ala. o pali.  :: Stop thinking. Do stuff.  
  o sona e sina!  :: Know thyself!  
  o tawa musi poka mi!  :: Dance with me! 
  o tu.  :: Break up. Split apart. 
  oko :: eye 
  oko :: eye 
  oko :: eye 
  oko mi li lukin pona :: my eyes see well 
  oko sina li pona lukin :: you have beautiful eyes 
  olin :: to love (a person) 
  olin :: to love affectionately, as of a person 
  olin e jan mute :: to be polyamorous 
  olin e meli :: to love women 
  olin e meli e mije :: to love women and men 
  olin e mije :: to love men 
  olin suli li awen. :: Old love never rusts. 
  ona ::  he, she, it  
  ona anu jan ante li ike? :: Is he bad, or is it the   other person who's bad? 
  ona li kama tawa tomo mi. :: He came to my house. 
  ona li lon ala lon tomo? :: Is he in the house? 
  ona li lon sewi mi. :: He is above me. 
  ona li tawa ala tawa ma ike? :: Did he go to the evil land? 
  ona li tawa e len mi. :: She moved my clothes. 
  ona li tawa sewi kiwen.  :: She's going up the rock. 
  ona li wile jo e ilo. :: He would like to have a tool. 
  ona li jo e seme? :: What does he have? 
  ona li kama tawa ma mi. :: He's coming to my country. 
  ona li kule e tomo tawa.  :: He's painting the car. 
  ona li lawa e jan tawa ma pona. :: He led people to the good land. 
  ona li lukin e pipi. :: He's watching the bug. 
  ona li lukin sama pipi. :: He looks like a bug. 
  ona li pona e ilo. :: She's fixing the machine. 
  ona li pona li lili. :: It is good and is small. 
  ona li wile mute e ni. :: He wants that a lot. 
  ona li wile ala kute e ni. :: He shouldn't hear this.  
  ona mute :: they, them 
  ona mute li tawa utala :: They're going to the war. 
  ona mute li nasa e jan suli.  :: They drove the adults crazy. 
  open :: to open, to begin, to turn on 
  pakala ::  mess up, destroy, accident 
  pakala! :: f-ck! d-mn! 
  pali :: Work 
  pali :: occupations 
  pali :: to do, to make, to work; activity, work 
  pali ala :: not working 
  pali e ike tawa :: to do bad things to, to show disrespect for 
  pali li ike tawa mi. :: I'm lazy. 
  pali li pana e sona.  :: One learns by experience.  
  pali pona :: Order 
  pali pona li lawa tawa lon. :: Good work is most importand in live. / Order is the half of the live. 
  palisa (mije) :: penis 
  palisa :: penis-shaped thing, e.g. dildo 
  palisa :: rod, stick, pointy thing 
  palisa li lawa e mije.  :: A man's penis control him.  
  palisa lili noka :: toes 
  palisa luka :: finger 
  palisa mije :: penis 
  palisa mije :: penis 
  palisa sina li kiwen :: your cock is hard 
  palisa tawa :: vibrating dildo 
  palisa uta :: tongue 
  palisa uta :: tongue 
  pana :: to give, to send, to release, to emit 
  pana e ko jaki :: to pooh, to shit 
  pana e kon (pi pilin) pona :: to laugh 
  pana e moku tawa :: to feed, nourish 
  pana e palisa lon lupa :: to penetrate 
  pana e palisa uta lon :: to lick 
  pana e pilin pona tawa :: to send positivity to, make feel good 
  pana e sona :: to teach (give knowledge) 
  pana e telo (walo) mije :: to ejaculate  
  pana e telo jelo :: to pee, to urinate 
  pana e telo oko :: to cry, weep 
  pana e uta (tawa jan, lon ijo) :: to kiss 
  pana e uta lon lupa (meli) :: to perform cunnilingus 
  pana e uta lon palisa :: to fellate 
  pana wawa :: BDSM 
  pi :: essentially means "of" (seperator) 
  pilin :: feel, think, touch 
  pilin :: feelings 
  pilin :: feelings, emotions, to feel, heart 
  pilin :: heart 
  pilin :: to feel, touch 
  pilin ala :: indifferent, unfeeling 
  pilin e ike jan :: to pity somebody, feel bad for somebody 
  pilin e moli jan :: to mourn somebody 
  pilin e weka jan :: to miss somebody 
  pilin ike :: to feel bad, sad, depressed, unhappy, bitter, discontented, grumpy 
  pilin ike tan :: be afraid of, sad because of, regret, be offended by 
  pilin ike tawa :: to have negative feelings for, be upset at, angry at, hate, resent 
  pilin ike wawa :: to have intense negative feelings, be pissed off, furious 
  pilin nasa :: drunk, high 
  pilin nasa :: to feel silly, strange, weird, crazy, drunk, high  
  pilin pona :: to feel good, happy, content, enjoy oneself, comfortable  
  pilin pona li pana e sijelo pona. :: Positive feelings grant good health. Mind over matter.   
  pilin pona mute :: to feel great, amazing, awesome 
  pilin pona tan :: to feel good because of, to enjoy 
  pilin wawa (unpa) :: orgasm 
  pilin wawa :: to feel strong, energetic, excited, confident, proud  
  pimeja :: black, dark 
  pimeja :: black, dark 
  pimeja laso :: blueish black 
  pimeja li lon :: it is night 
  pini :: end; to end, to stop, to turn off 
  pini li pona la ale li pona. :: Is the end good -- everything is good. 
  pini palisa :: glans, head of the penis 
  pini pi nena mama :: nipples 
  pini pi sike sune :: sylvester 
  pipi ::  bug, insect, spider  
  pipi :: any type of bug  
  pipi li lukin li unpa. :: The bug looks and has sex. 
  pipi li lon anpa mi. :: The bug is underneath me. 
  pipi li moku ala moku e kili? :: Are the bugs eating the fruit? 
  pipi li moli. :: The bug is dead. 
  pipi li moku e kasi.  :: Bugs eat plants. 
  poka :: hip 
  poka :: side, hip, nearby 
  poka mi li pakala.  :: My hip hurts. 
  poki :: container, bowl, glass, cup, box, etc. 
  poki :: glass, cup, bottle, bowl, container 
  poki kon :: lungs 
  poki lete :: refrigerator 
  poki lete :: refrigerator 
  poki seli :: oven, microwave 
  poki seli :: oven, microwave 
  poki telo :: sink, bathtub 
  pona ::  good, simple, to fix, to repair 
  pona :: yay!, cool, good 
  pona e pilin jan :: cheer up, make somebody happy 
  pona lukin  :: pretty, attractive 
  pona lukin :: beautiful, pretty, handsome 
  pona moku :: delicious, tasty 
  pona unpa :: sexy, good in bed 
  pona! :: Yay! Good! Hoorah! 
  sama :: same, similar 
  seli ::  warm, hot, to burn 
  seli suno :: the sun's heat 
  seli li lon :: it's warm or hot 
  seli suno li seli e tomo mi.  :: The sun's warmth heats my home.  
  selo :: skin 
  selo :: skin, external surface of something 
  selo lon pini palisa :: foreskin 
  selo mi li wile e ni: mi pilin e ona.  :: My skin wants this: I touch it. 
  seme :: what, which (used to make question words) 
  sewi ::  high, superior, sky 
  sewi :: high, above, roof, top, sky 
  sewi monsi :: upper back, shoulders 
  sewi pi sinpin lawa :: forehead 
  sijelo :: Health 
  sijelo :: body 
  sijelo :: body 
  sike :: circle, ball 
  sike mama waso :: egg 
  sike mije (tu) :: testicles, balls 
  sike mije :: man's testicles 
  sike suno wan :: one year 
  sin :: new, another, more 
  sin en ante li sin e lawa li pana e sona. :: Novelty and change freshen the mind and bring insight.  
  sina ::  you, your  
  sina kama e ni: mi wile moku. :: You caused this: I want to eat.   You made me hungry. 
  sina ken ala ken lape? :: Can you sleep? 
  sina lukin ala lukin e kiwen? :: Do you see the rock?  lukin  Yes  lukin ala  No 
  sina pana ala pana e moku tawa jan lili? :: Did you give food to the child? 
  sina pilin e seme? :: What are you thinking? 
  sina pilin seme? :: How do you feel?  
  sina pona ala pona? :: Are you okay? 
  sina sona ala sona e toki mi? :: Do you understand what I'm saying?  sona  Yes  sona ala  No 
  sina wile ala wile moku? :: Do you want to eat?  wile  Yes  wile ala  No 
  sina jo e kili anu telo nasa? :: Do you have the fruit,   or is it the wine that you have? 
  sina kama anu seme? :: Are you coming or what?  
  sina kama tan seme? :: Why did you come? 
  sina kama jo e jan pona lon ni.  :: You will get friends there. 
  sina kama tan ma seme? :: Which country do you come from?  
  sina ken ala ken kama?  :: Can you come? 
  sina kepeken ala kepeken e ni?  :: Are you using that? 
  sina lon seme? :: Where are you?  
  sina lon ala lon ma tomo Wankuwa? :: Do you live in Vancouver?  
  sina lon ma tomo seme? :: What city do you live in? 
  sina lon seme?  :: Where are you?  
  sina lukin sewi e suno. :: You look up at the sun. 
  sina lukin e jan seme? :: Whom did you see? 
  sina lukin e seme? :: What are you watching? 
  sina lukin e pipi. :: You're watching a bug. 
  sina moku e telo nasa la sina nasa. :: If you drink beer, you'll be silly. 
  sina moli la sina ken ala toki. :: If you are dead, you can't speak. 
  sina pakala e seme? :: What did you hurt? 
  sina pakala e ilo kepeken nasin seme?  :: How did you break the tool? 
  sina pali e ni kepeken nasin seme? :: How did you make this? 
  sina pana e ike, la sina kama jo e ike. :: If you give evil, you will receive evil. 
  sina pilin seme? :: how are you? how are you feeling? 
  sina pona. :: You are good. / You fix. 
  sina sona e toki ni la sina sona e toki pona!  :: Figure this one out for yourself. :o) 
  sina suli. :: you (are) big/important. 
  sina tawa ma tomo tan seme?  :: Why did you go to the city? 
  sina toki e ni tawa mi: sina moku. :: You told me that you are eating. 
  sina toki pi mama anu jan lili? :: Are you talking about the parent,   or is the child that you're talking about? 
  sina toki tawa jan seme? :: Whom are you talking to? 
  sina toki tawa mi anu ona? :: Are you talking to me,   or are you talking to him? 
  sina toki tawa mi anu seme? :: You ask _me_? 
  sina wile kepeken e ilo. :: You have to use tools. 
  sina wile tawa telo suli. :: You want to go to the ocean. 
  sina wile ala wile pali? wile ala.  :: Do you want to work? No. 
  sina wile e mani anu seme? :: Do you want the money or what? 
  sina wile kama tawa tomo toki.  :: You should come to the chat room. 
  sina wile moku anu seme? :: Do you want to eat or what? 
  sina wile tawa ma seme?  :: What place do you want to go to? 
  sina wile toki tawa mije anu meli?  :: Do you want to talk a male, or a female? 
  sinpin (lawa) :: face 
  sinpin :: chest, abdomen, face 
  sinpin :: wall, chest 
  sitelen :: picture, image, to draw, to write 
  sitelen e toki :: to write 
  sitelen pi ilo nanpa :: computer screen 
  sitelen toki :: writing 
  sitelen unpa :: visual erotica, porn 
  sona :: Wisdom 
  sona :: to know, to know how to; wisdom 
  sona e toki :: to know, speak, understand a language 
  sona mute :: smart, intelligent, wise 
  sona pona e toki :: to master a language 
  soweli :: mammal 
  soweli :: meat from a mammal, e.g. beef, pork 
  soweli li kama moli. :: The cheetah is dying. 
  soweli lili pi ilo nanpa :: computer mouse 
  soweli mi li kama moli.  :: My dog is dying. 
  suli ::  big, tall, long, important 
  suli :: big, tall, fat 
  suno ::  sun, light  
  suno li suli. :: The sun is big. 
  suno li lon sewi. :: The sun is in the sky. 
  suno li suli ala suli? :: Is the sun big? 
  suno li jelo.  :: The sun is yellow. 
  suno li lon :: it is day 
  suno li lon :: it's sunny 
  suno li lon poka pimeja.  :: Light is beside darkness. Opposites are interconnected. Yin and yang. 
  suno li suli. :: The sun is big. 
  suno pona! :: Good sun! Good day! 
  supa :: any type of furniture 
  supa lape :: bed 
  supa lawa :: pillow 
  supa moku :: dinner table 
  supa monsi :: chair, couch 
  supa pali :: work desk 
  suwi :: sweet 
  suwi :: sweet, cute; candy, cookie 
  suwi lukin :: cute 
  tan :: reason, cause; because of, from 
  taso :: but, only 
  tawa :: to go to, to move, to, for 
  tawa musi :: dance (move entertainingly) 
  tawa pona! :: (in reply) Go well! Good bye! 
  tawa pona.  :: Good bye (spoken by the person who's staying) 
  telo (loje) mun :: menses 
  telo (walo) mije :: sperm, come 
  telo ::  water, liquid  
  telo :: water, beverage, liquid, sauce 
  telo li pona. :: Water is good. 
  telo ona :: his/her/its water 
  telo e mi :: to shower 
  telo jaki lon nena sinpin :: snot 
  telo jelo :: urine (yellow fluid) 
  telo jelo :: urine, pee 
  telo kili :: juice 
  telo kili ni li suwi. :: This fruit drink is sweet. 
  telo kiwen :: ice 
  telo kiwen lili li kama :: it's hailing 
  telo li kama :: it's raining  
  telo li pona.  :: Water is good.  
  telo lili li lon kon :: it's humid 
  telo loje :: blood 
  telo mama soweli :: cow milk 
  telo nasa :: alcohol, beer, wine 
  telo nasa :: alcohol, e.g. beer, wine, whisky 
  telo nasa :: intoxicating liquid, e.g. alcohol 
  telo nasa loje seli :: mulled claret 
  telo nasa pi wawa ala :: weak beer, US American beer 
  telo nasa wawa :: vodka, whisky, 
  telo pi lape ala :: coffee 
  telo seli :: hot beverage, e.g. coffee 
  telo seli jelo :: green tea  
  telo seli pimeja pi lape ala :: coffee 
  telo seli wawa :: coffee 
  telo seli wawa :: coffee  
  telo sijelo loje :: blood (red bodily fluid)  
  telo suli li ike tawa mi. :: I don't like the ocean. 
  telo suli li laso.  :: The big water [ocean] is blue. 
  telo walo mije :: The fluid that a man releases during unpa. 
  telo wawa :: energy drink 
  telo wawa :: energy drink  
  tenpo :: time 
  tenpo :: time 
  tenpo ala :: never 
  tenpo ale :: always, all the time 
  tenpo ali la o kama sona!  :: Always learn!  
  tenpo kama :: future 
  tenpo kama :: the future (coming time) 
  tenpo kama lili :: soon (little coming time) 
  tenpo lete :: winter 
  tenpo lete :: winter 
  tenpo li sijelo e sijelo ike ale. :: The time heals every wounds. 
  tenpo li tawa la sona li kama. :: Time comes -- advice comes. 
  tenpo lili :: soon, moment, briefly  
  tenpo lili la mi wile weka :: I must leave soon  
  tenpo moku :: mealtime 
  tenpo mun :: month 
  tenpo mun pi nanpa luka ::  May  
  tenpo mun pi nanpa luka luka :: October 
  tenpo mun pi nanpa luka luka tu :: December 
  tenpo mun pi nanpa luka luka wan :: November 
  tenpo mun pi nanpa luka tu :: July 
  tenpo mun pi nanpa luka tu tu :: September 
  tenpo mun pi nanpa luka tu wan :: August 
  tenpo mun pi nanpa luka wan :: June  
  tenpo mun pi nanpa tu :: February 
  tenpo mun pi nanpa tu tu :: April 
  tenpo mun pi nanpa tu wan ::  March 
  tenpo mun pi nanpa wan :: January 
  tenpo mute :: often (many times) 
  tenpo mute :: often, many times 
  tenpo ni :: now 
  tenpo ni :: the present (this time) 
  tenpo pi mute seme la sina sike e suno? :: How old are you? 
  tenpo pimeja :: night (dark time) 
  tenpo pimeja :: night 
  tenpo pimeja ni :: tonight (this dark time) 
  tenpo pimeja pini :: last night (past dark time) 
  tenpo pini :: past 
  tenpo pini :: the past (past time) 
  tenpo pona Kolisu :: Chrismas 
  tenpo seli :: summer 
  tenpo seli :: summer 
  tenpo seme la ona li kama lon tomo sina? :: When is he coming to your house? 
  tenpo seme? :: when? 
  tenpo sike :: year 
  tenpo sin :: again 
  tenpo suli :: long time 
  tenpo suno :: day (sun time) 
  tenpo suno :: day 
  tenpo suno kama :: tomorrow (coming sun time) 
  tenpo suno kama :: tomorrow 
  tenpo suno kama la mi pali e lipu sin. :: I'll update my web page next day. 
  tenpo suno mute li pini la mi tawa tomo. :: A lot of days ago I went home.  ?
  tenpo suno ni :: today (this sun time) 
  tenpo suno ni :: today 
  tenpo suno pi nanpa luka :: Friday 
  tenpo suno pi nanpa luka tu :: Sunday 
  tenpo suno pi nanpa luka wan :: Saturday 
  tenpo suno pi nanpa tu :: Tuesday 
  tenpo suno pi nanpa tu tu :: Thursday 
  tenpo suno pi nanpa tu wan :: Wednesday 
  tenpo suno pi nanpa wan :: Monday 
  tenpo suno pi pali ala :: (public) holiday 
  tenpo suno pini :: yesterday (past sun time) 
  tenpo suno pini :: yesterday 
  tenpo suno pini la wan pi ilo HTML li pona lili. tenpo suno pini la wan pi ilo HTML li pona mute. :: The HTML part is better now. 
  tenpo suno sin :: morning 
  tenpo suno sin ale la sina moku e telo seli pimeja :: Every morning I drink coffee. 
  tenpo telo :: rainy season 
  tenpo telo :: rainy season 
  toki :: Language 
  toki :: language 
  toki :: language, to talk, to speak 
  toki :: language; hey! 
  toki Alapi :: Arabic 
  toki Apikan :: Afrikaans 
  toki Awasa :: Hausa 
  toki Epelanto :: Esperanto 
  toki Ewantalu :: Ewantal 
  toki Inli pona :: Basic English 
  toki Insi :: Hindi 
  toki Intelinka :: Interlingua 
  toki Inu :: Inupiaq, Inuktitut, Eskimo 
  toki Ipo :: Igbo 
  toki Ito :: Ido 
  toki Iwisi :: Hebrew 
  toki Jolupa :: Yoruba 
  toki Kalike :: Scots Gaelic 
  toki Kantun :: Cantonese 
  toki Kisawili :: Swahili 
  toki Kuwenja :: Quenya, Elvish 
  toki Lolan :: Loglan	 
  toki Loma :: Latin 
  toki Losupan :: Lojban 
  toki Lunasimi :: Quechua 
  toki Malasi :: Marathi 
  toki Nosiki sin :: 	Norwegian Nynorsk 
  toki Olapu :: Volapük 
  toki Pansapi :: Punjabi 
  toki Pasiki :: Fyksian 
  toki Pasuto :: Pashto 
  toki Sami :: Laplander 
  toki Sankitu :: Sanskrit 
  toki Sinan :: Klingon 
  toki Tamasiko :: Berber, Tamazight 
  toki Tami :: Tamil 
  toki Teluku :: Telugu 
  toki Utu :: Urdu 
  toki ike :: to say negative things 
  toki ike lon :: to say bad things about, complain about 
  toki ike tawa :: to say bad things to, insult, speak rudely to 
  toki li pona tawa mi. :: I like talking. / I like languages. 
  toki li pona.  :: ommunication is good.  
  toki lon toki :: to speak in a language 
  toki nanpa wan :: primary language 
  toki pona :: Toki Pona 
  toki pona :: to say nice things 
  toki pona e toki :: to speak a language well 
  toki pona li toki pona.  :: Toki Pona is a good language.  
  toki pona lon :: to say good things about, praise  
  toki pona tawa :: to say nice things to, compliment 
  toki sitelen :: written language 
  toki sona :: proverbs 
  toki utala tawa :: to argue with, criticize 
  toki! :: Hello!, Hi!, etc. 
  tomo ::  house, building, construction 
  tomo :: buildings 
  tomo mi :: my house 
  tomo pi jan Keli en mije ona li suli. :: The house of Keli and her boyfriend is big. 
  tomo pi jan Lisa :: Lisa's house 
  tomo pi ona mute :: their house 
  tomo pi telo nasa :: building of alcohol; a bar, pub, etc. 
  tomo tawa :: car (moving construction) 
  tomo tawa kon :: airplane, helicopter 
  tomo tawa telo :: boat, ship 
  tomo lape :: bedroom 
  tomo mani :: bank 
  tomo mi li weka tan ni. :: My house is away from here. 
  tomo moku :: dining room, kitchen, grocery store, restaurant 
  tomo moku :: grocery store, restaurant 
  tomo pali :: work(place), office, factory, etc. 
  tomo pali :: work(place), office, factory, etc. 
  tomo pi ijo kama jo :: shop  ??
  tomo pi telo en moku pana. :: restaurant 
  tomo sona :: school, university 
  tomo tawa sina li pakala ala pakala? :: Is your car messed up? 
  tomo telo :: bathroom 
  tomo telo :: restroom 
  tomo toki :: chat room, conference room 
  tomo unpa :: bedroom, boudoir 
  tomo unpa :: brothel, sex house 
  tomo unpa :: sex place, e.g. bedroom, boudoir, brothel, etc.  
  tu  :: 2  
  tu :: two; to divide 
  tu tu :: 2 + 2 = 4 
  tu wan :: 2 + 1 = 3 
  unpa ::  have sex with, sex, sexual 
  unpa :: sex, to have sex, to fuck 
  unpa li pona :: sex is good, I like sex 
  unpa nasa :: kinky sex 
  unpa sama soweli :: doggy style 
  unpa uta :: oral sex 
  uta :: mouth 
  uta :: mouth 
  uta :: mouth  
  utala ::  war, battle, to fight 
  utala li ike tawa mi. :: I don't like wars. 
  utala li ike.  :: Conflict is bad.  
  walo :: white 
  walo :: white, light 
  walo pimeja :: grey (dark white) 
  walo uta :: teeth 
  wan :: 1  
  wan :: one; to unite 
  wan sijelo :: body part 
  waso :: bird, bat 
  waso :: chicken, poultry 
  waso li ken ala lukin la ona li kin ken jo e kili. :: A blind chicken can find a corn too. 
  wawa :: strong, intense; energy, power 
  wawa li lon insa.  :: Energy comes from inside. Youth is all in the heart.  
  weka :: away; to remove, to eliminate 
  weka e ike jan :: forgive somebody 
  weka lili li pona tawa lawa. :: Temporary isolation is good for meditation.  
  wile ::  to want, to need, to have to, desire 
  wile :: to want, desire, would like, hope 
  wile e pona tawa jan :: to wish somebody well 
  wile ike :: to have negative intentions, malevolent 
  wile lape :: to be tired, sleepy, wanting to rest 
  wile lawa :: to be dominant  
  wile moku :: hungry 
  wile moku :: to be hungry 
  wile moku e telo :: thirsty 
  wile moli :: suicidal 
  wile moli e jan :: homicidal, wanting to murder 
  wile mute :: to crave, really want 
  wile mute ike :: to want too much, greedy 
  wile pali e ijo :: bored, wanting to do something  
  wile pana e pona (tawa jan) :: helpful (to someone) 
  wile pi jan ike li pakala e ijo.  :: The desires of evil people mess things up. 
  wile pona :: to have good intentions, mean well 
  wile sona li mute e sona.  :: Curiosity feeds wisdom. One learns by asking questions.   
  wile unpa :: horny 
  wile unpa :: horny, lustful 
  wile unpa e meli :: to be sexually attracted to women 
  wile unpa e meli e mije :: to be sexually attracted to women and men  
  wile unpa e mije :: to be sexually attracted to men 
'''.split('\n').map (w) ->
  [tokipona, english] = w.split '::'
  return entry =
    tokipona: tokipona.trim()
    english: english.trim()
    tokiponaHTML: selectable tokipona
    englishHTML: selectable english


