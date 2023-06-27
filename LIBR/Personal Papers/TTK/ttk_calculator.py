import numpy as np

class simulator:
    def __init__(self, weapon, career, items, combo):
        self.weapon = weapon
        self.career = career
        self.items = items
        self.combo = combo
    
    def calculate_crit_chance(weapon, career, items, combo):
        len(attacks)
        pass
    
    def calculate_avg_combo_time(weapon, career, items):
        len(attacks)
        calculate_attack_speed()
        pass
    
    def calculate_power_scaling(weapon, career, items, combo):
        pass
    
    def calculate_expected_dps(crit_chance, headshot_rate):
        base_damage = calculate_power_scaling(self.weapon, self.career, self.items)
        t = calculate_avg_combo_time(self.weapon, self.career, self.items, self.combo)
        #crit_chance = calculate_crit_chance(weapon,career,items,combo)
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
        
    def calculate_expected_num_hits(breed):
        return np.ceil(breed.hp/calculate_expected_dps())
        
    def calculate_expected_ttk():
        