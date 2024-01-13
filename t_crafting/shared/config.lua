Config = {}

Config.Locale = 'en' --mahtaa vituttaa ku  ei näy dumpeissa.

Config.CraftingTableRecipes = {
    --[[
        kasausohje1 = raskas
        kasausohje2 = kevyt
        kasausohje3 = pistooli
    ]]
    ['WEAPON_ASSAULTRIFLE'] ={
        ingredients = {
            blueprint = 'kasausohje1',
            parts = 68
        },
        ammo = math.random(1,30)
    },
    ['WEAPON_BULLPUPSHOTGUN'] ={
        ingredients = {
            blueprint = 'kasausohje1',
            parts = 62
        },
        ammo = math.random(1,12)
    },
    ['WEAPON_COMBATPDW'] ={
        ingredients = {
            blueprint = 'kasausohje2',
            parts = 55
        },
        ammo = math.random(1,30)
    },
    ['WEAPON_GUSENBERG'] = {
        ingredients = {
            blueprint = 'kasausohje2',
            parts = 48
        },
        ammo = math.random(1,30)
    },
    ['WEAPON_SAWNOFFSHOTGUN'] ={
        ingredients = {
            blueprint = 'kasausohje2',
            parts = 32
        },
        ammo = math.random(1,8)
    },
    ['WEAPON_SMG'] ={
        ingredients = {
            blueprint = 'kasausohje2',
            parts = 45
        },
        ammo = math.random(1,30)
    },
    ['WEAPON_REVOLVER'] ={
        ingredients = {
            blueprint = 'kasausohje3',
            parts = 51
        },
        ammo = math.random(1,6)
    },
    ['WEAPON_PISTOL50'] ={
        ingredients = {
            blueprint = 'kasausohje3',
            parts = 38
        },
        ammo = math.random(1,9)
    },
    ['WEAPON_PISTOL_MK2'] ={
        ingredients = {
            blueprint = 'kasausohje3',
            parts = 25
        },
        ammo = math.random(1,12)
    },
}