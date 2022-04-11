class Flight
    attr :passengers
    def initialize(str,n)
        @flight_number, @capacity, @passengers = str, n, []
    end

    def full?
        @passengers.count >= @capacity
    end

    def board_passenger(p)
        return if full?
        @passengers<<p if p.has_flight?(@flight_number)
    end

    def list_passengers
        @passengers.map(&:name)
    end

    def[](n)
        @passengers[n]
    end

    def <<(p)
        board_passenger(p)
    end
end