# ToDo
* [ ] Aggiungere una funzione per disabilitare i suoni [richiesta sul post BGG]
* [ ] Aggiungere il testo con la spiegazione dei future [richiesta sul post BGG]
* [ ] BUG: se giro un GW in TW, vado avanti col deck e poi torno indietro non posso più girare la carta dal lato nero [segnalatomi da Giuseppe]
* [ ] Bottoniera rotazione radiatori: fixare l'abilitazione/disabilitazione del bottone quando cambia il deck o viene applicato un filtro, sulla prima carta visualizzata il bottone resta abilitato o disabilitato.
* [ ] Fixare la build android che non funziona più offline dopo la modifica per la web release. Al momento l'unico modo per fare la versione android è quello di rinominare il file vue.config.js in modo che non venga usato nella build. La differenza nella versione android è che nel file index.html i link js iniziano con /, mentre nella versione web i link iniziano con '/hf4-decks'.
* [ ] Aggiungere il filtro sul tipo richiesto per la promozione
* [ ] Spostare il provide/inject da App.vue in un apposito file.
* [ ] Completare il Filters->watch() con il reset e il nascondimento dei controlli esclusi dal deck selezionato.
* [ ] Verificare se funziona in android 8 che mi dicono non si vedono le immagini.
* [ ] La versione web su Safari ha il problema che appena si cambia il deck sul filtro poi non scorre più le carte con il mouse, però se si clicca su uno dei bottoni verdi a destra, scorre la carta e riprende a funzionare anche lo scorrimento tramite il mouse.
* [ ] Impostando sul Mac il tema dark non si vedono più le voci del filtro Modifiers: devo impostare un set css per il tema dark.
* [ ] Aggiungere sui componenti dinamici la transizione tra l'uno e l'altro: vedi https://stackoverflow.com/questions/40709855/vuejs-complete-dynamic-component-transition-before-rendering-new-component e https://www.geeksforgeeks.org/vue-js-transitioning-between-the-components/
* [ ] Lavorare su DeckesPage come rifacimento della CardsPage in modo da mostrare lo slider con le carte ingrandite quasi a pieno schermo e in alto la scelta del deck con accanto il bottone-icona per i filtri. Cliccando sull'icona il componente slider viene sostituito dal componente filtri. Cliccando invece sulla carta si vede il back della carta. Serve poi aggiungere di lato alla carta una piccola bottoniera verticale per mostrare altre informazioni: tipo note sul modulo, aggiornamenti alla carta, ecc. Per lo slider usare [Swiper.js](https://ionicframework.com/docs/vue/slides) che sostituisce ionic-slides: vedi https://swiperjs.com/demos#pagination-dynamic (possibilmente mettere il numero dell'immagine nel circoletto in basso).
* [ ] Aggiungere il filtro della lista in un provider/inject: vedi https://www.thisdot.co/blog/provide-inject-api-with-vue-3

# Comandi compilazione
* `NODE_ENV=github-pages ionic cap build`: compilazione per il web pubblico in github, in pratica imposta sui link '/hf4-decks'. La WebApp è visibile al link https://emmaus63.github.io/hf4-decks/decks.
* `NODE_ENV=android ionic cap build android --offline`: compilazione per l'app android, in pratica imposta sui link '/'
* `ionic cap build`: compilazione per il web locale, in pratica imposta sui link '/vue-hf4'

# Release 2 - Composizione razzo
* [ ] Aggiungere alle carte il bottone per selezionarle e metterle nel razzo.
* [ ] Usare la vista a carte per la propria mano
* [ ] Bordare di rosso quelle che mancano di supporto
* [ ] Dato il numero di burns per il viaggio calcolare il consumo di acqua comprensivo dei modificatori fornito dai supporti e dall'afterburn

# Riferimenti
* icone: https://heroicons.com
* componenti per tailwind, es. icone e altri templates: https://www.tailwindtoolbox.com/icons
* pubblicazione su Github pages della versione web: https://docs.github.com/en/issues/planning-and-tracking-with-projects e https://cli.vuejs.org/guide/deployment.html#github-pages