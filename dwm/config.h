/* see LICENSE file for copyright and license details. */

/* mappings */
#define XF86AudioMute			0x1008ff12
#define XF86AudioLowerVolume	        0x1008ff11
#define XF86AudioRaiseVolume	        0x1008ff13
#define XF86TouchpadToggle		0x1008ffa9
#define XF86MonBrightnessUp		0x1008ff02
#define XF86MonBrightnessDown		0x1008ff03
#define XF86Display   0x1008ff59

/* appearance */
static const char *fonts[] = { "Hack:size=12" };
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { "#000000", "#f8eacf", "#f8eacf" },
	[SchemeSel]  = { "#ffffff", "#b3a995",  "#f8eacf"  },
};

static const unsigned int borderpx  = 0;        /* border pixel of windows */
static const unsigned int snap      = 8;       /* snap pixel */
static const unsigned int gappx     = 4;        /* gap between windows */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 0;        /* 0 means bottom bar */

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "idontlikerules",     NULL,       NULL,       0,            0,           -1 },
	/* { "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 }, */
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
    { "[]",       tile },
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod1Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, NULL };
static const char *duckduckgocmd[] = { "duckduckgo", NULL };
static const char *termcmd[]  = { "st", NULL };
static const char *rangercmd[]  = { "st", "-e", "ranger", NULL };
static const char *vol_down[] = { "bash", "/home/moritz/git/dotfiles/scripts/set_volume.sh", "-5%", NULL };
static const char *vol_up[] = { "bash", "/home/moritz/git/dotfiles/scripts/set_volume.sh", "+5%", NULL };
static const char *vol_toggle[] = { "pactl", "set-sink-mute", "0", "toggle", NULL };
static const char *brightness_down[] = { "bash", "/home/moritz/git/dotfiles/scripts/backlight.sh", "dec", NULL };
static const char *brightness_up[] = { "bash", "/home/moritz/git/dotfiles/scripts/backlight.sh", "inc", NULL };
static const char *configure_screens[] = { "bash", "/home/moritz/git/dotfiles/scripts/configure_screens.sh", NULL };
static const char *toggle_systray[] = {"bash", "/home/moritz/git/dotfiles/scripts/toggle_tray.sh", NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_d,      spawn,          {.v = dmenucmd } },
	{ MODKEY|ShiftMask,             XK_d,      spawn,          {.v = duckduckgocmd } },
	{ MODKEY,                       XK_Return, spawn,          {.v = rangercmd } },
	{ MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_u,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,                       XK_q,      killclient,     {0} },
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
	// { MODKEY,                       XK_s,      setlayout,      {.v = &layouts[0]} },
    { MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0] } },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	{ 0,                            XF86AudioRaiseVolume,      spawn, {.v = vol_up } },
	{ 0,                            XF86AudioLowerVolume,      spawn, {.v = vol_down } },
	{ 0,                            XF86AudioMute,             spawn, {.v = vol_toggle } },
	{ 0,                            XF86MonBrightnessUp,       spawn, {.v = brightness_up } },
	{ 0,                            XF86MonBrightnessDown,     spawn, {.v = brightness_down } },
	{ 0,                            XF86Display,               spawn, {.v = configure_screens } },
    { MODKEY,                       XK_grave,                  spawn, {.v = toggle_systray } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY,                       XK_z, zoom,           {0} },
};

/* button definitions */
/* click can be ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

