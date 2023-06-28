import numpy as np

class simulator:
    def __init__(self, weapon_combo, career, charm):
        self.weapon_combo = weapon_combo
        self.career = career
        self.charm = charm
    
    def calculate_crit_chance(weapon_combo, career, items):
        len(weapon_combo.)
        pass
    
    def calculate_avg_combo_time(weapon_combo, career, items):
        len(weapon_combo.attacks)
        t = weapon_combo.total_time
        return t / len(weapon_combo)
    
    def calculate_power_scaling(breed, weapon, career, charm):
        weapon.base_damage = weapon.base_damage * career.bonus_power
        for i in  breed.armor_types:
            for j in charm.power_versus:
                if i == j:
                    weapon.base_damage = 1.1*weapon.base_damage      
    
    def calculate_expected_dps(breed,crit_chance, headshot_rate):
        base_damage = calculate_power_scaling(self.weapon, self.career, self.trinket)
        t = calculate_avg_combo_time(self.weapon_combo, self.career, self.items)
        #crit_chance = calculate_crit_chance(weapon,career,items,combo)
        
        # TODO Iterate through armor mods and pick the correct ones
        if breed_armor_mod == 
        armor_mod = self.weapon.armor_modifier
        crit_armor_mod = self.weapon.armor_modifier_crit
        finesse = self.weapon.finesse        
        if career.level_15_talent == 'smiter':
            return 1.2* ( (1-crit_chance) * (1-headshot_rate) * armor_mod * base_damage / t +
                  (1-crit_chance) * headshot_rate * armor_mod * (finesse*base_damage+base_damage) / t +
                  crit_chance * (1-headshot_rate) * crit_armor_mod * (finesse*base_damage+base_damage) / t +
                  crit_chance * headshot_rate * crit_armor_mod * ((2*finesse*base_damage)+base_damage) / t)
        elif career.level_15_talent == 'assassin':
               return (   (1-crit_chance) * (1-headshot_rate) * armor_mod * base_damage / t +
                   crit_chance * (1-headshot_rate) * crit_armor_mod * (finesse*base_damage+base_damage) / t +
               1.4*((1-crit_chance) * headshot_rate * armor_mod * (finesse*base_damage+base_damage) / t +
                   crit_chance * headshot_rate * crit_armor_mod * ((2*finesse*base_damage)+base_damage) / t ) )
        else:
            career.weapon.base_damage = weapon.base_damage*1.075
            return  ( (1-crit_chance) * (1-headshot_rate) * armor_mod * base_damage / t +
                (1-crit_chance) * headshot_rate * armor_mod * (finesse*base_damage+base_damage) / t +
                crit_chance * (1-headshot_rate) * crit_armor_mod * (finesse*base_damage+base_damage) / t +
                crit_chance * headshot_rate * crit_armor_mod * ((2*finesse*base_damage)+base_damage) / t)
        
    def calculate_expected_num_hits(breed,crit_chance, headshot_rate):
        return np.ceil(breed.hp/calculate_expected_dps(crit_chance, headshot_rate))
        
    def calculate_expected_ttk(breed,crit_chance, headshot_rate):
        num_hits = calculate_expected_num_hits(breed, crit chance)
        ttk = calculate_avg_combo_time * num_hits
        return ttk
        
class breed:
    def __init__(self, hp, armor_type):
        self.hp = hp
        self.armor_type = armor_type

class attack:
    def __init__(self,base_damage,finesse,armor_mods,crit_armor_mods,crit_chance,anim_time):
        self.base_damage = base_damage
        self.finesse = finesse
        self.armor_mod_inf = armor_mods[0]
        self.armor_mod_armor = armor_mods[1]
        self.armor_mod_monster = armor_mods[2]
        self.armor_mod_zerk = armor_mods[3]
        self.armor_mod_super = armor_mods[4]
        self.crit_armor_mod_inf = crit_armor_mods[0]
        self.crit_armor_mod_armor = crit_armor_mods[1]
        self.crit_armor_mod_monster = crit_armor_mods[2]
        self.crit_armor_mod_zerk = crit_armor_mods[3]
        self.crit_armor_mod_super = crit_armor_mods[4]
        self.anim_time = anim_time
        
class weapon_combo:
    def __init__(self,attacks):
        self.attacks = attacks
        
    def total_time:
        for t in self.attacks:
            total_time = total_time+t.anim_time
        return total_time
    
    def total_damage:
        for d in self.attacks:
            total_dmg = total_dmg+d.base_damage
        return total_time

class career: 
    def __init__(self,level_15_talent, bonus_attack_speed, bonus_crit_chance, bonus_power, bonus_finesse):
        self.level_15_talent = level_15_talent
        self.bonus_attack_speed = bonus_attack_speed
        self.bonus_crit_chance = bonus_crit_chance
        self.bonus_power = bonus_power
        self.bonus_finesse = bonus_finesse
        
class charm:
    def __init__(self,bonus_attack_speed, power_versus)
        self.bonus_attack_speed = bonus_attack_speed
        self.power_versus = power_versus