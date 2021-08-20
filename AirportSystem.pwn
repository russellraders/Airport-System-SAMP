/*---------------------------------| DON'T REMOVE THIS CREDIT |---------------------------------------*-

										  AIRPORT SYSTEM

										Author & Developer:
										  Russell Raders
									  Discord: Russell#0266
							  Github: https://github.com/russellraders

-*---------------------------------| DON'T REMOVE THIS CREDIT |---------------------------------------*/

#include <a_samp>
#include <streamer>

#define COLOR_YELLOW 	0xFFFF00AA
#define COLOR_GREEN 	0x33AA33AA
#define COLOR_ORANGE	0xFFA500AA
#define COLOR_RED       0xFF0000FF

#define PRICE 			50000 			// Harga tiket
#define TIME_LS_TO_LV	1000 			// Waktu yang dibutuhkan (1000 = 1 detik)
#define TIME_LS_TO_SF	1000 			// Waktu yang dibutuhkan (1000 = 1 detik)
#define TIME_LV_TO_LS	1000 			// Waktu yang dibutuhkan (1000 = 1 detik)
#define TIME_LV_TO_SF	1000 			// Waktu yang dibutuhkan (1000 = 1 detik)
#define TIME_SF_TO_LS	1000 			// Waktu yang dibutuhkan (1000 = 1 detik)
#define TIME_SF_TO_LV	1000 			// Waktu yang dibutuhkan (1000 = 1 detik)


new BANDARA_LS;
new BANDARA_LV;
new BANDARA_SF;

enum
{
	DIALOG_LS_AIRPORT,
	DIALOG_LV_AIRPORT,
	DIALOG_SF_AIRPORT
}

public OnFilterScriptInit()
{
	printf("==========================================================");
	printf("				AIRPORT SYSTEM BY RUSSELL				  ");
	printf("==========================================================");
	return 1;
}


public OnGameModeInit()
{
	BANDARA_LS = CreatePickup(19134, 23, 1685.6761, -2335.1085, 14.111, 0);
    CreateDynamic3DTextLabel("Los Santos\nInternational Airport", COLOR_ORANGE, 1685.6761, -2335.1085, 15.111, 10.0);
    BANDARA_LV = CreatePickup(19134, 23, 1673.5688, 1447.6936, 12.111, 0);
    CreateDynamic3DTextLabel("Las Vegas\nInternational Airport", COLOR_ORANGE, 1673.5688, 1447.6936, 14.111, 10.0);
    BANDARA_SF = CreatePickup(19134, 23, -1421.6000, -287.4800, 15.111, 0);
    CreateDynamic3DTextLabel("San Fiero\nInternational Airport", COLOR_ORANGE, -1421.6000, -287.4800, 17.111, 10.0);
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraLookAt(playerid, 1958.3783, 1343.1572, 15.3746);
	return 1;
}

