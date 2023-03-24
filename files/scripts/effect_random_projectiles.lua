local projPool = {
    "acidburst",
    "acidshot",
    "acidshot_slow",
    "arrow",
    "bat",
    "bloomshot",
    "bomb",
    "bomb_cart",
    "bomb_holy",
    "cocktail",
    --"bomb_holy_giga",
    "bomb_small",
    "bossdragon",
    "bossdragon_ray",
    "buckshot",
    "bullet_poison",
    "chaos_polymorph",
    "chunk_of_soil",
    "circle_acid_small",
    "circle_blood_small",
    "circle_lava_small",
    --"circle_water",
    "clusterbomb",
    "cocktail",
    "coward_bullet",
    "darkflame",
    "darkflame_stationary",
    "dotshot",
    "dotshot_strong",
    --"egg_fire",
    --"egg_monster",
    --"egg_purple",
    --"egg_red",
    --"egg_slime",
    --"egg_worm",
    "enlightened_laser_dark_wand",
    "enlightened_laser_elec_wand",
    "enlightened_laser_fire_wand",
    "enlightened_laser_light_wand",
    "explosion",
    "fire_trap",
    "fireball",
    "fireball_bigfirebug",
    "fireball_firebug", 
    "fireball_ghostly",
    "flamethrower",
    "freeze_circle",
    "fungus",
    "fungus_big_explosion",
    "fungus_explosion",
    "gasblob",
    "glitter_bomb",
    "glue",
    "glue_shot",
    "grenade_leader",
    "grenade_scavenger",
    "healshot",
    "healshot_safe_haven",
    "healshot_slow",
    "hiddenshot",
    "ice",
    "iceball",
    "icethrower",
    "invisshot",
    "laser_bouncy",
    "laser_lasergun",
    "laser_spear",
    "laser_turret",
    "laserbeam",
    "laserbeam_green",
    "lavashot",
    --"meteor_green",
    "lightning",
    "lurkershot",
    "machinegun_bullet_roboguard_big",
    "machinegun_bullet_slow",
    "machinegun_bullet_slower",
    "machinegun_bullet_tank",
    "machinegun_bullet_tank_super",
    "megalaser_blue",
    "megalaser_blue_beam",
    "meteor_green",
    "mine",
    "mine_scavenger",
    "neutralizershot",
    "orb",
    "orb_blue",
    "orb_cursed",
    "orb_dark",
    "orb_expanding",
    "orb_green",
    "orb_green_accelerating",
    "orb_green_boss_dragon",
    "orb_green_spin",
    "orb_hearty",
    "orb_homing",
    "orb_neutral",
    "orb_pink",
    "orb_pink_big",
    "orb_pink_big_slow",
    "orb_pink_big_super",
    "orb_pink_big_super_shrapnel",
    "orb_pink_fast",
    "orb_pink_super",
    --"orb_poly",
    "orb_purple",
    "orb_swapper",
    "orb_tele",
    "orb_tiny",
    "orb_twitchy",
    "orb_weaken",
    "orb_wither",
    "orb_weaken",
    "orb_wither",
    "orbspawner",
    "orbspawner_blue",
    "orbspawner_green",
    "pebble",
    "pollen",
    "pollen_ball",
    --"polyorb",
    "present",
    "propane_tank",
    "radioactive_blob",
    "radioactive_blob_trail",
    "radioactive_liquid",
    --"rain_gold",
    --"remove_ground",
    "rocket_tank",
    "rocket_tiny",
    "rocket_tiny_roll",
    "sentryshot",
    "shieldshot",
    "shieldshot_small",
    "slimeblob",
    "slimetrail",
    "smalltentacle",
    "smalltentacle_melee",
    "sniperbullet",
    "soldiershot",
    "spit_trap",
    "summonshine",
    "tentacle",
    "thunder_trap",
    "thunderball",
    "thunderball_line",
    "thunderball_slow",
    "tnt",
    "wraith_glowing_laser",
    "deck/all_blackholes",
    "deck/all_deathcrosses",
    "deck/all_discs",
    --"deck/all_nukes",
    "deck/all_rockets",
    "deck/berserk_field",
    "deck/big_magic_shield_start",
    "deck/black_hole",
    "deck/black_hole_big",
    --"deck/black_hole_giga", hahaha... no.
    "deck/bloodtentacle",
    "deck/bomb_detonator",
    "deck/bouncy_orb",
    "deck/bubbleshot",
    "deck/bullet",
    "deck/bullet_heavy",
    "deck/bullet_slow",
    "deck/chain_bolt",
    "deck/chainsaw",
    "deck/chaos_polymorph_field",
    --"deck/charm_field",
    "deck/cloud_acid",
    "deck/cloud_blood",
    "deck/cloud_water",
    "deck/crumbling_earth",
    "deck/disc_bullet",
    "deck/disc_bullet_big",
    "deck/disc_bullet_bigger",
    "deck/grenade",
    "deck/grenade_tier_2",
    "deck/grenade_tier_3",
    "deck/infestation",
    "deck/luminous_drill",
    "deck/sausage",
    --"deck/sea_acid",
    --"deck/sea_alcohol",
    "deck/sea_water",
    --"deck/sea_lava",
    "deck/spitter",
    "deck/spitter_tier_2",
    "deck/spitter_tier_3",
    "deck/swarm_wasp",
    "deck/swarm_firebug",
    "deck/touch_gold",
    "deck/worm_shot",
    "deck/megalaser",
    "deck/light_bullet",
    "deck/spiral_shot",
    "deck/spore_pod",
    "deck/water",
    "deck/xray",
    "deck/wall_horizontal",
    "deck/wall_square",
    "deck/wall_vertical",
    "deck/material_cement",
    "deck/material_blood",
}



