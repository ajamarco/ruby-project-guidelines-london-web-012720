module Inventory

    @prompt = TTY::Prompt.new

    def self.open_inventory
        Printing.printing("Inventory", 0.0001)
        table = TTY::Table.new [['Item', 'Owner']]
        items = HeroItem.all
        items.map{|i|
        [i.item.name, i.hero.name]
        }.each{|i| table << i}
        puts table.render(:ascii)
     end

    def self.select_item
        items = HeroItem.all
        items = items.map{|i|
        "#{i.item.name} - #{i.hero.name}"
        }
        item = @prompt.select('Pick an item:', items)
        item
    end

    def self.use_item?(item)
        item = item.split(' - ')
        item_owner = Hero.find_by(name: item[1])
        item = Item.find_by(name: item[0]) 
        hero_item = HeroItem.find_by(hero_id: item_owner.id, item_id: item.id)
        puts "Description: #{hero_item.item.description}"
        answer = @prompt.select("Use item?", ['Yes', 'Exit'])
        self.check_use_item_response(answer, hero_item)
    end



    def self.check_use_item_response(res, hero_item)
        if res == "Yes"
            type = hero_item.item.attr_to_change
            if type == "hp"
                if hero_item.hero.hp < 95
                hero_item.hero.hp += 5
                puts "hp recovered #{hero_item.hero.hp}/100"
                elsif hero_item.hero.hp < 100
                    hero_item.hero.hp = 100
                    puts "hp has reached maximum"
                else
                    puts "hp is already max"
                    return
                end
            elsif type == "mp"
                if hero_item.hero.mp < 96
                hero_item.hero.mp += 5
                puts "mp recovered #{hero_item.hero.mp}/100"
                elsif hero_item.hero.mp < 100
                    hero_item.hero.mp = 100
                    puts "mp has reached maximum"
                else
                    puts "mp is already max"
                    return
                end
            else
                puts "You nibbled the key, nothing happened"
                return
            end
            HeroItem.delete(hero_item.id)
        else
            return
        end
    end
end