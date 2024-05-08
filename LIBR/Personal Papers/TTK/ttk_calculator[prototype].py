import numpy as np
import sys
from itertools import product

class Career:
    def __init__(self,level_15_talent = None, attack_speed_buffs=0, power_buffs=0, crit_buffs=0, bonus_finesse=0):
        self.level_15_talent = level_15_talent
        self.attack_speed_buffs = attack_speed_buffs
        self.power_buffs = power_buffs
        self.crit_buffs = crit_buffs
        self.bonus_finesse = bonus_finesse

class Charm:
    def __init__(self, attack_speed_buffs = 0, power_versus = [0,0]):
        self.attack_speed_buffs = attack_speed_buffs
        self.power_versus = power_versus

class ttk_calculator:
    def __init__(self, weapon_combo, career=Career(), charm=Charm()):
        self.weapon_combo = weapon_combo
        self.career = career
        self.charm = charm

    def calculate_crit_chance(self, weapon_combo, career, items):
        self.bonus_crit_chance
        pass

    def calculate_power_scaling(self, breed):
        power_scale = 1
        if self.charm != None:
            if breed.armor_type == self.charm.power_versus[0] or breed.armor_type == self.charm.power_versus[1]:
                power_scale = power_scale + 0.1
            elif breed.armor_type == self.charm.power_versus[1] or breed.armor_type == self.charm.power_versus[0]:
                power_scale = power_scale + 0.1
            if breed.faction == self.charm.power_versus[0] or breed.faction == self.charm.power_versus[1]:
                power_scale = power_scale + 0.1
            elif breed.faction == self.charm.power_versus[1] or breed.faction == self.charm.power_versus[0]:
                power_scale = power_scale + 0.1
        if self.career.level_15_talent == 'enhanced power':
            power_scale = power_scale + 0.075
        power_scale = self.career.power_buffs + power_scale
        return power_scale

    def apply_attack_speed_buffs(self, time):
        total_attack_speed = self.weapon_combo.attack.attack_speed_buffs + \
            self.career.attack_speed_buffs + self.charm.attack_speed_buffs
        return (1 / (total_attack_speed + 1) * time)
    
    def calculate_breakpoints(self, breed, damage_values):
        base_num_hits = np.ceil( (breed.hp) / (damage_values[0]) )
        hs_num_hits = np.ceil( (breed.hp) / (damage_values[1]) )
        crit_num_hits = np.ceil( (breed.hp) / (damage_values[2]) )
        crit_hs_num_hits = np.ceil( (breed.hp) / (damage_values[3]) )
        return base_num_hits, hs_num_hits, crit_num_hits, crit_hs_num_hits

    def compute_damage_values(self, breed):
        if breed.armor_type == 'infantry':
            body_idx = 0
            head_idx = 0
        elif breed.armor_type == 'armored':
            body_idx = 1
            head_idx = 1
        elif breed.armor_type == 'monster':
            body_idx = 2
            head_idx = 2
        elif breed.armor_type == 'berzerker':
            body_idx = 3
            head_idx = 3
        elif breed.armor_type == 'mauler':
            body_idx = 1
            head_idx = 4
        else:
            body_idx = 4
            head_idx = 4
        body_armor_mod = self.weapon_combo.attack.armor_modifier[body_idx]
        body_crit_armor_mod = self.weapon_combo.attack.armor_modifier_crit[body_idx]
        head_armor_mod = self.weapon_combo.attack.armor_modifier[head_idx]
        head_crit_armor_mod = self.weapon_combo.attack.armor_modifier_crit[head_idx]
        
        power_scale_factor = self.calculate_power_scaling(breed)
        if  self.career.level_15_talent == 'smiter':
            stagger_modifier = 1.2
            return (np.round(4 * stagger_modifier * power_scale_factor * body_armor_mod * self.weapon_combo.attack.base_damage) / 4, 
                    np.round(4 * stagger_modifier * power_scale_factor * head_armor_mod * self.weapon_combo.attack.base_hs_damage) / 4,
                    np.round(4 * stagger_modifier * power_scale_factor * body_crit_armor_mod * self.weapon_combo.attack.base_crit_damage) / 4,
                    np.round(4 * stagger_modifier * power_scale_factor * head_crit_armor_mod * self.weapon_combo.attack.base_crit_hs_damage) / 4)
        if self.career.level_15_talent == 'assassin':
            stagger_modifier = 1.4
            return (np.round(4 * power_scale_factor * body_armor_mod * self.weapon_combo.attack.base_damage) / 4, 
                    np.round(4 * power_scale_factor * stagger_modifier * head_armor_mod * self.weapon_combo.attack.base_hs_damage) / 4,
                    np.round(4 * power_scale_factor * body_crit_armor_mod * self.weapon_combo.attack.base_crit_damage) / 4,
                    np.round(4 * power_scale_factor * stagger_modifier * head_crit_armor_mod * self.weapon_combo.attack.base_crit_hs_damage) / 4)
        else:
            return (np.round(4 * power_scale_factor * body_armor_mod * self.weapon_combo.attack.base_damage) / 4, 
                    np.round(4 * power_scale_factor * head_armor_mod * self.weapon_combo.attack.base_hs_damage) / 4,
                    np.round(4 * power_scale_factor * body_crit_armor_mod * self.weapon_combo.attack.base_crit_damage) / 4,
                    np.round(4 * power_scale_factor * head_crit_armor_mod * self.weapon_combo.attack.base_crit_hs_damage) / 4)

    def enumerate_sequences(self, breed, damage_values, max_hits):
        # This is to prevent the sequence generator from eliminating "duplicate" sequences which should be kept.
        if damage_values[1] == damage_values[2]:
            tiny = 0.00005
            damage_values = (damage_values[0], damage_values[1]-tiny, damage_values[2]+tiny, damage_values[1])
        # Generate ALL sequences
        total_sequences = [p for p in product(damage_values, repeat=int(max_hits))]
        # Filter out bad sequences:
        lethal_sequences = []
        for i in total_sequences:
            current_sequence = []
            for j in i:
                current_sequence.append(j)
                if sum(current_sequence) >= breed.hp:
                    lethal_sequences.append(tuple(current_sequence))
                    break
        return set(lethal_sequences)
    
    def calculate_expected_num_hits(self, breed, crit_chance, headshot_rate):
        damage_values = self.compute_damage_values(breed)
        base_hits, hs_hits, crit_hits, crit_hs_hits = self.calculate_breakpoints(breed, damage_values)
        breakpoints = (base_hits, hs_hits, crit_hits, crit_hs_hits)
        print(breakpoints)
        no_crit_no_hs_rate = (1-crit_chance) * (1-headshot_rate)
        no_crit_hs_rate = (1-crit_chance) * headshot_rate
        crit_no_hs_rate = crit_chance * (1-headshot_rate)
        crit_hs_rate = crit_chance * headshot_rate
        sequences = self.enumerate_sequences(breed, damage_values, max(breakpoints))
        n = 0
        weights = []
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
            weights.append(w)
            n = w * len(i) + n
        var = 0
        j = 0
        for i in sequences:
            var = weights[j] * (len(i) - n)**2 + var
            j = j + 1     
        if n < 1:
            n = 1
        return n, var

    def calculate_expected_ttk(self, breed, crit_chance, headshot_rate):
        expected_num_hits, var = self.calculate_expected_num_hits(breed, crit_chance, headshot_rate)
        ttk = self.apply_attack_speed_buffs(self.weapon_combo.avg_time_per_swing()) * expected_num_hits
        var = self.weapon_combo.avg_time_per_swing()**2 * var
        return ttk, var

