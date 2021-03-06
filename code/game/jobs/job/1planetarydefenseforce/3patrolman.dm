
/datum/job/patrolman //This will be converted to the basic guardsman.
	title = "Patrolman"
	flag = PATROLMAN
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 500
	spawn_positions = 50
	wage_payout = 45
	supervisors = "Knight Officers, and your lord."
	selection_color = "#f8cb69"
	minimal_player_age = 7
	outfit_datum = /datum/outfit/patrolman
	species_whitelist = list("Human")
	access = list(access_checkpoints) 

	landmark_job_override = TRUE
	relationship_chance = HUMAN_COMMON


/datum/outfit/patrolman
	outfit_name = "patrolman"
	associated_job = /datum/job/patrolman
	no_backpack = TRUE

	items_to_spawn = list(
		"Default" = list(
			slot_ears_str = /obj/item/device/radio/headset,
			slot_w_uniform_str = /obj/item/clothing/under/patrolman_uniform,
			slot_head_str = /obj/item/clothing/head/patrolman_hat,
			slot_shoes_str = /obj/item/clothing/shoes/patrolman_boots,
			slot_wear_suit_str = /obj/item/clothing/suit/armor/patrolman_suit,
			slot_belt_str = /obj/item/weapon/dksword,
			slot_s_store_str = /obj/item/weapon/gun/projectile/stubpistol

		),
	)

	items_to_collect = list(
	)

	implant_types = list(
	)
	
	id_type = /obj/item/weapon/card/id/imperial_guard_dogtag

/datum/outfit/patrolman/handle_faction(var/mob/living/M)
	var/datum/role/planetary_defense_force/new_trooper = new
	new_trooper.AssignToRole(M.mind,TRUE)

/datum/outfit/patrolman/post_equip(var/mob/living/carbon/human/H)
	spawn(2 SECONDS)
		to_chat(H,"<span class='good'>You are a patrolman, you gain points for extermination of orks and patroling. You finish a patrol by shoving your ID into a checkpoint, you can see all the checkpoints at the main console and across the land.</span>")
	