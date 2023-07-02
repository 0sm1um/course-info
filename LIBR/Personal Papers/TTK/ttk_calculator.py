import numpy as np
from itertools import permutations, product

class simulator:
    def __init__(self, weapon_combo, career=None, charm=None):
        self.weapon_combo = weapon_combo
        if career != None:
            self.career = career
        if charm != None:
            self.charm = charm

    def calculate_crit_chance(self, weapon_combo, career, items):
        self.bonus_crit_chance
        pass

    def calculate_power_scaling(breed, weapon, career, charm):
        weapon.base_damage = weapon.base_damage * career.bonus_power
        for i in  breed.armor_types:
            for j in charm.power_versus:
                if i == j:
                    weapon.base_damage = 1.1*weapon.base_damage
                    
    def calculate_base_dps(self, armor_mod):
        base_damage = self.weapon_combo.total_damage()
        total_time = self.weapon_combo.total_time
        if  self.career.level_15_talent == 'smiter':
            stagger_modifier = 1.2
        elif  self.career.level_15_talent == 'enhanced power':
            stagger_modifier = 1
            base_damage = base_damage*1.075
        else:
            stagger_modifier = 1
        return stagger_modifier * armor_mod * base_damage / total_time
        
    def calculate_crit_dps(self, armor_mod):
        base_damage = self.weapon_combo.total_crit_damage()
        total_time = self.weapon_combo.total_time
        if  self.career.level_15_talent == 'smiter':
            stagger_modifier = 1.2
        elif  self.career.level_15_talent == 'enhanced power':
            stagger_modifier = 1
            base_damage = base_damage*1.075
        else:
            stagger_modifier = 1
        return stagger_modifier * armor_mod * base_damage / total_time
    
    def calculate_hs_dps(self, armor_mod):
        base_damage = self.weapon_combo.total_hs_damage()
        total_time = self.weapon_combo.total_time
        if  self.career.level_15_talent == 'smiter':
            stagger_modifier = 1.2
        if  self.career.level_15_talent == 'assassin':
            stagger_modifier = 1.4
        elif  self.career.level_15_talent == 'enhanced power':
            stagger_modifier = 1
            base_damage = base_damage*1.075
        else:
            stagger_modifier = 1
        return stagger_modifier * armor_mod * base_damage / total_time

    def calculate_crit_and_hs_dps(self, armor_mod):
        base_damage = self.weapon_combo.total_crit_hs_damage()
        total_time = self.weapon_combo.total_time
        if  self.career.level_15_talent == 'smiter':
            stagger_modifier = 1.2
        if  self.career.level_15_talent == 'assassin':
            stagger_modifier = 1.4
        elif self.career.level_15_talent == 'enhanced power':
            stagger_modifier = 1
            base_damage = base_damage*1.075
        else:
            stagger_modifier = 1
        return stagger_modifier * armor_mod * base_damage / total_time
    
    def calculate_expected_dps(self, breed, crit_chance, headshot_rate):
        #base_damage = self.calculate_power_scaling(self.breed, self.weapon, self.career, self.trinket)
        if breed.armor_type == 'infantry':
            idx = 0
        elif breed.armor_type == 'armored':
            idx = 1
        elif breed.armor_type == 'monster':
            idx = 2
        elif breed.armor_type == 'berzerker':
            idx = 3
        else:
            idx = 4
        #crit_chance = calculate_crit_chance(weapon,career,items,combo)

        # TODO Iterate through armor mods and pick the correct ones
        #if breed_armor_mod == :
        armor_mod = self.weapon_combo.attack.armor_modifier[idx]
        crit_armor_mod = self.weapon_combo.attack.armor_modifier_crit[idx]
        return ( (1-crit_chance) * (1-headshot_rate) * self.calculate_base_dps(armor_mod) +
                 (1-crit_chance) * headshot_rate * self.calculate_hs_dps(armor_mod) +
                 crit_chance * (1-headshot_rate) * self.calculate_crit_dps(crit_armor_mod) +
                 crit_chance * headshot_rate * self.calculate_crit_and_hs_dps(crit_armor_mod) )
    
    def calculate_breakpoints(self, breed, damage_values):
        base_num_hits = np.ceil( (breed.hp) / (damage_values[0]) )
        hs_num_hits = np.ceil( (breed.hp) / (damage_values[1]) )
        crit_num_hits = np.ceil( (breed.hp) / (damage_values[2]) )
        crit_hs_num_hits = np.ceil( (breed.hp) / (damage_values[3]) )
        return base_num_hits, hs_num_hits, crit_num_hits, crit_hs_num_hits
    
    def calculate_expected_num_hits_dps(self, breed,crit_chance, headshot_rate):
        n = breed.hp/self.calculate_expected_dps(breed, crit_chance, headshot_rate)
        print(self.calculate_expected_dps(breed, crit_chance, headshot_rate))
        print(n)
        if n >= 1:
            return breed.hp/self.calculate_expected_dps(breed, crit_chance, headshot_rate)
        else:
            return 1
    
    def compute_damage_values(self, breed):
        if breed.armor_type == 'infantry':
            idx = 0
        elif breed.armor_type == 'armored':
            idx = 1
        elif breed.armor_type == 'monster':
            idx = 2
        elif breed.armor_type == 'berzerker':
            idx = 3
        else:
            idx = 4
        armor_mod = self.weapon_combo.attack.armor_modifier[idx]
        crit_armor_mod = self.weapon_combo.attack.armor_modifier_crit[idx]
        if  self.career.level_15_talent == 'smiter':
            stagger_modifier = 1.2
            return (np.round(4 * stagger_modifier * armor_mod * self.weapon_combo.attack.base_damage) / 4, 
                    np.round(4 * stagger_modifier * armor_mod * self.weapon_combo.attack.base_hs_damage) / 4,
                    np.round(4 * stagger_modifier * crit_armor_mod * self.weapon_combo.attack.base_crit_damage) / 4,
                    np.round(4 * stagger_modifier * crit_armor_mod * self.weapon_combo.attack.base_crit_hs_damage) / 4)
        if self.career.level_15_talent == 'assassin':
            stagger_modifier = 1.4
            return (np.round(4 * armor_mod * self.weapon_combo.attack.base_damage) / 4, 
                    np.round(4 * stagger_modifier * armor_mod * self.weapon_combo.attack.base_hs_damage) / 4,
                    np.round(4 * crit_armor_mod * self.weapon_combo.attack.base_crit_damage) / 4,
                    np.round(4 * stagger_modifier * crit_armor_mod * self.weapon_combo.attack.base_crit_hs_damage) / 4)
        elif self.career.level_15_talent == 'enhanced power':
            return NotImplemented
        else:
            return (armor_mod * self.weapon_combo.attack.base_damage, 
                    armor_mod * self.weapon_combo.attack.base_hs_damage,
                    crit_armor_mod * self.weapon_combo.attack.base_crit_damage,
                    crit_armor_mod * self.weapon_combo.attack.base_crit_hs_damage)
        
    
    def enumerate_sequences(self, breed, damage_values, max_hits):
        #perms = set(permutations(damage_values,int(max_hits)))
        
        total_sequences = [p for p in product(damage_values, repeat=int(max_hits))]
        # Filter out bad sequences:
        lethal_sequences = []
        for i in total_sequences:
            current_sequence = []
            for j in i:
                current_sequence.append(j)
                if sum(current_sequence) >= breed.hp:
                    lethal_sequences.append(tuple( current_sequence))
                    break
        return set(lethal_sequences)
    
    def calculate_expected_num_hits(self, breed,crit_chance, headshot_rate):
        damage_values = self.compute_damage_values(breed)
        print('Damage values versus '+ str(breed.armor_type)+':')
        print(damage_values)
        base_hits, hs_hits, crit_hits, crit_hs_hits = self.calculate_breakpoints(breed, damage_values)
        breakpoints = (base_hits, hs_hits, crit_hits, crit_hs_hits)
        print('Breakpoints:')
        print(breakpoints)
        no_crit_no_hs_rate = (1-crit_chance) * (1-headshot_rate)
        no_crit_hs_rate = (1-crit_chance) * headshot_rate
        crit_no_hs_rate = (crit_chance) * (1-headshot_rate)
        crit_hs_rate = crit_chance * headshot_rate
        sequences = self.enumerate_sequences(breed, damage_values, max(breakpoints))
        print('Number of Lethal Sequences:')
        print(len(sequences))
        n = 0
        weighted_sequences = {}
        for i in sequences:
            w = 1
            for j in i:
                if j == damage_values[0]:
                    w = w * no_crit_no_hs_rate
                elif j == damage_values[1]:
                    w = w * no_crit_hs_rate
                elif j == damage_values[2]:
                    w = w * crit_no_hs_rate
                else:
                    w = w * crit_hs_rate
            n = w * len(i) + n
        print('Expected Number of Hits:')
        print(n)
        return n

    def calculate_expected_ttk(self, breed, crit_chance, headshot_rate):
        expected_num_hits = self.calculate_expected_num_hits(breed, crit_chance, headshot_rate)
        ttk = self.weapon_combo.avg_time_per_swing() * expected_num_hits
        print('Expected TTK:')
        print(ttk)
        return ttk

