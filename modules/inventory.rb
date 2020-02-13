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
        puts "============================================"
        puts "  Description: #{hero_item.item.description}".green
        puts "============================================"
        answer = @prompt.select("Use item?", ['Yes', 'Exit'])
        self.check_use_item_response(answer, hero_item)
    end



    def self.check_use_item_response(res, hero_item)
        if res == "Yes"
            type = hero_item.item.attr_to_change
            if type == "hp"
                if hero_item.hero.hp < 95
                hero_item.hero.hp += 5
                puts "====================================="
                puts "hp recovered #{hero_item.hero.hp}/100".green
                puts "====================================="
                elsif hero_item.hero.hp < 100
                    hero_item.hero.hp = 100
                    puts "======================"
                    puts "hp has reached maximum".red
                    puts "======================"
                else
                    puts "================="
                    puts "hp is already max".red
                    puts "================="
                    return
                end
            elsif type == "mp"
                if hero_item.hero.mp < 96
                hero_item.hero.mp += 5
                puts "====================================="
                puts "mp recovered #{hero_item.hero.mp}/100".green
                puts "====================================="
                elsif hero_item.hero.mp < 100
                    hero_item.hero.mp = 100
                    puts "======================"
                    puts "mp has reached maximum".red
                    puts "======================"
                else
                    puts "================="
                    puts "mp is already max".red
                    puts "================="
                    return
                end
            else
                puts "======================================"
                puts "You nibbled the key, nothing happened.".green
                puts "======================================"
                return
            end
            HeroItem.delete(hero_item.id)
        else
            return
        end
    end
end