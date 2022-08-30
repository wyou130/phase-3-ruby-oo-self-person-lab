require 'pry'

class Person

    attr_reader :name, :happiness, :hygiene
    attr_accessor :bank_account

    def initialize(name, bank_account = 25, happiness = 8, hygiene = 8)
        @name = name
        @bank_account = bank_account
        @happiness = happiness
        @hygiene = hygiene
    end

    #separate setters for happiness and hygiene because 
    #they have additional requirements for the value being set
    def happiness=(value)
        @happiness = value.clamp(0, 10)
    end

    def hygiene=(value)
        @hygiene = value.clamp(0, 10)
    end

    def clean?
        self.hygiene > 7
        # @hygiene > 7
    end

    def happy?
        # @happiness > 7
        self.happiness > 7
    end

    def get_paid(amount)
        # @bank_account = bank_account + amount
        # @bank_account += amount
        self.bank_account += amount
        "all about the benjamins"
    end

    def take_bath
        # @hygiene += 4 #this doesn't respect the clamp
        self.hygiene += 4 #this respects the clamp
        "♪ Rub-a-dub just relaxing in the tub ♫"
    end

    def work_out
        self.happiness += 2
        self.hygiene -= 3
        "♪ another one bites the dust ♫"
    end

    def call_friend(friend)
        self.happiness += 3
        friend.happiness += 3
        "Hi #{friend.name}! It's #{self.name}. How are you?"
    end

    def start_conversation(friend, topic)
        if topic == "politics" 
            self.happiness -= 2
            friend.happiness -= 2
            "blah blah partisan blah lobbyist"
        elsif topic == "weather"
            self.happiness += 1
            friend.happiness += 1
            "blah blah sun blah rain"
        else 
            "blah blah blah blah blah"
        end
    end
    
end

wendy = Person.new("Wendy")
friend = Person.new("friend")

binding.pry