class Breed:
    def __init__(self, hp, armor_type):
        self.hp = hp
        self.armor_type = armor_type

class attack:
    def __init__(self,base_damage,finesse, curve, armor_modifier,armor_modifier_crit):
        self.base_damage = base_damage
        self.finesse = finesse
        if curve == 'smiter' or curve == 'tank':
            self.curve = 0.5
        elif curve == 'linesman':
            self.curve = 0.4
        elif curve == 'ninja':
            self.curve = 0.7
        else:
            self.curve = self.curve
        self.base_hs_damage = (1 + finesse * self.curve) * self.base_damage
        self.base_crit_damage = (1 + finesse * self.curve) * self.base_damage
        self.base_crit_hs_damage = (1 + finesse) * self.base_damage
        self.armor_modifier = armor_modifier
        self.armor_modifier_crit = armor_modifier_crit
        
class weapon_combo:
    def __init__(self, attack, total_time):
        return NotImplemented

    def total_time(self, total_time):
        return NotImplemented

    def total_damage(self, total_dmg):
        return NotImplemented

class single_attack_combo(weapon_combo):
    def __init__(self, attack, num_hits, total_time):
        self.attack = attack
        self.curve = attack.curve
        self.num_hits = num_hits
        self.total_time = total_time

    def total_damage(self):
        return self.attack.base_damage * self.num_hits

    def total_hs_damage(self):
        return self.attack.base_hs_damage * self.num_hits

    def total_crit_damage(self):
        return self.attack.base_crit_damage * self.num_hits

    def total_crit_hs_damage(self):
        return self.attack.base_crit_hs_damage * self.num_hits

    def avg_time_per_swing(self):
        return self.total_time / self.num_hits

