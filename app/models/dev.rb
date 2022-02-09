class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        # self.freebies.map do |freebie|
        #     if freebie.item_name == item_name
        #         return true
        #     else
        #         return false
        #     end
        # end

        self.freebies.any? { |freebie| freebie.item_name == item_name}
    end

    def give_away(dev, freebie)
        # dev = Dev.find(dev_id) # find the recieving dev instance by its id
        # freebie = Freebie.find(freebie_id) # find the gived freebie instance by its id
        # self.freebies.each do |self_freebie|
        #     if self_freebie.dev_id == freebie.dev_id
        #         freebie.dev_id = dev.id
        #         freebie.save
        #     else
        #         puts "#{self.name} does not own this #{freebie.item_name}"
        #     end
        # end

        freebie.update(dev: dev) unless freebie.dev != self
    end
end
