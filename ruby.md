# Kurz Programovací jazyk Ruby (PRUBY)

* Marek Hulán
* mhulan@seznam.cz
* IRC: mhulan #theforeman @freenode
* GitHub: ares

![pcdir.png](pcdir.png)

---

# Struktura kurzu

* každý den 9-17
* přestávky dle potřeby, oběd
* vlastní počítače
* programovací úlohy
* odkazy:
    * [Tato prezentace](https://ares.github.io/pruby/)
    * [Etherpad](https://v.etherpad.org/p/ruby_kurz)
    * [Ruby installer a devkit](https://rubyinstaller.org/downloads/)
    * [Git installer](https://git-scm.com/download/win)
    * [Ruby Warrior](https://www.bloc.io/ruby-warrior#/)

---

# Základní vlastnosti jazyka

* Interpretovaný
* Plně objektový
* Vše jsou výrazy (expression)
* Automatická správa paměti
* Silně typovaný
* Dynamicky typovaný

<br />

     !ruby
     a = "x"
     b = a + 2

---

# Instalace

* standardní balíčkovací systémy
* na Windows existuje installer
* je možné i kompilovat ze zdrojového kódu (MIT)
* [https://rubyinstaller.org/downloads/](https://rubyinstaller.org/downloads/)

---

# Jak spouštět ruby

* ruby -v
* ruby skript.rb
* shebang nebo asociace souborů
* irb - interactive ruby

---

# Co budeme potřebovat

* terminál
* git, github
* textový editor - [https://atom.io](https://atom.io)

---

# Základy syntaxe

    !ruby
    puts("hello world!");

---

# Základy syntaxe

    !ruby
    puts("hello world!");
    puts "hello world!"

---

# Základy syntaxe

    !ruby
    puts("hello world!");
    puts "hello world!"
    puts 'hello wolrd!'

---


# Základy syntaxe

    !ruby
    puts("hello world!");
    puts "hello world!"
    puts 'hello wolrd!'
    
    1 + 1         # => 2
    1 * 3 / 2     # => 1
    1.0 * 3 / 2   # => 1.5

    1.even?               # => false
    "ruby".upcase.reverse # => 'YBUR'
    "ruby".size.even?     # => true
    # single line comment

---

# Datové typy - ukázky

* string
* číslo (Fixnum, Float, BigDecimal)
* nil
* true, false (TrueClass, FalseClass)
* pole
* hash
* symbol

---

# Objekty a metody

* tečka znamená volání metody na daném objektu
* operátory jsou také metody

ekvivalentní výrazy

    !ruby
    3 + 3
    3.+(3)
    
    [1, 2][0]
    [1, 2].[] 0

---

# Proměnné

* není třeba explicitní deklarace

<br />

    !ruby
    $global
    @@class_variable
    @instance_variable
    local_variable
    CONSTANT
    
    a = 3
    a = '3'
    a = a * 3
    a, b = 3, a
    a, b = [ 1, 2 ]

---

# Řízení běhu programu - if

* za nepravdu se považuje pouze false a nil
* prázdné stringy, prázdná pole i hashe, čísla jsou pravdivé hodnoty

příklad

    !ruby
    if a
      1
    elsif b == "x"
      2
    else
      3
    end

---

# Řízení běhu programu

Negativní varianta

    !ruby
    unless locked
      # locked is false or nil
    end

Tzv.  statement modifiers

    !ruby
    x = x.reverse if x.size > 1

    puts 'hello' unless muted

---

# Logické operátory

* běžné logické operátory: `&&` `||` `!`
* operátory pro řízení běhu: `and` `or`
* porovnávací operátory: `==` `<` `>` `>=` `>=` `=~`
* líné vyhodnocování a nelíné varianty `&` a `|`

---

# Regulární výrazy


    !ruby
    string = 'localhost:2000'
    string =~ /.*:.+/     # 0
    string =~ /(.)*:(.)+/ # nastaví $1 a $2

    # vrátí match data nebo nil
    data = string.match(/^(.):(\d+)$/)
    data[1] # => localhost
    data[2] # => 2000

pro víceřádkové stringy je třeba \A a \Z

---

# Ternární operátor

    !ruby
    if important
      string.upcase
    else
      string.downcase
    end

    important ? string.upcase : string.downcase

    result = input.even? ? 'win' : 'lose'

---

# Řízení běhu programu - case

    !ruby
    case input
    when 'q', 'e'
      quit
    when 'f'
      format_hdd
    when 'h'
      help
    else
      unknown_input
    end
    
---

# Řízení běhu programu - while

    !ruby
    while a < b          # until a > b
      a += 1             #   a += 1
    end                  # end

    while true
      sleep 1            # one second
      break if finished?
    end

    begin                # at least once
      a += 1
    end while a < b

    a += 1 while a < b

---

# Metody

* vždy vrací hodnotu - výsledek posledního výrazu
* return ukončí běh předčasně
* mohou akceptovat lib. množství argumentů

ukázka definice a volání

    !ruby
    def say_hello
      puts 'hello world'
    end
    
    say_hello

---

# Metody - argumenty

    !ruby
    def name(a, b)
    def name(a, b='x')
    def name(*args)
    def name(a, b, *args)
    def name(a: 'x', b: 'y') # ruby 2.0
    def name(a:, b:)         # ruby 2.1

argumenty jsou dostupné uvnitř metody jako lokální proměnné viz ukázka

---

# Metody - návratová hodnota

    !ruby
    def find_position(array, needle)
      return nil unless array.include?(needle)

      for i in (0..array.size-1)
        return i if array[i] == needle
      end
    end

    def minimal_allocation(input)
      allocate_size = input.size * 3
      5 if allocate_size <= 0
    end

---

# Konvence - soubory, jména, názvy metod

* soubory jsou shodné s názvy tříd, které definují
* proměnné a metody `pomoci_snake_case`
* jména tříd `CamelCase` (více později)
* konstanty `VELKYM_PISMEM`
* odsazuje se dvěma mezerami
* metody vracející true/false končí otazníkem
* metody dělající nečekané věci končí vykřičníkem

---

# První úloha - E01 implementace metod

---

# Skripty složené z více souborů

* pro načtení jiného souboru použijeme `require`
* pokud již soubor v daném procesu requirován byl, require se přeskočí
* require hledá ve standardní cestě Ruby knihoven, případně dle zadané cesty
* cestu je možné měnit - `$LOAD_PATH`
* `load` načítá soubor opakovaně

---

# Bloky

* je lepší se vyhnout klasickým for-cyklům
* nechceme vypsat 1. až 5. prvek, ale každý prvek

metoda akceptující blok - each

    !ruby
    array.each do |item|
      puts item.upcase
    end

    array.each { |item| puts item.upcase }

---

# Bloky

* jsou kusy kódu, které se ihned neprovádí
* vidí proměnné ve stejném scopu
* každá metoda může akceptovat blok

příklad s proměnnou

    !ruby
    sum = 0
    [1, 2, 3].each do |number|
      sum += number ** 2
    end
    puts sum    # => 14

---

# Iterátory

* iterátor je metoda volající blok
* block_given? k testování, zda přišel blok
* blok může akceptovat parametry

vlastní iterátor

    !ruby
    def find_by(array)
      return nil unless block_given?
      for i in (0..array.size-1)
        found = yield array[i]
        return array[i] if found
      end
    end
    find_by([3, 8]) { |n| power_of_2?(n) } # 8

---

# Užitečné vestavěné iterátory

* each
* any? all?
* map
* find / detect
* find_all / select
* sort sort_by
* inject

[http://ruby-doc.org/core/Enumerable.html](http://ruby-doc.org/core/Enumerable.html)

---

# Blok jako objekt

    !ruby
    def name(name, &block)
      action = block
      name.upcase!
      name = action.call(name)
      puts name
    end

Zejména vhodné pro uložení bloku na pozdější použití

---

# Druhá úloha - E02 iterátory

* vylepšení první úlohy
* morseovka

---

# Ruby a objekty

* všechno v Ruby je objekt
* třída vs. instance vs. objekt
* atributy, metody, zasílání zpráv

příklad definice

    !ruby
    class HelloWorld
      def say_hello
        puts 'hello'
      end
    end

    HelloWorld.new.say_hello   # prints hello

---

# Instanční proměnné / atributy

    !ruby
    class HelloWorld
      def target=(target)
        @target = target
      end

      def target
        @target
      end

      def say_hello
        puts "hello #{@target}"
      end
    end

---

# Instanční proměnné / atributy

    !ruby
    class HelloWorld
      attr_accessor :target

      def say_hello
        puts "hello #{@target}"
      end
    end

    a = HelloWorld.new
    a.target = "world"
    a.say_hello

---

# Konstruktor, destruktor, GC

    !ruby
    class HelloWorld
      def initialize(target)
        @target = target
      end

      def say_hello
        puts "hello #{@target}"
      end
    end

    a = HelloWorld.new('world')
    a.say_hello

---

# Dědičnost

* dědí se všechny metody - tedy i konstruktor
* metody se mohou v potomcích předefinovávat
* volání předefinovávané metody - super

dědící třída

    !ruby
    class LoggingHelloWorld < HelloWorld
      ...
    end

    LogginHelloWorld.new('world')

---

# Třídní metody a atributy

    !ruby
    class File
      def self.open(path)
        new(sanitize(path))
      end
    end

* třídní metody by neměly záviset na stavu objektu
* často vrací nové instance dané třídy
* třídní atributy jsou společné pro všechny instance, třídu i její potomky
* třídní atributy se příliš nepoužívají, zejména kvůli potomkům

---

# Třetí úloha - E03 MorseCoder, Bike

---

# Monkey-patching

* nadefinované třídy je možné otvírat
* metody je možné předefinovávat
* umožňuje rozšiřování vestavěných objektů
* vhodné pouze v okrajových případech

---

# Vnořené třídy a moduly

* v Ruby nejsou jmenné prostrory
* lze docílit pomocí tříd a modulů

obě varianty jsou možné

    !ruby
    class MyWorld
      class String; end
    end

    module Helpers
      class String; end
    end

    MyWorld::String.new
    Helpers::String.new

---

# Module include a extend, mixin

* modul může definovat metody
* metody modulu se nevolají přímo (*)
* modul je možné vložit do třídy
* include je vkládá jako instanční
* extend je vkládá jako třídní
* náhrada za násobnou dědičnost

---

# Module include a konflikty

* třída má přednost
* lookup chain - třída > moduly > rodič > moduly rodiče ...
* pořadí modulů hraje roli
* prepend je jako include, ale předbíhá tedy <br /> prepend moduly > třída > include moduly
* funguje i `super`, takže je bezpečnější než přímé přepisování metod
* ukázka

---

# Čtvrtá úloha - E04 rozšiřování objektů

---

# Řízení přístupu

    !ruby
    class HelloWorld
      ...
      def say_hello
        prepare; puts "hello #{@target}"
      end

      private

      def prepare
        @target.upcase!
      end
    end

možnosti jsou private, protected, public

---

# Metoda send a public_send

    !ruby
    class A
      private

      def secret
        'secret'
      end
    end

    A.new.send(:secret)        # => 'secret'
    A.new.public_send(:secret) # NoMethodError

---

# Duck typing

"Když to kváká je to kachna"

    !ruby
    class Hunter
      # tradiční přístup s typovou kontrolou
      def shoot(animal)
        bang! if animal.class == Duck
      end
    end

    class Hunter
      # duck-typing, kontrola rozhraní objektu
      def shoot(duck)
        duck.respond_to?(:quack) && bang!
      end
    end

---

# Duck typing

    !ruby
    class Hunter
      def shoot(duck)
        duck.respond_to?(:quack) && bang!
      end
    end

    module Quacker
      def quack
        'quack quack!'
      end
    end
    class Duck; include Quacker; end
    class Frog; include Quacker; end

---

# Další metody introspekce objektu

* respond_to?(:method)
* is_a?(Integer) / kind_of?(Integer)
* instance_of?
* class

další užitečné průzkumné metody

* methods
* included_modules
* inspect
* instance_variable_get
* superclass

---

# Callback method_missing

* pokud dojde k zavolání nedefinované metody, můžeme chování upravit předefinováním method_missing
* vždy ošetřit else
* vždy volat super
* vždy také předefinovat respond_to_missing

příklad s find_by_*

---

# Pátá úloha - E05 transmittery, metaprogramování

---

# Metaprogramování

* třídy jsou instance - metaclass / eigenclass
* metaprogramování = programování programování
* define_method (accessory, příklad s Bike)
* define_class
* send

---

# Výjimky

* signalizují výjimečný stav
* přerušují standardní tok programu
* nabalují cestu volání - backtrace
* raise / rescue

odchycení nespecifické výjimky

    !ruby
    begin
      save!
    rescue
      exit(1)
    end

---

# Výjimky

zpracování výjimky

    !ruby
    begin
      save!
    rescue => e
      puts "something gone wrong"
      puts e.class
      puts e.message
      puts e.backtrace.join("\n")
      exit(1)
    end

ensure - provede se vždy, např. zavření spojení

---

# Výjimky

odchycení specifických výjimek

    !ruby
    begin
      save!
    rescue SaveError => e
      puts "saving failed: #{e.message}"
    rescue StandardError
      puts "something weird happened, sorry"
    end

* výjimky jsou objekty
* rescue respektuje dedičnost
* exit a SystemExit

---

# Výjimky

* Exception
    * NoMemoryError
    * ScriptError
        * SyntaxError
    * StandardError (výchozí pro rescue)
        * ArgumentError
        * IOError
        * NameError
            * NoMethodError
        * RuntimeError (výchozí pro raise)

---

# Výjimky vs. řízení toku programu

    !ruby
    treasure = catch(:found) do
      mine_field.each do |row|
        row.each do |f|
          throw(:found, f) if f.is_a?(Treasure)
        end
      end
    end
    puts treasure

* vyhozen může být libovolný objekt
* součástí signálu může být hodnota

---

# Soubory

* filehandlery jsou instance třídy File
* obsahuje i další užitečné metody

příklady

    !ruby
    File.exists? 'path/to/file'
    File.directory? '/usr/bin'
    File.chmod 0644, 'file.rb'

    f = File.new 'my_file.txt', 'r'
    f = File.open 'my_file.txt', 'r'

---

# Soubory - módy otevření

* r – otevření souboru pro čtení (implicitní volba)
* r+ – otevření pro čtení i zápis, začíná se na začátku souboru
* w – otevření jen pro zápis, soubor je vytvořen nebo přepsán, pokud již existuje
* w+ – jako w, ale navíc i čtení
* a – jako w, ale soubor se nepřepíše, pokud existuje, začne se na konci souboru
* a+ – jako a, ale navíc i čtení
* b+ – binární mód na platformě MS Windows

---

# Soubory - čtení a zápis

    !ruby
    f = File.open 'my_file.txt'
    first_line = f.gets
    f.close

    File.open 'my_file.txt', 'r+' do |file|
      file.puts 'hello world'
    end

---

# Soubory - granulárnější přístup

    !ruby
    f.write 'string bez \n'
    f.read(n) 
    f.rewind
    f.flush
    f.eof?
    f.getc
    f.putc
    f.pos
    f.pos=

---

# Parametry při spuštění

* Vestavěná konstanta ARGV

<br>

    !ruby
    ARGV.size # v jiných jazycích ARGC
    ARGV[0]   # v jiných jazycích
              # název skriptu

    # název skriptu
    $0, __FILE__, $PROGRAM_NAME

---

# Šestá úloha - E06 soubory a výjimky

---

# Timeout

* interní timeout pro blokující operace
* jednoduchá implementace, není atomická

příklad

    !ruby
    require 'timeout'
    Timeout::timeout(rand(5) + 1) do
      Database.load_data
    end

---

# Sockety

* sockety stejně jako soubory dědí z IO
* typy socketů - unix, tcp, udp

příklad klienta

    !ruby
    require 'socket'
    client = TCPSocket.new 'localhost', 3000

    while line = client.gets
      puts line
    end

    client.close

---

# Sockety

příklad serveru

    !ruby
    require 'socket'
    server = TCPServer.new("10.0.1.2", 3000)
    client = server.accept
    client.puts Time.now
    client.close

* jakákoliv operace nad socketem může vyhodit Errno::EPIPE

---

# Sedmá úloha - E07 Implementace transmitteru s TCP socketem

---

# Thready

* implementace využívající vlákna OS
* proces může běžet na více jádrech
* vždy jedno hlavní vlákno, které může spouštět další
* konec hlavního zabije další vlákna
* lze čekat na dokončení pomocí join
* ruby kód nikdy neběží paralelně

---

# Thready - příklady

    !ruby
    5.times do |i|
      Thread.new { puts i }
    end

    t = Thread.new { ... }
    t.join         # blokuje
    t.value        # blokuje, vrací výsledek
    t.alive?
    t.status

    Thread.current
    Thread.main
    Thread.abort_on_exception = true

---

# Thready - další metody a ukázky

    !ruby
    Thread.list
    Thread.stop
    Thread.run

    t = Thread.new { ... }
    t.priority = 5
    t.kill t.terminate t.exit

    t[:variable] = 'hi'
    Thread.current[:variable]

---

# Thready - thread safe Queue

    !ruby
    queue = Queue.new
    40.times { |i| queue.push i }
    workers = (0..3).map do |worker_id|
      Thread.new(worker_id) do |id|
        begin
          while (job = queue.pop(true)) # non-blocking
            puts "#{job} take by worker #{id}"
          end
        rescue ThreadError              # pop on empty queue
        end
      end
    end
    workers.each(&:join)

---

# Osmá úloha

* MorseServer na více portech
* Port scanner
* Bike race

---

# HTTP client

    !ruby
    require 'net/http'
    Net::HTTP.get('google.com', '/index.html')

    require "uri"
    uri = URI.parse("http://google.com/")
    
    http = Net::HTTP.new(uri.host, uri.port)
    req = Net::HTTP::Get.new(uri.request_uri)
    
    response = http.request(req)
    response.code       # => 301
    response.body       # => tělo dokumentu
    response["expires"] # => -1
---

# Rubygems

* existuje obrovské množství knihoven
* vlastní balíčkovací systém
* verze, závislosti, nativní rozšíření
* [http://rubygems.org](http://rubygems.org)
* [https://www.ruby-toolbox.com/](https://www.ruby-toolbox.com/)

<br />

    !sh
    gem install bundler
    gem uninstall highline
    gem search rubocop

---

# Bundler

* seznam závislostí v Gemfile
* omezení verzí
* bundle install
* Gemfile.lock
* bundle exec

inicializace v souboru

    !ruby
    require 'rubygems'
    require 'bundler/setup'

---

# Bežné datové formáty

* YAML - load to_yaml
* JSON - parse to_json
* XML - např. gem nokogiri

---

# Devátá úloha - REST API a gemy

---

# Testy

* proč je dobré psát automatizované testy
* rozdíl mezi testy
* v Ruby světe dvě syntaxe, jedna implementace
* testy jsou ruby skripty testující jiné ruby skripty

---

# Testy

    !ruby
    require "minitest/autorun"
    
    class TestMorseCoder < Minitest::Test
      def setup
        @coder = MorseCoder.new(...)
      end
    
      def test_encode_for_single_letters
        assert_equal ".-", @coder.encode "a"
      end
    end

---

# Testy - assertions

    !ruby
    assert arg            # arg is true
    refute arg            # arg is false

    assert_equal exp, act
    assert_includes col, obj
    assert_kind_of cls, obj
    assert_nil
    assert_match exp, act
    assert_raises exc &block  

---

# Testy a stubování, mockování

* testujeme pouze jednu část
* netestované části se side-effecty stubujeme
* mocky se používají jako testovací objekty
* nejlepší je dobře navrhnout objekty

---

# Testy a stubování, mockování

    !ruby
    Kernel.stubs :puts, nil do
      c = MorseCoder.new(DebugTransmitter.new)
      assert_nil c.transmit('hello')
    end

    mock = Minitest::Mock.new
    mock.expect :puts, nil, '.-'
    MorseCoder.new(mock).transmit('a')
    mock.verify

    require 'ostruct'
    os = OpenStruct.new :name => 'Favorit'
    os.name             # => 'Favorit'
    os.wheel_size = 26

---

# Desátá úloha - E10 Psaní testů

---

# Tipy a triky a co se jinam nevešlo

* Memoize pattern (víceřádkové)
* gem pry
* [Popularita Ruby](http://www.tiobe.com/tiobe_index)
* další implementace
    - MRI
    - JRuby
    - Rubynius
    - IronRuby, MagLev
    - Ruboto

---

# Programování

* File system based databáze
* Todo.txt klient
* Intrusion detection system
* Facebook reminder
* IP kalkulačka
* Cokoliv vlastního