class Career:
    def __init__(self,level_15_talent, bonus_attack_speed=None, bonus_crit_chance=None, bonus_power=None, bonus_finesse=None):
        self.level_15_talent = level_15_talent
        self.bonus_attack_speed = bonus_attack_speed
        self.bonus_crit_chance = bonus_crit_chance
        self.bonus_power = bonus_power
        self.bonus_finesse = bonus_finesse

class charm:
    def __init__(self,bonus_attack_speed, power_versus):
        self.bonus_attack_speed = bonus_attack_speed
        self.power_versus = power_versus

stormvermin = Breed(118.5, 'armored')
#tbtt_axe_1h_light = attack(20.86, 1, 'smiter', [1.33, 0.6, 1, 1, 0.6], [1.33, 1.25, 1.25, 1, 1])
#tbtt_axe_1h_chain_light_combo = single_attack_combo(tbtt_axe_1h_light, 3, 1.59)

axe_1h_light = attack(14.92, 1, 'smiter', [1.25, 0.65, 2.5, 0.75, 0.6], [1.25, 0.75, 2.75, 1, 0.75])
axe_1h_chain_light_combo = single_attack_combo(axe_1h_light, 3, 1.7391)

generic_smiter = Career('smiter')
generic_assassin = Career('assassin')
smiter_simulator = simulator(axe_1h_chain_light_combo, generic_smiter)
#assassin_simulator = simulator(axe_1h_chain_light_combo, generic_assassin)
#smiter_simulator = simulator(tbtt_axe_1h_chain_light_combo, generic_smiter)
#assassin_simulator = simulator(tbtt_axe_1h_chain_light_combo, generic_assassin)

#smiter_simulator = simulator(tbtt_axe_1h_chain_light_combo, generic_smiter)
#assassin_simulator = simulator(tbtt_axe_1h_chain_light_combo, generic_assassin)

sv_smiter_ttk = smiter_simulator.calculate_expected_ttk(stormvermin, 0.25, 0.45)
#sv_assassin_ttk = assassin_simulator.calculate_expected_ttk(stormvermin, 0.25, 0.45)