local targets = EntityGetWithTag("enemy")
for k=1,#targets
do  v = targets[k]
    if EntityHasTag(v, "ti_randomized") == false then
        local pos_x, pos_y = EntityGetTransform(v)
        SetRandomSeed(pos_x + pos_y, pos_x * pos_y)

        local projFile = projPool[Random(1,#projPool)]

        --Highly impactful, rarer projectiles to roll into
        if Random(1,400) == 1 then
            if Random(1,2) == 1 then
                projFile = "rain_gold"
            else
                projFile = "remove_ground"
            end
        end

        local comp = EntityGetFirstComponentIncludingDisabled(v,"AnimalAIComponent")
        if comp then
            ComponentSetValue2( comp, "attack_ranged_entity_file", "data/entities/projectiles/" .. projFile .. ".xml" )
            if (projFile == "healshot") or (projFile == "healshot_safe_haven") or (projFile == "healshot_slow") or (projFile == "invisshot") or (projFile == "shieldshot") or (projFile == "shieldshot_small") then
                ComponentSetValue2( comp, "tries_to_ranged_attack_friends", true )
                ComponentSetValue2( comp, "attack_if_damaged_probability", 0 )
                ComponentSetValue2( comp, "escape_if_damaged_probability", 100 )
                ComponentSetValue2( comp, "attack_ranged_enabled", true )
                --GamePrint("My status on shooting friends is true and my projectile is " .. projFile)
            else 
                ComponentSetValue2( comp, "tries_to_ranged_attack_friends", false )
                ComponentSetValue2( comp, "attack_ranged_enabled", true )
                --GamePrint("My status on shooting friends is false and my projectile is " .. projFile)
            end
        end

        local attackComp = EntityGetComponentIncludingDisabled( enemy, "AIAttackComponent" )
        if attackComp then
            for z=1,#attackComp
            do c = attackComp[z] 
                SetRandomSeed(z + pos_x, z * pos_y) --Randomised additionally here so each individual AiAttackComponent has a different attack, for example, Steve will have two different projectiles for his two different attacks
                local projFile = projPool[Random(1,#projPool)]

                ComponentSetValue2( comp, "attack_ranged_entity_file", "data/entities/projectiles/" .. projFile .. ".xml" )
            end
        end

        EntityAddTag(v,"ti_randomized")
    end
end