class Breed:
    def __init__(self, name, hp, armor_type, faction):
        self.name = name
        self.hp = hp
        self.armor_type = armor_type
        self.faction = faction

class attack:
    def __init__(self,base_damage,finesse, curve, armor_modifier,
                 armor_modifier_crit, swift_slaying=0, attack_speed=0):
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
        if (swift_slaying == 'y' or swift_slaying == 'yes' or
            swift_slaying == 'Yes' or swift_slaying == 0.2):
            self.attack_speed_buffs = 0.2
        else:
            self.attack_speed_buffs = 0
        if (attack_speed == 'y' or attack_speed == 'yes' or
            attack_speed == 'Yes' or attack_speed == 0.05):
            self.attack_speed_buffs = self.attack_speed_buffs + 0.05

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

    def avg_time_per_swing(self):
        return self.total_time / self.num_hits

#def analyze_breeds(simulator, weapon_combo, career, breeds)

trash = [Breed('skavenslave', 24, 'infantry', 'skaven'),
            Breed('fanatic', 48, 'infantry', 'chaos'),
            Breed('clan rat', 60, 'infantry', 'skaven'),
            Breed('marauder', 24, 'infantry', 'chaos')]

elites = [Breed('plague monk', 133.25, 'berzerker', 'skaven'),
          Breed('chaos savage', 133.25, 'berzerker', 'chaos'),
          Breed('stormvermin', 118.5, 'armored', 'skaven'),
          Breed('white_sv', 118.5, 'super_armor', 'skaven')]

armor = [Breed('stormvermin', 118.5, 'armored', 'skaven'),
         Breed('white_sv', 118.5, 'super_armor', 'skaven')]

tb_axe_1h_light = attack(14.92, 2, 'smiter', [1.25, 0.65, 2.5, 1.25, 0.6], [1.25, 0.75, 2.75, 1, 0.75],'y')
tb_axe_1h_chain_light_combo = single_attack_combo(tb_axe_1h_light, 3, 1.59)

axe_1h_light = attack(14.92, 1, 'smiter', [1.25, 0.65, 2.5, 0.75, 0.6], [1.25, 0.75, 2.75, 1, 0.75],'y')
axe_1h_chain_light_combo = single_attack_combo(axe_1h_light, 3, 1.7391)

