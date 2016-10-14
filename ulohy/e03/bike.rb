class Bike
    @@registr = []

    attr_reader :max_front_gear
    attr_reader :max_rear_gear
    attr_reader :bike_name
    attr_reader :color
    attr_reader :wheel_size

    def initialize(max_front, max_rear, name, color = "", wheel_size = 26)
        @max_front_gear = max_front
        @max_rear_gear = max_rear
        @bike_name = name
        @color = color
        @wheel_size = wheel_size

        @current_front_gear = 1
        @current_rear_gear = 1
        @distance = 0

        @@registr.push(self)
    end

    def front_gear_up!
        @current_front_gear += 1 unless @current_front_gear >= @max_front_gear
        self
    end

    def front_gear_down!
        @current_front_gear -= 1 unless @current_front_gear <= 1
        self
    end

    def rear_gear_up!
        @current_rear_gear += 1 unless @current_rear_gear >= @max_rear_gear
        self
    end

    def rear_gear_down!
        @current_rear_gear -= 1 unless @current_rear_gear <= 1
        self
    end

    def go!
        @distance += @current_front_gear * @current_rear_gear * (@wheel_size/10.0)
        self
    end

    def distance
        @distance
    end

    def get_current
        puts "#{@current_front_gear}x#{@current_rear_gear}"
    end

    def action
        number = rand(10)
        case number
        when 0
            rear_gear_down!
        when 1
            rear_gear_up!
        when 2
            front_gear_up!
        when 3
            front_gear_down!
        when 4..9
            go!
        end
        "#{@bike_name} (#{@wheel_size}\"): najeto #{@distance}"
    end

end