public OnPlayerConnect(playerid)
{
	SendClientMessage(playerid, COLOR_RED, "Free Airport System By Russell#0226");
	SendClientMessage(playerid, COLOR_RED, "Fitur ini tersedia secara Gratis di https://github.com/russellraders");
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	if(pickupid == BANDARA_LS)
    {
    	ShowPlayerDialog(playerid, DIALOG_LS_AIRPORT, DIALOG_STYLE_LIST, "Los Santos International Airport", "Las Vegas International Airport\nSan Fiero International Airport", "Pilih", "Batal");
    }
    if(pickupid == BANDARA_LV)
    {
    	ShowPlayerDialog(playerid, DIALOG_LV_AIRPORT, DIALOG_STYLE_LIST, "Las Vegas International Airport", "Los Santos International Airport\nSan Fiero International Airport", "Pilih", "Batal");
    }
    if(pickupid == BANDARA_SF)
    {
    	ShowPlayerDialog(playerid, DIALOG_SF_AIRPORT, DIALOG_STYLE_LIST, "San Fiero International Airport", "Los Santos International Airport\nLas Vegas International Airport", "Pilih", "Batal");
    }
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	switch(dialogid)
	{
		case DIALOG_LS_AIRPORT:
		{
			if(!response) return 1;
			switch(listitem)
			{
				case 0:
				{
					if(GetPlayerMoney(playerid) >= PRICE)
		    		{
		    			GivePlayerMoney(playerid, -PRICE);
						SetPlayerInterior(playerid, 1);
						SetPlayerPos(playerid, 2.384830, 33.103397, 1199.849976);
						SendClientMessage(playerid, COLOR_YELLOW, "Kamu sedang dalam perjalanan menuju ke Las Vegas");
						SetTimerEx("LvAirport", (random(5) + 10) * TIME_LS_TO_LV, false, "i", playerid);
					}
					else
					{
						SetPlayerPos(playerid, 1683.7638,-2328.4575,13.5469);
						SendClientMessage(playerid, COLOR_YELLOW, "Kamu tidak mempunyai cukup uang untuk membeli tiket pesawat");
					}
				}
				case 1:
				{
					if(GetPlayerMoney(playerid) >= PRICE)
		    		{
		    			GivePlayerMoney(playerid, -PRICE);
						SetPlayerInterior(playerid, 1);
						SetPlayerPos(playerid, 2.384830, 33.103397, 1199.849976);
						SendClientMessage(playerid, COLOR_YELLOW, "Kamu sedang dalam perjalanan menuju ke San Fiero");
						SetTimerEx("SfAirport", (random(5) + 10) * TIME_LS_TO_SF, false, "i", playerid);
					}
					else
					{
						SetPlayerPos(playerid, 1683.7638,-2328.4575,13.5469);
						SendClientMessage(playerid, COLOR_YELLOW, "Kamu tidak mempunyai cukup uang untuk membeli tiket pesawat");
					}
				}
			}
		}
		case DIALOG_LV_AIRPORT:
		{
			if(!response) return 1;
			switch(listitem)
			{
				case 0:
				{
					if(GetPlayerMoney(playerid) >= PRICE)
		    		{
		    			GivePlayerMoney(playerid, -PRICE);
						SetPlayerInterior(playerid, 1);
						SetPlayerPos(playerid, 2.384830, 33.103397, 1199.849976);
						SendClientMessage(playerid, COLOR_YELLOW, "Kamu sedang dalam perjalanan menuju ke Los Santos");
						SetTimerEx("LsAirport", (random(5) + 10) * TIME_LV_TO_LS, false, "i", playerid);
					}
					else
					{
						SetPlayerPos(playerid, 1678.3916,1447.6757,10.7751);
						SendClientMessage(playerid, COLOR_YELLOW, "Kamu tidak mempunyai cukup uang untuk membeli tiket pesawat");
					}
				}
				case 1:
				{
					if(GetPlayerMoney(playerid) >= 50000)
		    		{
		    			GivePlayerMoney(playerid, -50000);
						SetPlayerInterior(playerid, 1);
						SetPlayerPos(playerid, 2.384830, 33.103397, 1199.849976);
						SendClientMessage(playerid, COLOR_YELLOW, "Kamu sedang dalam perjalanan menuju ke San Fiero");
						SetTimerEx("SfAirport", (random(5) + 10) * TIME_LV_TO_SF, false, "i", playerid);
					}
					else
					{
						SetPlayerPos(playerid, 1678.3916,1447.6757,10.7751);
						SendClientMessage(playerid, COLOR_YELLOW, "Kamu tidak mempunyai cukup uang untuk membeli tiket pesawat");
					}
				}
			}
		}
		case DIALOG_SF_AIRPORT:
		{
			if(!response) return 1;
			switch(listitem)
			{
				case 0:
				{
					if(GetPlayerMoney(playerid) >= PRICE)
		    		{
		    			GivePlayerMoney(playerid, -PRICE);
						SetPlayerInterior(playerid, 1);
						SetPlayerPos(playerid, 2.384830, 33.103397, 1199.849976);
						SendClientMessage(playerid, COLOR_YELLOW, "Kamu sedang dalam perjalanan menuju ke Los Santos");
						SetTimerEx("LsAirport", (random(5) + 10) * TIME_SF_TO_LS, false, "i", playerid);
					}
					else
					{
						SetPlayerPos(playerid, -1423.7013,-289.3624,14.1484);
						SendClientMessage(playerid, COLOR_YELLOW, "Kamu tidak mempunyai cukup uang untuk membeli tiket pesawat");
					}
				}
				case 1:
				{
					if(GetPlayerMoney(playerid) >= PRICE)
		    		{
		    			GivePlayerMoney(playerid, -PRICE);
						SetPlayerInterior(playerid, 1);
						SetPlayerPos(playerid, 2.384830, 33.103397, 1199.849976);
						SendClientMessage(playerid, COLOR_YELLOW, "Kamu sedang dalam perjalanan menuju ke Las Vegas");
						SetTimerEx("LvAirport", (random(5) + 10) * TIME_SF_TO_LV, false, "i", playerid);
					}
					else
					{
						SetPlayerPos(playerid, -1423.7013,-289.3624,14.1484);
						SendClientMessage(playerid, COLOR_YELLOW, "Kamu tidak mempunyai cukup uang untuk membeli tiket pesawat");
					}
				}
			}
		}
	}
	return 1;
}


forward LsAirport(playerid);
public LsAirport(playerid)
{
    SetPlayerInterior(playerid, 0);
	SetPlayerPos(playerid, 1683.7638,-2328.4575,13.5469);
	SendClientMessage(playerid, COLOR_GREEN, "Anda telah sampai di Los Santos International Airport");
}

forward LvAirport(playerid);
public LvAirport(playerid)
{
    SetPlayerInterior(playerid, 0);
	SetPlayerPos(playerid, 1678.3916,1447.6757,10.7751);
	SendClientMessage(playerid, COLOR_GREEN, "Anda telah sampai di Las Vegas International Airport");
}

forward SfAirport(playerid);
public SfAirport(playerid)
{
    SetPlayerInterior(playerid, 0);
	SetPlayerPos(playerid, -1423.9686,-290.2509,14.1484);
	SendClientMessage(playerid, COLOR_GREEN, "Anda telah sampai di San Fiero International Airport");
}