tbtt_axe_1h_light = attack(14.92, 1, 'smiter', [1.33, 0.6, 2.5, 1.4, 0.5], [1.33, 1.1, 2.75, 1.5, 0.75],'y')
tbtt_axe_1h_chain_light_combo = single_attack_combo(tbtt_axe_1h_light, 3, 1.59)

tbtt_axe_1h_heavy = attack(23.875, 1.5, 'smiter', [1, 0.75, 2, 0.9, 0.95], [1, 1.33, 2.5, 1, 3],'y')
tbtt_axe_1h_chain_heavy_combo = single_attack_combo(tbtt_axe_1h_heavy, 3, 2.0628)


zealot_smiter = Career('smiter', attack_speed_buffs=0.2, power_buffs = 0.30)
zealot_assassin = Career('assassin', attack_speed_buffs=0.2, power_buffs = 0.30)

chaos_inf_charm = Charm(0, power_versus=['chaos','infantry'])
chaos_as_charm = Charm(0.05, power_versus=['chaos', 0])

zealot_smiter_calculator_tb = ttk_calculator(tb_axe_1h_chain_light_combo, zealot_smiter,chaos_as_charm)
zealot_assassin_calculator_tb = ttk_calculator(tb_axe_1h_chain_light_combo, zealot_assassin,chaos_as_charm)
zealot_smiter_calculator_tbtt = ttk_calculator(tbtt_axe_1h_chain_light_combo, zealot_smiter,chaos_as_charm)
zealot_assassin_calculator_tbtt = ttk_calculator(tbtt_axe_1h_chain_light_combo, zealot_assassin,chaos_as_charm)
#tb_smiter_calculator = ttk_calculator(tb_axe_1h_chain_light_combo, generic_smiter)
zealot_smiter_calculator_heavies_tbtt = ttk_calculator(tbtt_axe_1h_chain_heavy_combo, zealot_smiter,chaos_as_charm)
zealot_assassin_calculator_heavies_tbtt = ttk_calculator(tbtt_axe_1h_chain_heavy_combo, zealot_assassin,chaos_as_charm)
#zealot_smiter_calculator.calculate_expected_ttk(stormvermin, 0.3, 0.45)
#zealot_assassin_calculator.calculate_expected_ttk(stormvermin, 0.3, 0.45)

def analyze_breeds(breeds, calculator, crit_chance, headshot_rate):
    print('Expected Time to Kill:')
    for breed in breeds:
        ttk, var = calculator.calculate_expected_ttk(breed, crit_chance, headshot_rate)
        print('TTK versus '+breed.name+': '+str(round(ttk,4))+' s     Variance: '+str(round(var,4))+' s^2')
    print('-----------------------------------------------------')

'''
print('TB 1h Axe Smiter Zealot:')
analyze_breeds(trash, zealot_smiter_calculator_tb, 0.3, 0.45)
print('Zealot Assassin Chaos+AS')
analyze_breeds(trash, zealot_assassin_calculator_tb, 0.3, 0.45)
print('TBTT 1h Axe Smiter Zealot:')
analyze_breeds(trash, zealot_smiter_calculator_tbtt, 0.3, 0.45)
print('TBTT 1h Axe Assassin Zealot:')
analyze_breeds(trash, zealot_assassin_calculator_tbtt, 0.3, 0.45)
print('-----------------------------------------------------')
print('-----------------------------------------------------')
print('-----------------------------------------------------')
print('-----------------------------------------------------')
print('TB 1h Axe Smiter Zealot:')
analyze_breeds(elites, zealot_smiter_calculator_tb, 0.3, 0.25)
print('Zealot Assassin Chaos+AS')
analyze_breeds(elites, zealot_assassin_calculator_tb, 0.3, 0.25)
print('TBTT 1h Axe Smiter Zealot:')
analyze_breeds(elites, zealot_smiter_calculator_tbtt, 0.3, 0.25)
print('TBTT 1h Axe Assassin Zealot:')
analyze_breeds(elites, zealot_assassin_calculator_tbtt, 0.3, 0.25)
'''
print('-----------------------------------------------------')
print('-----------------------------------------------------')
print('-----------------------------------------------------')
print('-----------------------------------------------------')
print('TBTT 1h Axe Heavies Smiter Zealot:')
analyze_breeds(elites, zealot_smiter_calculator_heavies_tbtt, 0.3, 0.25)
print('TBTT 1h Axe Heavies Assassin Zealot:')
analyze_breeds(elites, zealot_assassin_calculator_heavies_tbtt, 0.3, 0.25)
'''
print('TB 1h Axe Smiter Zealot:')
analyze_breeds(armor, zealot_smiter_calculator_tb, 0.3, 0.45)
print('Zealot Assassin Chaos+AS')
analyze_breeds(armor, zealot_assassin_calculator_tb, 0.3, 0.45)
print('TBTT 1h Axe Smiter Zealot:')
analyze_breeds(armor, zealot_smiter_calculator_tbtt, 0.3, 0.45)
print('TBTT 1h Axe Assassin Zealot:')
analyze_breeds(armor, zealot_assassin_calculator_tbtt, 0.3, 0.45)
'''